Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CB6C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 18:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25FA44056F;
	Mon, 17 Feb 2025 18:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuLIJ77mEeHQ; Mon, 17 Feb 2025 18:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE2C40570
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CE2C40570;
	Mon, 17 Feb 2025 18:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31788DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15ADB400C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2Tl1LLkn39a for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 18:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA81A400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA81A400B8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA81A400B8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 18:42:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 64D435FFAA;
 Mon, 17 Feb 2025 19:41:58 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Feb 2025 19:41:58 +0100
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 19:41:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216213842.3620056-1-gilles.talis@gmail.com>
References: <20250216213842.3620056-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f0d08d8ec0674a63895d8c184ce5ab67@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739817719;
 bh=XcG7rGVRu47AtAlpA82uXeX96WvzYID7lnR12aZJXro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ar3kBJaml/9eQOjM8QgAsGPEPU/SsqRCSMtWWariN5pS5r4YkKqs9/6PDO9vOhuX0
 ObLNFk7Fxf958RUVco5j4wieabgx1dvjKfURm2q12mwfQ2Nf9SDPY9zq3+Jtw/6PRd
 sH6pFcXVDRxmM20/e8Ji3sSlhyVshsh0YkQyUY1lrcxaDIrxLhoclfiqRxS4LxpzhN
 tfh0074FoFcI0KFhxPHL7z3GuM9oXAjQ1iVwce7i25+JYAxY9D7Py+3vRKrBLkFWUU
 7TU774/dX03HR+h2aSFUt58wH1QLYViyNMiaCIiczRd/8BDtPHbTDXC3lq62pJUzH6
 ZkXCplnmMtnQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ar3kBJam
Subject: Re: [Buildroot] [PATCH v2] configs/polyhex_debix_model_a_defconfig:
 new defconfig
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

Hi Gilles,

Thanks for the updates!

There is a regression compared to v1.
When compiling with this patch with commands:

     make polyhex_debix_model_a_defconfig
     make

compilation is failing with output:

     Incorrect selection of kernel headers: expected 2.6.x, got 6.12.x

The BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y is no longer set
in the defconfig.

I also have few other comments, see below.

On 16/02/2025 22:38, Gilles Talis wrote:
> This configuration builds an image for the Polyhex Debix Model A SBC
> 
> DEBIX Model A is an industrial grade single board computer
> powered by NXP i.MX 8M Plus applications processor
> 
> https://www.debix.io/hardware/model-a.html
> 
> - Linux Kernel: Upstream version 6.12.13
> - U-boot: Upstream version 2024.10
> - ATF: Upstream version 2.12
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Changes v1 --> v2:
> - Fixed post-build.sh script warnings
> - Enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES
> - Added Linux and U-Boot hashes
> - Renamed post-build.sh processed files as *.in
> ---

[...]

> diff --git a/board/polyhex/debix-model-a/patches/linux/linux.hash 
> b/board/polyhex/debix-model-a/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..948f3a26a9
> --- /dev/null
> +++ b/board/polyhex/debix-model-a/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated

Since this defconfig is using an upstream kernel archive, the
"# Locally calculated" comment can be replaced by:

# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc

This allow the reuse the hash value from upstream, and the signature
can also be verified.

> +sha256  
> f3ebdeea9e555b4cface44e29670056f4024541e6bd222fbcf776c818974fbba  
> linux-6.12.13.tar.xz
> diff --git a/board/polyhex/debix-model-a/patches/uboot/uboot.hash 
> b/board/polyhex/debix-model-a/patches/uboot/uboot.hash
> new file mode 100644
> index 0000000000..904fa56c02
> --- /dev/null
> +++ b/board/polyhex/debix-model-a/patches/uboot/uboot.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  
> u-boot-2024.10.tar.bz2

The hash symlink for linux-headers is missing. This is probably due to
the missing BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y. Could you add 
it
please?

See how it is done in another board, for example:
https://gitlab.com/buildroot.org/buildroot/-/tree/master/board/freescale/imx8mpevk/patches/

You are also missing the hash file for arm-trusted-firmware (because
the defconfig sets a CUSTOM_VERSION). It is currently working because
this version happen to be the default TF-A version and a valid hash is
in: boot/arm-trusted-firmware/*/arm-trusted-firmware.hash

To make sure this defconfig can be updated independently of
boot/arm-trusted-firmware/ default version, you should have your own
arm-trusted-firmware.hash too.

Could you add the arm-trusted-firmware.hash please?

[...]

> diff --git a/configs/polyhex_debix_model_a_defconfig 
> b/configs/polyhex_debix_model_a_defconfig
> new file mode 100644
> index 0000000000..e0ada738f1
> --- /dev/null
> +++ b/configs/polyhex_debix_model_a_defconfig
> @@ -0,0 +1,46 @@
> +BR2_aarch64=y
> +BR2_ARM_FPU_VFPV3=y

Could you add back BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
here please?

> +BR2_GLOBAL_PATCH_DIR="board/polyhex/debix-model-a/patches"
> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/polyhex/debix-model-a/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.13"

For info, 6.12.14 was tagged today, in case you want to update
it, while you are doing other changes.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-debix-model-a"
> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"

There is already a u-boot version v2025.01 available. Could you
consider switching to it?

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_debix_model_a"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_IMX_MKIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
