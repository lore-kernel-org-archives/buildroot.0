Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7F683E85;
	Sun, 12 Jun 2022 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMBESMQut0f4; Sun, 12 Jun 2022 19:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C77098338B;
	Sun, 12 Jun 2022 19:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5EE1BF3AB
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 19:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6672A8338B
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4AOVHsMZCZ0G for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 19:36:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC6D83336
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 19:36:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5C21C7802FE;
 Sun, 12 Jun 2022 21:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655062599;
 bh=sl+CIEDUk5KYsieqrXeVgPWvEz2Q7f2xwdbtIf3nBMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X06umx1/sES5vSUwx2bztYLXolh0rd+Pc89H9jhd8CNR8eoC2a3cgMXmvrCzMN0Ke
 iYBbAXcml2yIj39I3TtJH4LYkBzmoOEx3iRMMSCd6PESE/Nbkxq2cm3ZUBI0qBcovL
 UkNnI4+JMqY2AjCA6fDme5inB/TMLP2vncOurBDr/TbF/BHQCr4+3bCvLenSQXPB5E
 30fVLyNDDzfc+V/v99Od6YVgeAuBs9UgQP3XnfasYXwT87sHLArWaoibcFscwznq8z
 +gFyBC4xZA7Knx3D63FxeSFnKooEgTbGHnkMcah9Fwteo6fqeO/9HCalgW15YhoOUI
 M2Hnrfizirc5w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 21:36:36 +0200
Date: Sun, 12 Jun 2022 21:36:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612193636.GK427639@scaer>
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
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So, after all my goofiness, we know that there is no regression on
thread-enabled toolchains.

So...

Applied to master, thanks. And sorry for the confusion...

Regards,
Yann E. MORIN.

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
