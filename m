From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 14 Feb 2008 13:15:43 -0800
Subject: [Buildroot] [buildroot 0002124]: Snapshot 2008/02/13 ARM 920t build
	error in coreutils
Message-ID: <33238f0372444fe5acbfa91489c1850e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2124 
====================================================================== 
Reported By:                Matthias Kaehlcke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2124
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-14-2008 11:26 PST
Last Modified:              02-14-2008 13:15 PST
====================================================================== 
Summary:                    Snapshot 2008/02/13 ARM 920t build error in
coreutils
Description: 
Building the Buildroot snapshot 2008/02/13 for ARM920t fails on my box with
a build error when compiling coreutils:

/data/private/prog/embedded/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os -pipe 
-I/data/private/prog/embedded/toolchains/buildroot/build_arm/staging_dir/usr/include
-I/data/private/prog/embedded/toolchains/buildroot/build_arm/staging_dir/include
--sysroot=/data/private/prog/embedded/toolchains/buildroot/build_arm/staging_dir/
-isysroot
/data/private/prog/embedded/toolchains/buildroot/build_arm/staging_dir
-mtune=arm920t  -I.      -g -O2 -c mbchar.c
In file included from mbchar.h:157,
                 from mbchar.c:22:
./wchar.h:41:12: error: empty filename in #include
In file included from mbchar.c:22:
mbchar.h:242: error: expected ')' before 'wc'
make[3]: *** [mbchar.o] Error 1

The host system is Debian Lenny with gcc v4.2.3 20071123

See the .config file for details about the target
====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 02-14-08 13:15  
---------------------------------------------------------------------- 
This is because you did not enable WCHAR before
the toolchain was built.

You basically need to start from scratch
(delete all build directories)
Enable WCHAR using menuconfig and restart. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-14-08 11:26  Matthias KaehlckeNew Issue                                    
02-14-08 11:26  Matthias KaehlckeStatus                   new => assigned     
02-14-08 11:26  Matthias KaehlckeAssigned To               => buildroot       
02-14-08 11:26  Matthias KaehlckeFile Added: config                           
02-14-08 13:15  UlfSamuelsson  Status                   assigned => closed  
02-14-08 13:15  UlfSamuelsson  Note Added: 0004844                          
======================================================================
