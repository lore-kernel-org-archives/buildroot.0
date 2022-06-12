Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750FBC43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 14:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0AB83EBA;
	Sun, 12 Jun 2022 14:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1CTfJIi9xAf; Sun, 12 Jun 2022 14:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA8D683E9E;
	Sun, 12 Jun 2022 14:56:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27C2E1BF487
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 14:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24EA683E9E
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 14:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miUAOp73E8Fa for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 14:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 875B083E95
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 14:56:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0E488780350;
 Sun, 12 Jun 2022 16:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655045785;
 bh=7Ag67fpFHO3m6pEjAo3YzoTq2zVkuXUQMjjTKnQGBb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WnXBcMwCl19xVlCQXwCWBIiXN5SVBlioSRX4hjVTXucIeIebRroM6Bu4u7pi0GKPP
 15dlsbJMH+jXw6mMbsrzq5vZ/gwuMt/OslKOi0jXwZvbFmzIGZ7Qjw7oOb2QEFJldK
 jtS6wQsvzk1GGaaqsF2TXENCmEwNyZ5YCOHeaBMCuPnCVn36bPSveGnimi+0EpTFlW
 aXRLAGhn4v2yVOK2fSoLfSYrTtk5pj6XffDE7nN6x1hvjcNs2+/BOOlMabiErIE7PJ
 LRj4cVFkxFxoigEDI2fMUaqwlCVMYQqL/Hkpm2vS2iH4PN0AvRVIMxy7vPVxA5bLk+
 U6BmHDwNbgCwA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 16:56:21 +0200
Date: Sun, 12 Jun 2022 16:56:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612145621.GD427639@scaer>
References: <20220612085616.1875054-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220612085616.1875054-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
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

On 2022-06-12 10:56 +0200, Fabrice Fontaine spake thusly:
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
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix the following check-package error:
>   package/zstd/zstd.mk:67: conditional override of variable ZSTD_BUILD_LIBS
>   package/zstd/zstd.mk:70: conditional override of variable ZSTD_BUILD_LIBS

You weantr my opinion in this? Those := overrides are wrong to begin
with.

So we should probably have:

    ZSTD_BUILD_LIBS_BASENAMES = libzstd.pc
    ifeq ($(BR2_STATIC_LIBS),y)
    ZSTD_BUILD_LIBS_BASENAMES += libzstd.a
    ZSTD_INSTALL_LIBS = install-static
    else ifeq ($(BR2_SHARED_LIBS),y)
    ZSTD_BUILD_LIBS_BASENAMES += lib
    ZSTD_INSTALL_LIBS = install-shared
    else
    ZSTD_BUILD_LIBS_BASENAMES += lib
    ZSTD_INSTALL_LIBS = install-static install-shared
    endif

    ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
    ZSTD_OPTS += HAVE_THREAD=1
    ZSTD_BUILD_LIBS_THREAD_SUFFIX = -mt
    else
    ZSTD_OPTS += HAVE_THREAD=0
    ZSTD_BUILD_LIBS_THREAD_SUFFIX = --nomt
    endif

    ZSTD_BUILD_LIBS = \
        $(addsuffix -release, \
            $(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX),\
                $(ZSTD_BUILD_LIBS_BASENAMES)))

And that would be a much better code, much easier to understand, and
that would not deviate from our usual coding style.

Regards,
Yann E. MORIN.

>  package/zstd/zstd.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index bef46deae8..b885506cca 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -39,13 +39,13 @@ endif
>  ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION) -D_GNU_SOURCE"
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
> -ZSTD_BUILD_LIBS = libzstd.a
> +ZSTD_BUILD_LIBS = libzstd.a libzstd.pc
>  ZSTD_INSTALL_LIBS = install-static
>  else ifeq ($(BR2_SHARED_LIBS),y)
> -ZSTD_BUILD_LIBS = lib
> +ZSTD_BUILD_LIBS = lib libzstd.pc
>  ZSTD_INSTALL_LIBS = install-shared
>  else
> -ZSTD_BUILD_LIBS = lib
> +ZSTD_BUILD_LIBS = lib libzstd.pc
>  ZSTD_INSTALL_LIBS = install-static install-shared
>  endif
>  
> @@ -73,7 +73,7 @@ ZSTD_BUILD_LIBS := $(addsuffix -release,$(ZSTD_BUILD_LIBS))
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
