From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 21 Mar 2007 01:07:41 -0700
Subject: [Buildroot] [buildroot 0001279]: bad compiler version discover in
	dependencies.sh
Message-ID: <0f078fa21cee61833915d10ae0d7f8a1@busybox.net>
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
Last Modified:              03-21-2007 01:07 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-20-07 15:19  Franck78       New Issue                                    
03-20-07 15:19  Franck78       Status                   new => assigned     
03-20-07 15:19  Franck78       Assigned To               => buildroot       
03-20-07 15:20  Franck78       Issue Monitored: Franck78                    
03-20-07 15:37  Franck78       Note Added: 0002259                          
03-21-07 01:07  bernhardf      Note Added: 0002260                          
======================================================================
