From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 7 Sep 2007 11:55:54 -0700
Subject: [Buildroot] [buildroot 0001474]: toolchain build, arch x86_64 ,
	variant core2 does not build
Message-ID: <6a159fc7ac57e67bc6483273eb8d8d2d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1474 
====================================================================== 
Reported By:                myopiate
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1474
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-27-2007 02:04 PDT
Last Modified:              09-07-2007 11:55 PDT
====================================================================== 
Summary:                    toolchain build, arch x86_64 , variant core2 does
not build
Description: 
Problem:
Configuration for the x86_64 architecture with core2 variant stops on
build.

Cause:
gcc-4.2.1 does not accept --with-tune=core2.  Toolchain build dies.

Workaround:
Attached patch works around the problem by using --with-tune=generic.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-07-07 11:55  
---------------------------------------------------------------------- 
See ML archives for the correct solution (default core2 if
!GCC_VERSION_THIS && !GCC_VERSION_THAT; gcc-4.3 does support -mtune=core2
just fine, so the proposed solution is not correct). 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-27-07 02:04  myopiate       New Issue                                    
08-27-07 02:04  myopiate       Status                   new => assigned     
08-27-07 02:04  myopiate       Assigned To               => buildroot       
08-27-07 02:04  myopiate       File Added: core2-generic.patch                  
 
09-07-07 11:55  bernhardf      Status                   assigned => closed  
09-07-07 11:55  bernhardf      Note Added: 0002731                          
======================================================================
