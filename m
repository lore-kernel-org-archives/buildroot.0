From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 14 Apr 2016 21:04:42 +0200
Subject: [Buildroot] [PATCH v12 01/31] package/freeswitch: new package
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
 <1460281299-2385-2-git-send-email-bernd.kuhls@t-online.de>
 <20160413230219.73e299ea@free-electrons.com>
Message-ID: <XnsA5EAD66C23949ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote 
in news:20160413230219.73e299ea at free-electrons.com:

> I'm sorry, but this still doesn't build, with the exact same error I
> had in my previous test of the freeswitch package:

no need for excuses, I also want to make the autobuilders happy ;)

>   CCLD   fs_cli
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemWipe':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/libs/libzrtp/third_party/bnlib/lbnmem.c:69: 
undefined reference to `zrtp_memset'
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemAlloc':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/libs/libzrtp/third_party/bnlib/lbnmem.c:78: 
undefined reference to `zrtp_sys_alloc'
> libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemFree':
> /home/thomas/projets/buildroot/output/build/freeswitch-1.6.7/libs/libzrtp/third_party/bnlib/lbnmem.c:87: 
undefined reference to `zrtp_sys_free'

I had a fix for this problem in freeswitch 1.6.6:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/141985

With freeswitch 1.6.7 this fix will not work anymore because after the
necessary autoreconf libtool will add STAGING_DIR as rpath when my
patch is applied which breaks compilation with
BR2_COMPILER_PARANOID_UNSAFE_PATH=y

Therefore v13 of my patch series will move the libuuid patch into the
initial package patch and make libuuid and wchar toolchain support
mandatory.

Regards, Bernd
