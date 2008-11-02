From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 2 Nov 2008 09:05:22 -0800
Subject: [Buildroot] [buildroot 0005504]: Mesa: compile process abortion
	requires a make realclean after
Message-ID: <89a1927689d044c04dab7f331ffa1f77@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              11-02-2008 09:05 PST
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

---------------------------------------------------------------------- 
 tpk5010 - 11-02-08 09:05  
---------------------------------------------------------------------- 
Forcing a rebuild of Mesa from the beginning by doing a rm -R
build-i586/Mesa-7.0.3 fixes the issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-08 06:23  robang74       New Issue                                    
10-18-08 06:23  robang74       Status                   new => assigned     
10-18-08 06:23  robang74       Assigned To               => buildroot       
10-18-08 06:23  robang74       Issue Monitored: robang74                    
11-02-08 09:05  tpk5010        Note Added: 0014864                          
======================================================================
