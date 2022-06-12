Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D773C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 17:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 647B880B61;
	Sun, 12 Jun 2022 17:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fre9hx1HQrZr; Sun, 12 Jun 2022 17:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D2968338B;
	Sun, 12 Jun 2022 17:13:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA8C1BF2A6
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 17:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AF8E8338B
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 17:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zS1y9O7WZ_x9 for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 17:13:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47B8E83336
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 17:13:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 16BFA780350;
 Sun, 12 Jun 2022 19:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655054002;
 bh=ZYbgNw7VPc3PpNopMdAYZ9k9e1uMpipM88KXdDBHR/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kGUeGy8uYuL1WUIkkqAS/MJ1XGRbShsfq1FiuvA7KBorQQlJNtS8Kz+mA2Jh6Kb1E
 rxTzzlJZC5ciYR7WVUElA7Qt9z7zMottfwWgmlIHkRMR0Fkv/ZaIGxVKVRUAkfci4P
 AF1u+p8c9kBgbqSaccpwRKe5NwT9okHImNzD/6zQg0AeX+wlwqwCRTnwVh7RZwdUld
 t9l8O3FibIdCaC/XHGOega+D5uKqdQYqhCnLX8r9w8T0mVEJOJKVwOeWIQEnpn1oLs
 32PMbHJpmmcUgozAPu+cYmNq54wlq8lNZ11+Mgr7kiwwWytIzUDt9ZqM+RV8Av1JQe
 PgrFQTqPcq9wA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 19:13:18 +0200
Date: Sun, 12 Jun 2022 19:13:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612171318.GH427639@scaer>
References: <20220612160217.2210177-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220612160217.2210177-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/zstd: fix build without threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-12 18:02 +0200, Fabrice Fontaine spake thusly:
> Move libzstd.pc in ZSTD_BUILD_LIBS so it will be suffixed by -nomt
> without threads. As a result, libzstd.pc will not contain -pthread in
> Libs.Private which will avoid the following static build failure with
> zchunk) raised since commit 0f0e913f10caf21f23c2e46f210519a7a3bc0b32:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc  -o src/unzck src/unzck.p/unzck.c.o src/unzck.p/util_common.c.o -Wl,--as-needed -Wl,--no-undefined -static -Wl,--start-group src/lib/libzck.a -largp /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libzstd.a -pthread /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/instance-2/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a -Wl,--end-group
> /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/10.3.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: cannot find -lpthread
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/481d1979920daaecac48dec763151e124651740f

So, I was very curious how the weird buildsystem for zstd would cope,
and I am afraid it does not cope well:

    $ wget -O .config 'http://autobuild.buildroot.org/results/481d1979920daaecac48dec763151e124651740f/config'
    $ make menuconfig
        -> switch to a bootlin toolchain (uClibc only, similar to the
           failing build)
    $ make zstd
    $ cat output/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig/libzstd.pc
    #   ZSTD - standard compression algorithm
    #   Copyright (C) 2014-2016, Yann Collet, Facebook
    #   BSD 2-Clause License
    #   (http://www.opensource.org/licenses/bsd-license.php)

    prefix=/usr
    exec_prefix=${prefix}
    includedir=${prefix}/include
    libdir=${exec_prefix}/lib

    Name: zstd
    Description: fast lossless compression algorithm library
    URL: http://www.zstd.net/
    Version: 1.5.2
    Libs: -L${libdir} -lzstd
    Libs.private: -pthread
    Cflags: -I${includedir}

So, we still have -pthread in Libs.Private, which goes contrary to what
you wrote in the commit message...

And sure enough, the build still fails:

    $ make zchunk
    [success]

Wait, what?

Hold on a sec... What happens without your patch applied?

    $ make clean
    $ make zstd
    $ cat output/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig/libzstd.pc
    #   ZSTD - standard compression algorithm
    #   Copyright (C) 2014-2016, Yann Collet, Facebook
    #   BSD 2-Clause License
    #   (http://www.opensource.org/licenses/bsd-license.php)

    prefix=/usr
    exec_prefix=${prefix}
    includedir=${prefix}/include
    libdir=${exec_prefix}/lib

    Name: zstd
    Description: fast lossless compression algorithm library
    URL: http://www.zstd.net/
    Version: 1.5.2
    Libs: -L${libdir} -lzstd
    Libs.private: -pthread
    Cflags: -I${includedir}

    $ make zchunk
    [success]

Damned... :-/

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Yann E. Morin):
>  - Drop ZSTD_BUILD_LIBS overrides
> 
> Changes v1 -> v2:
>  - Fix the following check-package error:
>    package/zstd/zstd.mk:67: conditional override of variable ZSTD_BUILD_LIBS
>    package/zstd/zstd.mk:70: conditional override of variable ZSTD_BUILD_LIBS
> 
>  package/zstd/zstd.mk | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index bef46deae8..75eb6ecc07 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -38,14 +38,15 @@ endif
>  # zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
>  ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"
>  
> +ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
>  ifeq ($(BR2_STATIC_LIBS),y)
> -ZSTD_BUILD_LIBS = libzstd.a
> +ZSTD_BUILD_LIBS_BASENAMES += libzstd.a
>  ZSTD_INSTALL_LIBS = install-static
>  else ifeq ($(BR2_SHARED_LIBS),y)
> -ZSTD_BUILD_LIBS = lib
> +ZSTD_BUILD_LIBS_BASENAMES += lib
>  ZSTD_INSTALL_LIBS = install-shared
>  else
> -ZSTD_BUILD_LIBS = lib
> +ZSTD_BUILD_LIBS_BASENAMES += lib
>  ZSTD_INSTALL_LIBS = install-static install-shared
>  endif
>  
> @@ -63,17 +64,20 @@ endif
>  # purpose.
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  ZSTD_OPTS += HAVE_THREAD=1
> -ZSTD_BUILD_LIBS := $(addsuffix -mt,$(ZSTD_BUILD_LIBS))
> +ZSTD_BUILD_LIBS_THREAD_SUFFIX = -mt
>  else
>  ZSTD_OPTS += HAVE_THREAD=0
> -ZSTD_BUILD_LIBS := $(addsuffix -nomt,$(ZSTD_BUILD_LIBS))
> +ZSTD_BUILD_LIBS_THREAD_SUFFIX = -nomt
>  endif
>  # check-package disable OverriddenVariable - override intended
> -ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
> +ZSTD_BUILD_LIBS = \
> +	$(addsuffix -release, \
> +		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
> +			$(ZSTD_BUILD_LIBS_BASENAMES)))
>  
>  define ZSTD_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> -		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
> +		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>  		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
>  endef
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
