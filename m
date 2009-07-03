From: Wenwei Zha <wenweizha@gmail.com>
Date: Thu, 2 Jul 2009 23:46:37 -0400
Subject: [Buildroot] buildroot with ELDK 4.1
Message-ID: <b1907d090907022046l5fba3d82q1a1f80dbed7c3c6f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just started to learn using buildroot to build a root file system. I
would like to use ELDK 4.1 as my toolchain but has some problem.

I might have some improper settings, but "make saveconfig" gives me no
error and "make" (without busybox) seems to be fine.

However, when I enable busybox installation, I can't go through
"make". I encounter error at this command:

/usr/bin/make -j1 CC=/home/wenwei/ELDK/usr/bin/ppc_4xx-gcc
CROSS_COMPILE="/home/wenwei/ELDK/usr/bin/ppc_4xx-"
CROSS="/home/wenwei/ELDK/usr/bin/ppc_4xx-"
PREFIX="/home/wenwei/temp/temp/buildroot-2009.05/project_build_powerpc/linux_26_ml410/root"
ARCH=powerpc EXTRA_CFLAGS="-Os -pipe -Os  --sysroot
/home/wenwei/temp/temp/buildroot-2009.05/build_powerpc/staging_dir/"
-C /home/wenwei/temp/temp/buildroot-2009.05/project_build_powerpc/linux_26_ml410/busybox-1.14.1


make[1]: Entering directory
`/home/wenwei/temp/temp/buildroot-2009.05/project_build_powerpc/linux_26_ml410/busybox-1.14.1'
 SPLIT   include/autoconf.h -> include/config/*
 GEN     include/bbconfigopts.h
 HOSTCC  applets/usage
applets/usage.c: In function ?main?:
applets/usage.c:32: warning: ignoring return value of ?write?,
declared with attribute warn_unused_result
 GEN     include/usage_compressed.h
 HOSTCC  applets/applet_tables
 GEN     include/applet_tables.h
 CC      applets/applets.o
cc1: error: unrecognized command line option "-fsysroot"
                                                                 ~~~~~~~~~~

Why I get this error? Is there some issue with ELDK? It seems to me
that buildroot comes with uClib but ELDK should work ....

Anybody went through the same error? Please give some help.

best regards
