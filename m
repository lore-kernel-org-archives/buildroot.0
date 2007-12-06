From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Dec 2007 12:43:13 -0800
Subject: [Buildroot] [buildroot 0001644]: libfuse / fuse compilation on
	avr32 broken
Message-ID: <25b40ef928b535bc017fe3d9a58af5f7@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1644 
====================================================================== 
Reported By:                dl9pf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1644
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-06-2007 12:43 PST
Last Modified:              12-06-2007 12:43 PST
====================================================================== 
Summary:                    libfuse / fuse compilation on avr32 broken
Description: 
The fuse/libfuse compilation fails on avr32:
config.status: creating config.h
touch
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/.configured
/usr/bin/make -j1
CC=/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc
-C /home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0
make[1]: Entering directory
`/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0'
Making all in kernel
make[2]: Entering directory
`/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/kernel'
/usr/bin/make -C
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/linux-2.6.22.10
SUBDIRS=`pwd`  modules
make[3]: Entering directory
`/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/linux-2.6.22.10'
  CC [M] 
/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/kernel/dev.o
cc1: error: unrecognized command line option "-m64"
cc1: error: unrecognized command line option "-mno-red-zone"
cc1: error: unrecognized command line option "-mcmodel=kernel"
cc1: error: unrecognized command line option "-maccumulate-outgoing-args"
make[4]: ***
[/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/kernel/dev.o]
Fehler 1
make[3]: ***
[_module_/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/kernel]
Fehler 2
make[3]: Leaving directory
`/home/dl9pf/user/ngw100/buildroot/svn/buildroot/project_build_avr32/atngw100/linux-2.6.22.10'
make[2]: *** [all-spec] Fehler 2
make[2]: Leaving directory
`/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/kernel'
make[1]: *** [all-recursive] Fehler 1
make[1]: Leaving directory
`/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0'
make: ***
[/home/dl9pf/user/ngw100/buildroot/svn/buildroot/build_avr32/fuse-2.7.0/.compiled]
Fehler 2

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-06-07 12:43  dl9pf          New Issue                                    
12-06-07 12:43  dl9pf          Status                   new => assigned     
12-06-07 12:43  dl9pf          Assigned To               => buildroot       
12-06-07 12:43  dl9pf          File Added: .config                          
======================================================================
