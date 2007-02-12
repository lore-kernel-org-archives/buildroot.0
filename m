From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:58 -0800
Subject: [Buildroot] [buildroot 0000850]: buildroot-20060424.tar.bz2
	building powerpc fails almost immediately
Message-ID: <5b25098d9525bc5e933c6df243068d0f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=850 
====================================================================== 
Reported By:                dash
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   850
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-25-2006 11:27 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    buildroot-20060424.tar.bz2 building powerpc fails
almost immediately
Description: 
1) Unpack buildroot tarball to /tmp
2) Do make menuconfig
3) Make just one (1) change to the config -- select the "powerpc" for
the target architecture
4) Exit + save config
5) Do "make"

It will download linux-libc-headers-2.4.31.tar.bz2 then
uClibc-snapshot.tar.bz2,
do some unpacking + whatnot, then fails with the error below. It can't
find
powerpc-linux-uclibc-gcc, which I'm actually trying to build in the first
place.

make -C /tmp/buildroot/toolchain_build_powerpc/uClibc \
PREFIX=/tmp/buildroot/toolchain_build_powerpc/uClibc_dev/ \
DEVEL_PREFIX=/usr/ \
RUNTIME_PREFIX=/tmp/buildroot/toolchain_build_powerpc/uClibc_dev/ \
HOSTCC="gcc" \
        pregen install_dev && \
touch /tmp/buildroot/toolchain_build_powerpc/uClibc/.configured
/bin/sh: line 1:
/tmp/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc: No
such file or directory
make[1]:
/tmp/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/tmp/buildroot/toolchain_build_powerpc/uClibc'
g_dir/bin/powerpc-linux-uclibc-"make[1]:
/tmp/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc:
Command not found
B at make -C extra/config conf
/bin/sh: line 1:
/tmp/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc: No
such file or directory
make[2]:
/tmp/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc:
Command not found
&http://busybox.net/bugs/view.php?id=65533;B&http://busybox.net/bugs/view.php?id=65533;Bmake[2]:
/tmp/buildroot/build_powerpc/staging_dir/bin/powerpc-linux-uclibc-gcc:
Command not found
`B`Bmake[2]: *** No rule to make target `|', needed by
`../../extra/config/conf.o'.  Stop.
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory
`/tmp/buildroot/toolchain_build_powerpc/uClibc'
make: *** [/tmp/buildroot/toolchain_build_powerpc/uClibc/.configured]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 psm - 04-25-06 12:01  
---------------------------------------------------------------------- 
update make to 3.80 at least 

---------------------------------------------------------------------- 
 dash - 04-25-06 19:37  
---------------------------------------------------------------------- 
I was running old make 3.79 or so, switching to make 3.80 fixed it.
It'd be nice if buildroot would error out or something...

Thanks! 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 06:41  
---------------------------------------------------------------------- 
buildroot does not currently need make >= 3.80, but uClibc does.
uClibc-trunk already grew a check for the proper version of make, so
closing. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-25-06 11:27  dash           New Issue                                    
04-25-06 11:27  dash           Status                   new => assigned     
04-25-06 11:27  dash           Assigned To               => uClibc          
04-25-06 12:01  psm            Note Added: 0001327                          
04-25-06 19:37  dash           Note Added: 0001328                          
01-21-07 06:41  bernhardf      Status                   assigned => closed  
01-21-07 06:41  bernhardf      Note Added: 0002016                          
01-21-07 06:41  bernhardf      Resolution               open => no change
required
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
