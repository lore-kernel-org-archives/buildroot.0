From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:10 -0800
Subject: [Buildroot] [buildroot 0001068]: install kernel header
	failure.(kernel-2.6.18)
Message-ID: <70d79166b4e3ff84c6228dd260f1d778@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1068 
====================================================================== 
Reported By:                jdiwu
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1068
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-09-2006 23:46 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    install kernel header failure.(kernel-2.6.18)
Description: 
configure options:

    Target Architecture : i386
    Target Architecture Variant : i686
    Linux 2.6.18 kernel headers

output of make like:
......
toolchain/patch-kernel.sh /buildroot/tc_toolchain_build_i686/linux-2.6.18
toolchain/kernel-headers linux-2.6.18\*.patch
(cd /buildroot/tc_toolchain_build_i686/linux-2.6.18 ; \
         make -j1 ARCH=i686
INSTALL_HDR_PATH=/buildroot/tc_toolchain_build_i686/linux
headers_install)
make[1]: Entering directory
`/buildroot/tc_toolchain_build_i686/linux-2.6.18'
Makefile:486:
/buildroot/tc_toolchain_build_i686/linux-2.6.18/arch/i686/Makefile: No
such file or directory
make[1]: *** No rule to make target
`/buildroot/tc_toolchain_build_i686/linux-2.6.18/arch/i686/Makefile'. 
Stop.
make[1]: Leaving directory
`/buildroot/tc_toolchain_build_i686/linux-2.6.18'
make: *** [/buildroot/tc_toolchain_build_i686/linux/.configured] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 14:29  
---------------------------------------------------------------------- 
This was already fixed. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-09-06 23:46  jdiwu          New Issue                                    
10-09-06 23:46  jdiwu          Status                   new => assigned     
10-09-06 23:46  jdiwu          Assigned To               => uClibc          
11-22-06 14:29  bernhardf      Status                   assigned => closed  
11-22-06 14:29  bernhardf      Note Added: 0001781                          
11-22-06 14:29  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
