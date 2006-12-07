From: Doug Brewer <brewer.doug@gmail.com>
Date: Thu, 7 Dec 2006 20:48:03 +0800
Subject: [Buildroot] Error on compiling busybox using buildroot for mipsel
Message-ID: <b2ec5cad0612070448k18505301y83362b48b8afed4c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I used buildroot to build mipsel crss-compiler and busybox. While compilng
on busybox, I encounter errors:

make[1]: Leaving directory `/home/brewer/buildroot/build_mipsel/busybox'
touch /home/brewer/buildroot/build_mipsel/busybox/.configured
make -j1 CC=/home/brewer/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-ucl
ibc-gcc CROSS_COMPILE="/home/brewer/buildroot/build_mipsel/staging_dir/bin/mipse
l-linux-uclibc-" \
                CROSS="/home/brewer/buildroot/build_mipsel/staging_dir/bin/mipse
l-linux-uclibc-" PREFIX="/home/brewer/buildroot/build_mipsel/root" \
                EXTRA_CFLAGS="-Os -pipe " -C /home/brewer/buildroot/build_mipsel
/busybox
make[1]: Entering directory `/home/brewer/buildroot/build_mipsel/busybox'
  SPLIT   include/autoconf.h -> include/config/*
  GEN     include/bbconfigopts.h
  HOSTCC  applets/usage
  GEN     include/usage_compressed.h
  CC      applets/applets.o
cc1: error: invalid option `preferred-stack-boundary=2'
applets/applets.c:1: error: bad value (i386) for -march
Assembler messages:
Error: Bad value (i386) for -march
make[2]: *** [applets/applets.o] Error 1
make[1]: *** [applets] Error 2
make[1]: Leaving directory `/home/brewer/buildroot/build_mipsel/busybox'

It looks that buildroot passed the wrong arch for busybox? Thanks.

BR,
Doug.
