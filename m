From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 18 Oct 2008 06:23:14 -0700
Subject: [Buildroot] [buildroot 0005504]: Mesa: compile process abortion
	requires a make realclean after
Message-ID: <1b2d484d2ace77cf19ed510478cb895d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5504 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5504
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2008 06:23 PDT
Last Modified:              10-18-2008 06:23 PDT
====================================================================== 
Summary:                    Mesa: compile process abortion requires a make
realclean after
Description: 
If the Mesa compilation process abort the next time show this errors
because main 'make' reconfigure the package one first compilation aborts
but reconfiguration of Mesa require a 'make realclean' before:

_i586/staging_dir" /usr/bin/make -j1 \
		MKDEP="makedepend -I$gccinc" \
		CC=/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
CXX=/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
CC_FOR_BUILD=/usr/bin/gcc \
		-C /home/roberto/gles/buildroot/build_i586/Mesa-7.0.3 linux-dri-x86
make[1]: Entering directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3'
Please run 'make realclean' before changing configs
make[1]: *** [linux-dri-x86] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3'
make: *** [/home/roberto/gles/buildroot/build_i586/Mesa-7.0.3/.built]
Error 2
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 06:23  robang74       New Issue                                    
10-18-08 06:23  robang74       Status                   new => assigned     
10-18-08 06:23  robang74       Assigned To               => buildroot       
======================================================================
