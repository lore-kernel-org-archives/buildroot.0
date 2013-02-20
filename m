From: Joe Halpin <jhalpin@luminatorusa.com>
Date: Wed, 20 Feb 2013 16:22:59 +0000
Subject: [Buildroot] build error: "fixdep: permission denied"
Message-ID: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I try to build, I've been getting either this error or "... fixdep: not found". After I get this error, if I run make again, it all completes with no other errors.

When I look at the directory, fixdep is there, and has the required permissions. I haven't been able to divine the problem from looking at the makefiles, so if anyone can point me in the right direction I'd appreciate it.

I've been googling this, but haven't found a solution yet. I've seen this in 2012.11, 2012.11.1 and 2013.02_rc2.

Here's example output:

>>>   Installing kernel headers
(cd /opt/test/buildroot-2013.02_rc2/output/toolchain/linux-3.2.38; \
     /usr/bin/make -j4 ARCH=i386 \
        HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" \
        HOSTCXX="/usr/bin/g++" \
        INSTALL_HDR_PATH=/opt/test/buildroot-2013.02_rc2/output/toolchain/linux headers_install; \
    )
make[1]: Entering directory `/opt/test/buildroot-2013.02_rc2/output/toolchain/linux-3.2.38'
  CHK     include/linux/version.h
  UPD     include/linux/version.h
  HOSTCC  arch/x86/tools/relocs
  HOSTCC  scripts/basic/fixdep
/bin/sh: 1: scripts/basic/fixdep: Permission denied
make[2]: *** [arch/x86/tools/relocs] Error 126
make[1]: *** [archscripts] Error 2
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/opt/test/buildroot-2013.02_rc2/output/toolchain/linux-3.2.38'
make: *** [/opt/test/buildroot-2013.02_rc2/output/toolchain/linux/.configured] Error 2

opus$ ls -l output/toolchain/linux-3.2.38/scripts/basic
total 32
-rw-rw-r-- 1 jhalpin jhalpin   671 Feb  5 22:33 Makefile
-rwxrwxr-x 1 jhalpin jhalpin 12602 Feb 20 06:21 fixdep*
-rw-rw-r-- 1 jhalpin jhalpin 10782 Feb  5 22:33 fixdep.c


Thanks

Joe
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130220/a1a3e683/attachment.html>
