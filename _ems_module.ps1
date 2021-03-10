Function Initialize_AWS {
    <#
    Mandatory Parameters: -AccessKey, -SecretKey
    Example: Initialize_AWS -AccessKey My_Access_Key -SecretKey My_Secret_Key
    Returns: $True or $False 
    Dependency: AWS SDK Powershell module
    
    #>
    
    
	[CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)]
        [string]$AccessKey,
		[Parameter(Mandatory=$true)]
        [string]$SecretKey
    )
	
	$AWS_Module = "C:\EMS\modules\aws\AWSPowerShell.psd1"
	If (!(Test-Path -Path $AWS_Module)) {$AWS_Initialized = $False}
	Else {
		Try {
			Import-Module $AWS_Module
			Set-AWSCredentials -AccessKey $AccessKey -SecretKey $SecretKey
			$AWS_Initialized = $True
		}
		Catch {$AWS_Initialized = $False}
	}
	Return $AWS_Initialized

}