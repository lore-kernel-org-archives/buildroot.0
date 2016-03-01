From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 01 Mar 2016 07:22:14 +0100
Subject: [Buildroot] [PATCH/next v9 01/28] package/freeswitch: new
	package
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <1456586838-21197-2-git-send-email-bernd.kuhls@t-online.de>
 <20160229222127.27db4013@free-electrons.com>
Message-ID: <m1pfqcxu66.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 29 Feb 2016 22:21:27 +0100 schrieb Thomas Petazzoni:

> This patch unfortunately does not build here. With the following
> defconfig:
> 
> BR2_arm=y BR2_TOOLCHAIN_EXTERNAL=y BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y #
> BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y BR2_SYSTEM_BIN_SH_NONE=y # BR2_PACKAGE_BUSYBOX is not
> set BR2_PACKAGE_FREESWITCH=y # BR2_TARGET_ROOTFS_TAR is not set
> 
> I get:
> 
>   CCLD     fs_ivrd
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function
> `lbnMemWipe':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/
libzrtp/third_party/bnlib/lbnmem.c:69:
> undefined reference to `zrtp_memset'
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function
> `lbnMemAlloc':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/
libzrtp/third_party/bnlib/lbnmem.c:78:
> undefined reference to `zrtp_sys_alloc'
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function
> `lbnMemFree':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/
libzrtp/third_party/bnlib/lbnmem.c:87:
> undefined reference to `zrtp_sys_free' collect2: error: ld returned 1
> exit status Makefile:1462: recipe for target 'fs_cli' failed make[4]:
> *** [fs_cli] Error 1 make[4]: *** Waiting for unfinished jobs....
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function
> `lbnMemWipe':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/
libzrtp/third_party/bnlib/lbnmem.c:69:
> undefined reference to `zrtp_memset'
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function
> `lbnMemAlloc':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/
libzrtp/third_party/bnlib/lbnmem.c:78:
> undefined reference to `zrtp_sys_alloc'
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function
> `lbnMemFree':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/
libzrtp/third_party/bnlib/lbnmem.c:87:
> undefined reference to `zrtp_sys_free' collect2: error: ld returned 1
> exit status Makefile:1470: recipe for target 'fs_ivrd' failed make[4]:
> *** [fs_ivrd] Error 1
> 
> *** Warning: Linking the shared library libfreeswitch.la against the ***
> static library libs/libzrtp/libzrtp.a is not portable!

Hi Thomas,

this is weird, using the same defconfig I can compile freeswitch without 
problems. Could you please pastebin your whole freeswitch configure log 
so I can compare it with mine?

Regards, Bernd
