Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D51C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B97B40102;
	Tue, 26 Jul 2022 19:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B97B40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5RuXr8Q3xmp; Tue, 26 Jul 2022 19:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36393400CE;
	Tue, 26 Jul 2022 19:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36393400CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D86771BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B303080B20
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B303080B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGUsSA-NZDgL for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:00:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA6A80A6E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BA6A80A6E
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:00:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 62127240006;
 Tue, 26 Jul 2022 19:00:13 +0000 (UTC)
Date: Tue, 26 Jul 2022 21:00:13 +0200
To: Xuanhao Shi <x-shi@ti.com>
Message-ID: <20220726210013.45bf33ec@windsurf>
In-Reply-To: <20220726165041.17584-5-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-5-x-shi@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658862015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJHtfD2ZSI+gdAjh0qBmWI+xvxn0PJzJJlC0ukcTebw=;
 b=m1gr76A0iqqstinG5BrIbojDgyrTpv1f44iCEVbiqyM92ja2HSJf2OddhV2K8OIjup5Rox
 e91+AgnJvFv0qPq/k6yaDjwWycaB97PIjo2UYTqLUhWi23+FiqeJM6OBayV7BwWMxpT8+B
 nLO82JlhgYzRKZfCNIVOnKzSAxRrj4wVDk60TtMeabFSUG9HEx69xipfRPLvvYaRuZEL/w
 NQGp7NXH4hbX2vfKPh/6VQRNA0G39UWMCIUQ0ZcY29FJZVANXOnWn1kBW4OPl6TqtqlnUm
 19vcaoaFxD2rzEp/BfzkzkU5KR3ErJa5sZY2EI2pvlUE98fvnU3YNPbCRZ6UoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m1gr76A0
Subject: Re: [Buildroot] [PATCH 4/4] configs/am64x_sk_defconfig: add new
 defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 26 Jul 2022 11:50:41 -0500
Xuanhao Shi <x-shi@ti.com> wrote:

> Adds the new defconfig for TI's AM64X_SK board after patch.
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>  configs/am64x_sk_defconfig | 44 ++++++++++++++++++++++++++++++++++++++

This should be squashed into the previous commit.

Also, please add entries in the DEVELOPERS file for the board/
directory and this new defconfig.

>  1 file changed, 44 insertions(+)
>  create mode 100644 configs/am64x_sk_defconfig
> 
> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> new file mode 100644
> index 0000000000..629bff6519
> --- /dev/null
> +++ b/configs/am64x_sk_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_INIT_SYSTEMD=y

We want our defconfigs to be minimal, so keep the default toolchain and
default init system.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/am6x/genimage.cfg"
> +BR2_LINUX_KERNEL=y

You must specify an explicit kernel version so that the build is
reproducible.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig"

Drop $(TOPDIR)/, it is not needed.

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
> +BR2_PACKAGE_K3_IMAGE_GEN=y
> +BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG="am64x_evm_r5"
> +BR2_PACKAGE_K3_IMAGE_GEN_SOC="am64x"
> +BR2_PACKAGE_K3_IMAGE_GEN_CONFIG="evm"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y

You must specify an explicit TF-A version so that the build is
reproducible.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="SPD=opteed"
> +BR2_TARGET_OPTEE_OS=y

You must specify an explicit OP-TEE version so that the build is
reproducible.

> +BR2_TARGET_OPTEE_OS_PLATFORM="k3"
> +BR2_TARGET_OPTEE_OS_CORE_IMAGES="tee-pager_v2.bin"
> +BR2_TARGET_UBOOT=y

You must specify an explicit U-Boot version so that the build is
reproducible.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN=y
> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM=y
> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SITE="https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10"
> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SOURCE="gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2"
> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_LICENSE="GPL-3.0+"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
