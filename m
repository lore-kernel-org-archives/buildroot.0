Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70615C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B1BE40642;
	Sun,  7 May 2023 21:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1BE40642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgJPo2d-MwUi; Sun,  7 May 2023 21:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15A874059C;
	Sun,  7 May 2023 21:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A874059C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7C81BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3479381B52
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3479381B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z8Bu4FqJuExr for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:08:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2585481AAD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2585481AAD
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:08:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2358E2003D3;
 Sun,  7 May 2023 23:08:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:08:41 +0200
Date: Sun, 7 May 2023 23:08:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230507210841.GN252090@scaer>
References: <20230505034318.1903-1-james.d.knight@live.com>
 <SN4P221MB0682333AB41986F29B75010BA0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682333AB41986F29B75010BA0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683493724;
 bh=OwCziI83xxBFrW7kIIxGuld+/IPmrVZdfJifh9wAbu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=doHob/SFDgoS5p1Jqv3N/ouMczis/C+G+EA9/3QPaX6Pq6ww2UVpQ8+XN1UWLr7Mi
 C/QpTWZVQEY/iO+N/91q8zkKijJVF/E98XqzVBolHvG7aXk8+GjNxgAdYnFt1M6RXq
 AH5r31DA+8UmNUlRBOnCmcWw2OTKrHLTBL1ZD9sAW6CK69VHHNVH8iPnPj5pJL9zM7
 aEYSXmPWkfDF1JyDSB+iJFhxCeRWEBfIkNEXSZLKSiwCqn6V4zHt2JAmf1V98HMRJT
 lIj8RLT8RWiDp57kU+FmlGpgx5S0cOguKekSqg/iSIV6w3WWTOHApGTuDzmi57y96t
 EuhWlIC6u6lmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=doHob/SF
Subject: Re: [Buildroot] [PATCH 2/2] linux: cleanup kconfig fixup processing
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-05-04 23:43 -0400, James Knight spake thusly:
> The following is an attempt o cleanup the output generated when fixing
> up a Linux's Kconfig:
> 
> - Quiet the conditional check host-pahole to avoid having the message
>    used to describe a failure generate in the output in its script form.
> - Suppress the initfamfs comments that is mainly for developers
>    managing the implementation.
> - Adding a generic "updating Kconfig..." message, to help inform
>    builders that the framework is actively processing Kconfig's (while
>    users may be pondering why the closing of a `linux-menuconfig` is
>    doing).
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  linux/linux.mk | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 37797fc4f0e1b3fc4b05fa2ceeb0bdfbec9cdc3f..32b1213433636606a6629b333cc01bacf5843a47 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -127,7 +127,7 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
>  LINUX_DEPENDENCIES += host-pahole
>  else
>  define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
> -	if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
> +	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
>  		echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole (BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE)" 1>&2; \
>  		exit 1; \
>  	fi
> @@ -367,6 +367,7 @@ endef
>  endif
>  
>  define LINUX_KCONFIG_FIXUP_CMDS
> +	@echo "updating Kconfig..."

We have a macro to display messages, so I've used that instead.

>  	$(if $(LINUX_NEEDS_MODULES),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES))
>  	$(call KCONFIG_ENABLE_OPT,$(strip $(LINUX_COMPRESSION_OPT_y)))
> @@ -401,10 +402,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_64K_PAGES))
>  	$(if $(BR2_TARGET_ROOTFS_CPIO),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD))
> -	# As the kernel gets compiled before root filesystems are
> -	# built, we create a fake cpio file. It'll be
> -	# replaced later by the real cpio archive, and the kernel will be
> -	# rebuilt using the linux-rebuild-with-initramfs target.
> +	@# As the kernel gets compiled before root filesystems are
> +	@# built, we create a fake cpio file. It'll be
> +	@# replaced later by the real cpio archive, and the kernel will be
> +	@# rebuilt using the linux-rebuild-with-initramfs target.

These silent comments are ugly, ugly, ugly... Furthermore, they cause a
shell to be spawned just to execute... nothing (I'm not sure make is
smart enough to do nothing in this case...)

Instead, I've moved the initramfs settings out into their own macro,
that gets conditionally defined, and with the comments out of the macro,
so they no longer get displayed.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
>  		mkdir -p $(BINARIES_DIR)
>  		touch $(BINARIES_DIR)/rootfs.cpio
> -- 
> 2.40.1.windows.1
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
