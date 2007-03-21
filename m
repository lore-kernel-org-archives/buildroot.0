From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 21 Mar 2007 03:11:41 -0700
Subject: [Buildroot] [buildroot 0001279]: bad compiler version discover in
	dependencies.sh
Message-ID: <0656eb331fe32953014973fca504173d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1279 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1279
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-20-2007 15:19 PDT
Last Modified:              03-21-2007 03:11 PDT
====================================================================== 
Summary:                    bad compiler version discover in dependencies.sh
Description: 
Hello,
I don't know wheter or not $HOSTCC have to be defined before lauching
'make'.

Anyway, when not configured, the following test fails:
COMPILER=$(which $HOSTCC)

'which' gracefully respond with helps text....
that next $XSED is unable to understand ;)

file:
toolchain/dependencies/dependencies.sh; line
http://busybox.net/bugs/view.php?id=208#152


Bye
====================================================================== 

---------------------------------------------------------------------- 
 Franck78 - 03-20-07 15:37  
---------------------------------------------------------------------- 
same for $HOSTCXX, next test.

Note also 'head' is used before testing presence by the script. 

---------------------------------------------------------------------- 
 bernhardf - 03-21-07 01:07  
---------------------------------------------------------------------- 
HOSTCC and HOSTCXX are optional.

Please post the exact error you are seeing.

I don't understand why you point to an unrelated comment? Please
elaborate. 

---------------------------------------------------------------------- 
 Franck78 - 03-21-07 02:55  
---------------------------------------------------------------------- 
Hello,

Just log all the make programs output to see details of the error.
Or ever simpler: go directly in dependencies subir and lauch
dependencies.sh.
It tests every needed support program presence (except for 'head')
and it completly fails the compiler test version
WHEN HOSTCC IS NOT SET (then HOSTCXX)
Can't be more clear than that, sorry.

Asking 'which something' returns pathto something
Asking 'which' returns which's syntax usage.

Guess what happens when HOSTSCC is empty....

Franck 

---------------------------------------------------------------------- 
 Franck78 - 03-21-07 03:11  
---------------------------------------------------------------------- 
I understand why you don't understand the comment...

The link-pointer was a real text entered by me and it is the mantis bug
tracking system that replaced it.

http://busybox.net/bugs/view.php?id=222#172=> was "~~ line 172
~x172 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-20-07 15:19  Franck78       New Issue                                    
03-20-07 15:19  Franck78       Status                   new => assigned     
03-20-07 15:19  Franck78       Assigned To               => buildroot       
03-20-07 15:20  Franck78       Issue Monitored: Franck78                    
03-20-07 15:37  Franck78       Note Added: 0002259                          
03-21-07 01:07  bernhardf      Note Added: 0002260                          
03-21-07 02:55  Franck78       Note Added: 0002261                          
03-21-07 03:11  Franck78       Note Added: 0002262                          
======================================================================
