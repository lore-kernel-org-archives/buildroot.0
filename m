Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A99C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 13:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866EE40890;
	Sun, 13 Nov 2022 13:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 866EE40890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUYus7eymvgt; Sun, 13 Nov 2022 13:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 509214088D;
	Sun, 13 Nov 2022 13:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509214088D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C77AF1BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 13:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A34B260B2B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 13:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34B260B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rainWfA84nnY for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 13:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39404607AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39404607AA
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 13:36:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EF49C13F8CC;
 Sun, 13 Nov 2022 14:35:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 14:35:57 +0100
Date: Sun, 13 Nov 2022 14:35:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20221113133557.GE2123054@scaer>
References: <20221108073606.166060-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108073606.166060-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668346560;
 bh=1VVtVDJ4jFuU7TE67OTKbx74wjxfbhjVP8bdp6KupAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UzS4Dl+miuodS2qsEeJzAg7xMSM+SrSXH080BY/PXjX2v4DCASqSi01N8jpZZ6UF/
 3KIzFxU1DiJZCjD7jk3nC39xBf7Ge4yybdAPlF9mJ+lsr83v3NTPhvQZpqXcrQuQkT
 uFA4N8fwMPKzHO+HDuzLD1R0Tb7BwoJSC1wB7SxBDN1UqpofbOnas0u/NiMsIiwwGw
 3sk8XVC/+e71yEbktUaZ5M1PGsxbiJvs3BKkDIXLsgCn+bSt2cMbqriWAOLPwRXaV8
 Emu2ukObbDcYkmVGyNdFmnRx9EtkIFgZ5pd0eRW6CIAXbBGDI1bbq0aZ1MOUyzugA5
 +WSjbQJvJRwGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UzS4Dl+m
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig:
 bump U-boot to 2022.10
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

Heiko, All,

On 2022-11-08 08:36 +0100, Heiko Thiery spake thusly:
> The U-Boot makefile for the host tools does not handle the
> compiler/linker options properly. There are some patches [1][2] that fixes
> that issue already applied in the newer U-Boot version 2022.10. So we have to
> bump U-Boot to fix an autobuilder fail.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/3267233833
> 
> [1] U-Boot: a638bd349ea43825 (kbuild: add KBUILD_HOSTLDFLAGS to cmd_host-csingle)
> [2] U-Boot: 31a7688cbe0ed5ed (tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls)
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  configs/kontron_bl_imx8mm_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> index ff376662e9..240cb52245 100644
> --- a/configs/kontron_bl_imx8mm_defconfig
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> @@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
>  BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y

Thomas already pushed a commit of hos own with jut that hunk, but given
the explanations you provided in this patch, I take it that it will not
be enough, so:

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
>  BR2_TARGET_UBOOT_SPL=y
> -- 
> 2.30.2
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
