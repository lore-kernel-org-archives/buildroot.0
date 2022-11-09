Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF19C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 14:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A73481E78;
	Wed,  9 Nov 2022 14:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A73481E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JnSC5bDMLhY; Wed,  9 Nov 2022 14:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A28A481E6E;
	Wed,  9 Nov 2022 14:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A28A481E6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABC381BF33C
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 14:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9406081E6E
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 14:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9406081E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlnJJHN4ZA0J for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 14:56:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD5A181E6B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD5A181E6B
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 14:56:26 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 390561BF212;
 Wed,  9 Nov 2022 14:56:23 +0000 (UTC)
Date: Wed, 9 Nov 2022 15:56:21 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221109155621.4af7f270@booty>
In-Reply-To: <20221109091214.65185-2-neal.frager@amd.com>
References: <20221109091214.65185-1-neal.frager@amd.com>
 <20221109091214.65185-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668005784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMfsbCSmtneaaEXEXLfcMWOHDCxOmo6mbmyRgez/+iA=;
 b=mtMVc2rHop0eWa7WvoYQJdee/aM5GVeMZ72dwjfXqnCfDruepir7mksiZD0RdZjjcqViXl
 9Yh1RwG4cnYz1MSPOKwiXS0ATS+cAMygFVSMjJ4IBGoszEqGbx1XOuS4clEq4MzgCngoUK
 qPlkgROuVu/77QRxLH65NW6FBUNbACrPl1OzGzP7jQSIGnjgCtJQ64qp41ypZiaAhNsi2J
 cR1NtuFzY2ydm31F773H9DJnG3wa1/pwKubymr6xXDTtj1O2FQiFK0qQnceoLpEmRNyGJE
 ulydksdU/P+0YsXePN0qwmbrl0xH4L38kQDditX/NhzVWRbqMa3HD+Eg5+CNPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mtMVc2rH
Subject: Re: [Buildroot] [PATCH v4 2/2] configs/versal_vck190: new defconfig
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: terry.oneal@amd.com, kris.chaplin@amd.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 9 Nov 2022 02:12:14 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds support for Xilinx Versal VCK190 evaluation board.
> 
> VCK190 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vck190.html
> 
> The VCK190 is based on the Xilinx Versal family:
> https://www.xilinx.com/products/silicon-devices/acap/versal.html
> 
> The VC1902 included with the VCK190 evaluation board has Xilinx
> AI Engine acclerators designed for accelerating machine learning
> applications.  Also included is an upgrade from prior Zynq and
> ZynqMP families to ARM Cortex-A72 cores.
> 
> While the Linux kernel for Versal is quite similar to ZynqMP,
> the boot process has significantly changed.
> 
> Triple-redundant MicroBlaze cores are used to boot and setup
> Versal devices.  For this reason, current buildroot support
> will download pre-built firmware images and use Xilinx bootgen
> to generate the boot.bin for the vck190.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[...]

> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> new file mode 100644
> index 0000000000..8c5d391b97
> --- /dev/null
> +++ b/configs/versal_vck190_defconfig
> @@ -0,0 +1,38 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_FORMAT_ELF=y
> +BR2_PACKAGE_VERSAL_FIRMWARE=y
> +BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
> +BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"

These two lines should be removed. They hold the default values after
it has been added to patch 1.

If you send a new verison with only that fixed you can add:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
