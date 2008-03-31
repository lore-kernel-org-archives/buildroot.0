From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 31 Mar 2008 16:54:31 -0700 (PDT)
Subject: [Buildroot]  wrong patches placed inside toolchain/gdb/6.7.1
Message-ID: <16400898.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am trying to use 31/3/2008 buildroot snapshot for building arm9 toolchain. 

i have selected gdb-6.7.1 for compilation. while compilling  gdb i get below
error message

#
# Now for the ugly 3.3.x soft float hack...
#
#
# Ok... that's enough of that.
#
mkdir -p /opt/buildroot/project_build_arm/uclibc/root/usr/lib
/opt/buildroot/project_build_arm/uclibc/root/usr/sbin
touch /opt/buildroot/toolchain_build_arm/gcc-4.2.3-final/.installed
# These are in /lib, so...
rm -rf /opt/buildroot/project_build_arm/uclibc/root/usr/lib/libgcc_s*.so*
cp -dpf
/opt/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/libgcc_s*
\
                /opt/buildroot/project_build_arm/uclibc/root/lib/
cp -dpf
/opt/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/libstdc++.so*
\
                /opt/buildroot/project_build_arm/uclibc/root/usr/lib/
touch /opt/buildroot/toolchain_build_arm/gcc-4.2.3-final/.libs_installed
mkdir -p /opt/buildroot/toolchain_build_arm
bzcat /opt/buildroot/dl/gdb-6.7.1.tar.bz2 | tar -C
/opt/buildroot/toolchain_build_arm   -xf -
toolchain/patch-kernel.sh /opt/buildroot/toolchain_build_arm/gdb-6.7.1
toolchain/gdb/6.7.1 \*.patch

Applying 100-uclibc-conf.patch using plaintext:
patching file bfd/configure
Hunk #1 FAILED at 3579.
1 out of 1 hunk FAILED -- saving rejects to file bfd/configure.rej
patching file libtool.m4
Hunk #1 succeeded at 2370 with fuzz 2 (offset 1619 lines).
can't find file to patch at input line 34
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff -rNdup gdb-6.6.orig/ltconfig gdb-6.6/ltconfig
|--- gdb-6.6.orig/ltconfig      2006-07-04 22:31:03.000000000 +0200
|+++ gdb-6.6/ltconfig   2007-05-14 10:35:50.000000000 +0200
--------------------------
File to patch:                                                       



When i checked the toolchain/gdb/6.7.1 directory for patches,
100-uclibc-conf.patch & 600-fix-compile-flag-mismatch.patch have patches for
gdb-6.6 and not gdb-6.7.1.

Kindly update if i am wrong.

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/wrong-patches-placed-inside-toolchain-gdb-6.7.1-tp16400898p16400898.html
Sent from the BuildRoot mailing list archive at Nabble.com.
