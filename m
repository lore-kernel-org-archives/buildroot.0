Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B7EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 17:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7BD283E95;
	Fri, 13 May 2022 17:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWQ88_eA2yQt; Fri, 13 May 2022 17:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AC082EF0;
	Fri, 13 May 2022 17:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30C501C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DEBC82EF0
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 17:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2DsYbBRq1pi for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 17:01:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39B6282725
 for <buildroot@buildroot.org>; Fri, 13 May 2022 17:01:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3FB4513F8AD;
 Fri, 13 May 2022 19:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652461317;
 bh=GmARUxBUadp/AIEK3hCt4YnjLA4+4rnWdm9CCBxlc6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mQwYQR7LOo2fUoGCZnnR8Te85F2oERs3z0AkZAqSKAvcpjan/wgU028UI2lVarNaw
 a2oANBYg4aimZXvttioWxIswYnTe3b/6cZIWybKcdjheTU6N03U0sXdfHU2ILz8Ffu
 YRamoioN6B9DWC3jkWjD4FFR7wvzCZfH5kE3dFnQpTdhWipYix6WdpeCTxiB8KD0Uq
 DDN1ay4V73V5OdvYwje1uQy3Jt7Kr75gzHAVC3G2VbzgQqg40hLLcp+GVQHpmCVjfA
 jB7osGCTdV/vTTQCMTfTiOT74+hImtKTgq7Hn56T/55wPCiTOtr1mUIZflqHTqjU+a
 fXcDopx9ibGxA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 19:01:54 +0200
Date: Fri, 13 May 2022 19:01:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220513170154.GU1597494@scaer>
References: <20220513071522.19853-1-heiko.thiery@gmail.com>
 <20220513071522.19853-2-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513071522.19853-2-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m: switch to
 upstream U-Boot
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

On 2022-05-13 09:15 +0200, Heiko Thiery spake thusly:
> Switch U-Boot from vendor downstream version to upstream. Since the
> upstream U-Boot uses binman to build the bootable binary (flash.bin) the
> need for the iMX specifc prepare script is no longer required.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/kontron/pitx-imx8m/genimage.cfg  |  2 +-
>  board/kontron/pitx-imx8m/post-image.sh |  3 ---
>  configs/kontron_pitx_imx8m_defconfig   | 20 +++++++++++++-------
>  3 files changed, 14 insertions(+), 11 deletions(-)
>  delete mode 100755 board/kontron/pitx-imx8m/post-image.sh
> 
> diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
> index 4a0aa117fb..bc100b171d 100644
> --- a/board/kontron/pitx-imx8m/genimage.cfg
> +++ b/board/kontron/pitx-imx8m/genimage.cfg
> @@ -5,7 +5,7 @@ image sdcard.img {
>  
>  	partition imx-boot {
>  		in-partition-table = "no"
> -		image = "imx8-boot-sd.bin"
> +		image = "flash.bin"
>  		offset = 33K
>  	}
>  
> diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
> deleted file mode 100755
> index 3452fd4501..0000000000
> --- a/board/kontron/pitx-imx8m/post-image.sh
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
> diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
> index 8f756f5246..161b9cfe3b 100644
> --- a/configs/kontron_pitx_imx8m_defconfig
> +++ b/configs/kontron_pitx_imx8m_defconfig
> @@ -3,9 +3,9 @@ BR2_aarch64=y
>  
>  # System
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/kontron/pitx-imx8m/post-build.sh"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/kontron/pitx-imx8m/post-image.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/pitx-imx8m/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
> @@ -37,12 +37,18 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://gitlab.kontron.com/imx/u-boot-imx/-/archive/PITX-IMX8M-R12/u-boot-imx-PITX-IMX8M-R12.tar.gz"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pitx-imx8m"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_pitx_imx8m"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
> +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
>  BR2_TARGET_UBOOT_SPL=y
>  
>  # Required host tools to create the SD/eMMC image
> -- 
> 2.20.1
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
