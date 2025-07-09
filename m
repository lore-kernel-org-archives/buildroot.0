Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F6CC83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 13:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BADF60A93;
	Wed,  9 Jul 2025 13:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RKKpHu_NGe8; Wed,  9 Jul 2025 13:37:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F5560608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F5560608;
	Wed,  9 Jul 2025 13:37:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D2315F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 13:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C705E814B5
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 13:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqfXCB8HtIYI for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 13:37:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.116;
 helo=smtpcmd11116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBE5381CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE5381CBA
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBE5381CBA
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 13:37:20 +0000 (UTC)
Received: from [172.25.4.128] ([212.103.203.10]) by Aruba SMTP with ESMTPSA
 id ZUz7uxtiztr9dZUz7uwjV9; Wed, 09 Jul 2025 15:37:18 +0200
Message-ID: <f92fb29d-be1f-40c0-83bb-d66dfecf0988@benettiengineering.com>
Date: Wed, 9 Jul 2025 15:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
Cc: stephane.viau@oss.nxp.com, festevam@gmail.com, maeva.manuel@oss.nxp.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250708234739.2969797-1-Mr.Bossman075@gmail.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20250708234739.2969797-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfE6e5FTX1kakLV7Pk89qCxYOYr0UCktPlXgDcKpgFBU5WTv7IUiF0ZzOP8OuylciiQydXcjONdxprfCx3etqlXymzkbWMH89BUAwhGwO+IJKHCv5ZnbQ
 vwJJbGJZfKzlbFJN8o3bFJxiVJOiSt4XP/b71e77+gLc9EpqBDmxMOzi2Qaab2OiHR8XYHJy0ZtPq70/mKH80I6Ky0co79WEmcSjwrM8GOHy+as+Tu+EX3SS
 ss8vo6tyB44qUbL4yl9RL77dWnxxWnkawrHqm+cRfk/A/uwDFRJPzRmXit+qbbo+vbiUr17Dh7Sl+KCjlyc/V5nBkEzNRb8bnWdaGxTEQt+vzijzbnBM/ixQ
 1UF1RrAlkcfKvFtpG9aAJu3C02HVuwhkVP5wJIBoMvp2oABuBXs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1752068238; bh=jINA0Eg1EzSpBLd6SGx+CJVDKsCmG1hitCTmYXpQTvo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BAQ2fIxM8y1rMIgopWL8UH2j/tldsNPxbprN8sHqgK7WU1OXZh51i3qRWWUsXYlVg
 6RvPkKuTv9AQMTZ2JXXlMZYmPvZZeaPTYJU/KJAPMxa1tuRfNHqK6rYgi7NnBea8tb
 YaWTV+11KULsbWCi9KR5FK2wR59JdPP4Bowrv7fFZ6C6zSnIxF+TX7PalF03vjIHBt
 vhb1jFX2dOoIrfjvrOMH81pe3pRmJJG7QvUtiw+m/cTxOBYsnhXi5PFSj68icA+W9v
 jTAAnMSHT+SNshsXFqkZqA4UwLU49U8Fwd1+brLdsQYVnuHHzUk05Yc/dedyELVNpM
 1pLwovQjZAC8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BAQ2fIxM
Subject: Re: [Buildroot] [PATCH] configs/imxrt1050-evk: Switch to use
 extlinux.conf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 7/9/25 01:47, Jesse Taube wrote:
> Switch to extlinux instead of built in U-Boot script.
> Drop custom U-Boot fragment and genimage config.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Kind regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
https://www.linkedin.com/company/benetti-engineering-sas/
https://www.linkedin.com/in/giulio-benetti-79975951/

> ---
>   board/freescale/imxrt1050evk/genimage.cfg       | 17 -----------------
>   .../rootfs_overlay/boot/extlinux/extlinux.conf  |  4 ++++
>   board/freescale/imxrt1050evk/uboot.fragment     |  2 --
>   configs/imxrt1050-evk_defconfig                 |  5 +++--
>   4 files changed, 7 insertions(+), 21 deletions(-)
>   create mode 100644 board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
>   delete mode 100644 board/freescale/imxrt1050evk/uboot.fragment
> 
> diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
> index 64fc8452f8..3a4c4fb792 100644
> --- a/board/freescale/imxrt1050evk/genimage.cfg
> +++ b/board/freescale/imxrt1050evk/genimage.cfg
> @@ -1,14 +1,3 @@
> -image boot.vfat {
> -	vfat {
> -		files = {
> -			"zImage",
> -			"imxrt1050-evk.dtb",
> -		}
> -	}
> -
> -	size = 8M
> -}
> -
>   image sdcard.img {
>   	hdimage {
>   	}
> @@ -27,12 +16,6 @@ image sdcard.img {
>   		size = 512K
>   	}
>   
> -	partition boot {
> -		partition-type = 0xc
> -		bootable = "true"
> -		image = "boot.vfat"
> -	}
> -
>   	partition rootfs {
>   		partition-type = 0x83
>   		image = "rootfs.ext4"
> diff --git a/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..1818d2702d
> --- /dev/null
> +++ b/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label buildroot
> +	kernel /boot/zImage
> +	devicetree /boot/imxrt1050-evk.dtb
> +	append console=ttyLP0 root=/dev/mmcblk0p1 rootwait rw
> diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
> deleted file mode 100644
> index dd45ca4c29..0000000000
> --- a/board/freescale/imxrt1050evk/uboot.fragment
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -CONFIG_USE_BOOTCOMMAND=y
> -CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 zImage;bootz 0x80000000 - 0x80800000"
> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
> index 8a515a9260..8bff623602 100644
> --- a/configs/imxrt1050-evk_defconfig
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -1,6 +1,7 @@
>   BR2_arm=y
>   BR2_cortex_m7=y
>   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
> +BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
>   BR2_LINUX_KERNEL=y
> @@ -9,15 +10,15 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
>   BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>   BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
> -BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
>   BR2_TARGET_UBOOT_SPL=y


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
