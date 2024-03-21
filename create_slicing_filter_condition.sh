filterProperty="Name"
tests=$1
testCount=${#tests[@]}
totalAgents=$SYSTEM_TOTALJOBSINPHASE
agentNumber=$SYSTEM_JOBPOSITIONINPHASE
if [ $totalAgents -eq 0 ]; then totalAgents=1; fi
if [ -z "$agentNumber" ]; then agentNumber=1; fi
echo "Total agents: $totalAgents"
echo "Agent number: $agentNumber"
echo "Total tests: $testCount"
echo "Target tests:"
targetTestName=${tests[$i -1]}
echo "$targetTestName"
filter+="|${filterProperty}=${targetTestName}"
done
filter=${filter#"|"}
echo "##vso[task.setvariable variable=targetTestsFilter]$filter"