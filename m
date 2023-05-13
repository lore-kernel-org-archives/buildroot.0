Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D886C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 17:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD4B428E6;
	Sat, 13 May 2023 17:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD4B428E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbsfgLak8QhH; Sat, 13 May 2023 17:58:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6574289F;
	Sat, 13 May 2023 17:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6574289F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 302261BF5DA
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0974141CB7
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0974141CB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGJxk__aPPhK for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 17:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03AF440524
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03AF440524
 for <buildroot@buildroot.org>; Sat, 13 May 2023 17:58:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3C29819F741;
 Sat, 13 May 2023 19:58:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 19:58:37 +0200
Date: Sat, 13 May 2023 19:58:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230513175837.GW2582048@scaer>
References: <20230422134100.609825-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422134100.609825-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684000721;
 bh=vXOnic9LZq2D0dBAu70kE/ZotsVfc7ot7zB870S2HCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V6Y+rREfKocyCOBYc6djtCLFHSUM5POz+QSfqmvBemwZgINpzQI/LfQtRSb1odypO
 kSVFBcTB2svo0YbW88JI9kAokO6WM7PmY7p4Hfe2bk1gCMuH1IZ4bIV8oaZvHXmTqr
 07S3nVyrrCqGwhxjok41gaL3XRMxUOWKe6vTxHQHTMXP1aTqBHQ0q6tptYrDSjeCgN
 CABj6zIMnwPoBxAGlfqzBQQYe8y4olsxTNw/Z9DArDDsrZN1hwHvBfobTVEGSG4Yhh
 PiywDR4UsbOJbnpakbXewiY6v7Ph18Nc2zK+2/GzFoP2+31s2Qlkob6vXAc061UZi9
 CoDN6ZsGAyhWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V6Y+rREf
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f4xx_defconfig: remove
 BR2_PACKAGE_IFUPDOWN_SCRIPTS
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-04-22 15:41 +0200, Dario Binacchi spake thusly:
> Kernel is built without network support. It is useless to compile the
> package and then remove it from rootfs.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh | 4 ----
>  configs/stm32f429_disco_xip_defconfig                         | 1 +
>  configs/stm32f469_disco_sd_defconfig                          | 1 +
>  configs/stm32f469_disco_xip_defconfig                         | 1 +
>  4 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> index e324afe59a98..2ac9c653c327 100755
> --- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> +++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
> @@ -2,7 +2,3 @@
>  
>  # Kernel is built without devpts support
>  sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab
> -
> -# Kernel is built without network support
> -rm -f ${TARGET_DIR}/etc/init.d/S40network
> -rm -rf ${TARGET_DIR}/etc/network/
> diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
> index 872e4b6a306c..9edbbab387e1 100644
> --- a/configs/stm32f429_disco_xip_defconfig
> +++ b/configs/stm32f429_disco_xip_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AFBOOT_STM32=y
> diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
> index dc00a47e1da2..24791178f46f 100644
> --- a/configs/stm32f469_disco_sd_defconfig
> +++ b/configs/stm32f469_disco_sd_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>  # BR2_TARGET_ROOTFS_TAR is not set
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> index fc3b3f921396..ae2780556ad1 100644
> --- a/configs/stm32f469_disco_xip_defconfig
> +++ b/configs/stm32f469_disco_xip_defconfig
> @@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  BR2_TARGET_ROOTFS_INITRAMFS=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AFBOOT_STM32=y
> -- 
> 2.32.0
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
