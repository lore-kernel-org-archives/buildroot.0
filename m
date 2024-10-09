Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207FDCEDDA3
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA9540728;
	Wed,  9 Oct 2024 15:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53dgfe7b59eu; Wed,  9 Oct 2024 15:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FCF240729
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCF240729;
	Wed,  9 Oct 2024 15:13:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7460B1BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD6DA40644
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_RknK1hl2Gu for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:12:53 +0000 (UTC)
X-Greylist: delayed 731 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Oct 2024 15:12:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A8BE40C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A8BE40C6F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A8BE40C6F
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:12:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499F0eXr109839;
 Wed, 9 Oct 2024 10:00:40 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 499F0emR116613
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2024 10:00:40 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 10:00:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 10:00:40 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499F0e9T013876;
 Wed, 9 Oct 2024 10:00:40 -0500
Date: Wed, 9 Oct 2024 10:00:40 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241009150040.mxnktvztmjzwasyw@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241009062631.895124-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009062631.895124-1-dario.binacchi@amarulasolutions.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728486040;
 bh=JEA9bZNhCmHDMuLYehHo7fA6+veYkvbaCYc/w2WilNY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=v5kKvZztyXBWvxzJmXSYiEVCMhZZm+gIQ0qeqDjHOw+8pviKqR4d6whLCgzhiCFsg
 qhpZoeb+CxtkzfWvCqkN0QksHWjKttconaXmgxXBv5Q9iQCw7PHx5QR/bSa/X32iKZ
 rTHGDUH59WEtiyYCom54oK6xssCVrobt9syGvOlM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=v5kKvZzt
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario!

On October  9, 2024 thus sayeth Dario Binacchi:
> The patch bumps the Linux kernel to version 6.10.13 and U-Boot to
> version 2024.10. Arm trusted firmware is already up to date.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
>  board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
>  configs/ti_am62x_sk_defconfig              | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
> index 53eb1438945b..706ddb8dbbd4 100644
> --- a/board/ti/am62x-sk/patches/linux/linux.hash
> +++ b/board/ti/am62x-sk/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
> +sha256  5ffceb2350db1547e69231a63df2d3beed015a313d7d7adf8b5cb71dedaeb16a  linux-6.10.13.tar.xz
> diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
> index fe9b4f53dc63..904fa56c02a3 100644
> --- a/board/ti/am62x-sk/patches/uboot/uboot.hash
> +++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
> +sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index e11b803b73e4..6d071b4cc148 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
>  BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.13"

I've noticed you've been picking stable tags and was curious if you 
prefer to stay on stable tags? I have plans to move everything to v6.11 
but I could choose the stable version (v6.11.2) if that helps you.

>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
> @@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
>  BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
>  BR2_TARGET_TI_K3_R5_LOADER=y
>  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
> -BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.10"
>  BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"

One of the more interesting things we've been working on lately is EFI 
Capsule support which depends on GnuTLS. We'll need to check 
BR2_TARGET_UBOOT_NEEDS_GNUTLS when moving to this version. :)

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
