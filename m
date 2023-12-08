Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37581C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 21:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D868C409DD;
	Fri,  8 Dec 2023 21:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D868C409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLvyOBEEgTy0; Fri,  8 Dec 2023 21:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2CA643877;
	Fri,  8 Dec 2023 21:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2CA643877
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E17671BF417
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B982B43877
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B982B43877
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPtJlpmeYB-0 for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 21:29:10 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD23243889
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 21:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD23243889
Received: from ymorin.is-a-geek.org (unknown [90.11.76.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 33A1F5FFA3;
 Fri,  8 Dec 2023 22:29:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 08 Dec 2023 22:29:01 +0100
Date: Fri, 8 Dec 2023 22:29:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Message-ID: <ZXOKnam_BHQNarNt@landeda>
References: <20231208174217.29735-1-louis.chauvet@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208174217.29735-1-louis.chauvet@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702070946;
 bh=c+Tz06UStcG/8JYsWD04eh/u6ejfcgncxxogiy11pPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhhMVdWtpdgaDVnZ8+DvBZt3Rg5KuumdmO8Bnf9HI8G7n+YLuyThBAVeBZ0F1gAbn
 JTVPJ3uCMvCw++93YYRMKBdWs+2HJaHUuuA9mkXJVVpvXNROaTHznqhPQxYWPIQK39
 GDCPhFKLnv80/rpaHvniSs72r/7mfskc7e8/oVXkGDLtdOWHJ0sU4+wqbsN5ZPjsL4
 1QTOfKVa4VM93jb36T0lbHF/gYmMApc5n/WxSA+UxiuPVK3UvYTHCgyXXe9x2YqyhU
 deeLC+T5gwKqM68IFnMl+sCqy/V91xTlBfL3MDwRPqIm3ky4KpXSiseOjuL0XRAHcT
 WIQi6VGtVg4QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FhhMVdWt
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the RPATH
 of fiptool
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Louis, All,

On 2023-12-08 18:42 +0100, Louis Chauvet via buildroot spake thusly:
> The arm-trusted-firmware package builds a host tool called "fiptool",
> which is used during the build process of arm-trusted-firmware
> itself. This tool links against the OpenSSL host library, and
> therefore needs to be built with the correct RPATH pointing to
> $HOST_DIR/lib.
> 
> This is why commit a957d9a90ade4194dffe3eb2fc0136bc5d077c28
> ("boot/arm-trusted-firmware: build fiptool separately with dependency
> o n host-openssl") added the ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
> variable, which builds the fiptool tool first, with the right
> variables set, before invoking the full build of TF-A. This ensured
> that fiptool was built with the correct RPATH.
> 
> However, more recent versions of TF-A have modified their Makefile
> machinery, and fiptool is being rebuilt even if it was built
> before. Unfortunately, this rebuild is no longer done with the right
> flags, so we end up with a fiptool binary that no longer has the right
> RPATH, and fiptool fails to find the OpenSSL libraries from
> $HOST_DIR/lib.
> 
> In order to fix this, we take a different approach: we do not build
> fiptool separately first, but we inject the necessary flags through
> the HOSTCC variable. Indeed, there's no HOST_LDFLAGS or HOST_LDLIBS
> variable or similar that would allow us to pass the -Wl,-rpath flag
> that is needed. Shoe-horning this flag into HOSTCC gets the job done,
> and actually simplifies our arm-trusted-firmware.mk.
> 
> This patch break the compatibility with version prior to 1.4 (upstream
> commit 72610c4102990 ("build: Introduce HOSTCC flag")). v1.4 is very old
> (July 2017), not used anymore in-tree and probably not used anymore
> outside the tree.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Co-authored-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Previous version:
>    https://lore.kernel.org/buildroot/20231206164437.22191-1-louis.chauvet@bootlin.com/
> 
> Changes v1->v2:
>    Update commit log about compatibilty
> 
> 
>  .../arm-trusted-firmware/arm-trusted-firmware.mk | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 049beed36a91..bed873a1821c 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -63,7 +63,8 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>  	BUILD_STRING=$(ARM_TRUSTED_FIRMWARE_VERSION) \
>  	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
>  	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
> -	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD)
> +	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
> +	HOSTCC="$(HOSTCC) $(HOST_LDFLAGS)"
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> @@ -147,18 +148,6 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
>  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
>  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
> -# fiptool only exists in newer (>= 1.3) versions of ATF, so we build
> -# it conditionally. We need to explicitly build it as it requires
> -# OpenSSL, and therefore needs to be passed proper variables to find
> -# the host OpenSSL.
> -define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
> -	if test -d $(@D)/tools/fiptool; then \
> -		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/fiptool \
> -			$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
> -			CPPFLAGS="$(HOST_CPPFLAGS)" \
> -			LDLIBS="$(HOST_LDFLAGS) -lcrypto" ; \
> -	fi
> -endef
>  endif
>  
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
> @@ -206,7 +195,6 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
>  	$(if $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH),
>  		cp -f $(ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH) $(@D)/fdts/
>  	)
> -	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
>  	$(ARM_TRUSTED_FIRMWARE_MAKE_ENV) $(MAKE) -C $(@D) \
>  		$(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
>  		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
> -- 
> 2.41.0
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
