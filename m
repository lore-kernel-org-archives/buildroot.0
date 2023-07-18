Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1214EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 09:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C0840190;
	Tue, 18 Jul 2023 09:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C0840190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcfzzMPC7XvM; Tue, 18 Jul 2023 09:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED75B404ED;
	Tue, 18 Jul 2023 09:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED75B404ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F18F1BF267
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0529641610
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0529641610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jD-k-LHfxT4 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 09:29:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BB44160B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93BB44160B
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 09:29:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DDF460017;
 Tue, 18 Jul 2023 09:29:34 +0000 (UTC)
Date: Tue, 18 Jul 2023 11:29:32 +0200
To: stefan.nickl@gmail.com
Message-ID: <20230718112932.7e76b6f0@windsurf>
In-Reply-To: <20230716163357.24917-1-Stefan.Nickl@gmail.com>
References: <20230716163357.24917-1-Stefan.Nickl@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689672575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azjj4X/Kk7xCCC37+7UTqBfguTfQpn56FFunnAnIDbk=;
 b=PdSdD4rm2AxpsP+gHpkPsoYZwvQMbAzbnuU1uzayzCxdR5IjPw+JbeVVsmiy/1k2UxFb+j
 UZYNqRvAlTdId9NA+jeHOYEGAiCQZkkq102lVyGf61qH5b5Gp3CUslleYFJOwqk2xZ/yNv
 09MYm7G2tzr2uaUyIQ6pjvVEqiBCa1K6SOczOsQXxm2qcDSKHPc3H63yXrIaPs27lxN/73
 gSLKWJsn1MI9TD9dEKY522K5iUqizk5KZ1ntBlEfU+MgLwOyj4UFIFU0mabJ7gz4XIKYw/
 sQEjpM7LbWGjNBu1IfRi27QiEd0siQCA3L6AjQwylXlXnGuZVC8h/nUCrlFu/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PdSdD4rm
Subject: Re: [Buildroot] [PATCH 1/1] Add FREESCALE_IMX_PLATFORM_IMX8DXL
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
Cc: Maeva Manuel <maeva.manuel@oss.nxp.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

Thanks a lot for your patch, lots of interesting things in here, but
it's all entangled together in one patch, while it should be multiple
patches. See below a lot of comments/suggestions.

On Sun, 16 Jul 2023 18:33:57 +0200
stefan.nickl@gmail.com wrote:

> From: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> Hello,
> I got buildroot working on the NXP i.MX8DXL-WEVK eval board,
> but it's unlikely in a shape to be accepted.

A commit message shouldn't look like an e-mail. It should describe what
the commit does, and why.

> This work was originally based on 2023.05, before
> 794b9e993273fbaa4e814f9a4b3e62c633d8d117 was applied, which also adds
> the B0 seco revision, but under ..._PLATFORM_IMX8X, whereas I added a
> new ..._PLATFORM_IMX8DXL since I needed a way to distinguish the
> i.MX8DXL-WEVK from the i.MX8QXP-MEK in some places.

Not sure to follow you here.

> Also, since I worked off the NXP LF6.1.22_2.0.0 release and can't test
> any other i.MX8 platforms, I just added the relevant firmware versions
> for that release.

Nor here.


> diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> index ace0f6d6..7ebf15b6 100755
> --- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> @@ -63,6 +63,8 @@ main ()
>  		dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
>  		if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
>  			${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
> +	        elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
> +			${HOST_DIR}/bin/mkimage_imx8 -soc DXL -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8dxl-evk-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
>  		else
>  			${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
>  		fi

This should be part of the commit adding
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y.

> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
> index d36f8291..c359ef60 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -46,6 +46,8 @@ genimage_type()
>  		echo "genimage.cfg.template_imx8"
>  	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
>  		echo "genimage.cfg.template_imx8"
> +	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
> +		echo "genimage.cfg.template_imx8"
>  	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
>  		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>  		    echo "genimage.cfg.template_no_boot_part_spl"

Same.

> diff --git a/board/freescale/imx8dxlevk/readme.txt b/board/freescale/imx8dxlevk/readme.txt
> new file mode 100644
> index 00000000..33ceb669
> --- /dev/null
> +++ b/board/freescale/imx8dxlevk/readme.txt

This should be part of a commit adding support for the imx8dxlevk
board, titled "configs/freescale_imx8dxlevk: new defconfig".

> diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
> new file mode 100644
> index 00000000..bf59e644
> --- /dev/null
> +++ b/configs/freescale_imx8dxlevk_defconfig

This should be part of a commit adding support for the imx8dxlevk
board, titled "configs/freescale_imx8dxlevk: new defconfig".

> @@ -0,0 +1,39 @@
> +BR2_aarch64=y
> +BR2_cortex_a35=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_FREESCALE_IMX=y
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y
> +BR2_PACKAGE_FIRMWARE_IMX=y
> +BR2_PACKAGE_IMX_SC_FIRMWARE=y
> +BR2_PACKAGE_IMX_SECO=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_IMX_MKIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

From a quick look, this looks good.

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 13d611b6..fe3f2659 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in

All changes in this file should go in the commit adding
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL


> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index 0c1913e2..087ddef8 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -34,6 +34,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
>  	default "imx6"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>  	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL

Same.

>  
>  config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
>  	bool
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index eb0c387a..d95a8bea 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,5 +1,6 @@
>  # Locally calculated
>  sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
> +sha256  f6dc6a5c8fd9b913a15360d3ccd53d188db05a08a8594c518e57622478c72383  firmware-imx-8.20.bin
>  sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
>  sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
>  sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt

Should go in a commit "package/freescale-imx/firmware-imx: bump version to 8.20"

Also, please run "make legal-info", to make sure the license
information is still correct.

> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 4cceb670..66ef8c39 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIRMWARE_IMX_VERSION = 8.15
> +FIRMWARE_IMX_VERSION = 8.20

Should go in a commit "package/freescale-imx/firmware-imx: bump version to 8.20"

>  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>  
> diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
> index 4932e62d..016f9739 100644
> --- a/package/freescale-imx/imx-sc-firmware/Config.in
> +++ b/package/freescale-imx/imx-sc-firmware/Config.in
> @@ -1,7 +1,8 @@
>  config BR2_PACKAGE_IMX_SC_FIRMWARE
>  	bool "imx-sc-firmware"
>  	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL

Should go in the commit adding
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL.

>  	help
>  	  System Control Unit Firmware blobs for the Freescale i.MX8
>  	  SoCs.
> diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
> index ed83e757..2a4d3b7b 100644
> --- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
> +++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
> @@ -1,4 +1,5 @@
>  # Locally calculated
>  sha256  24a647237c0077ce0172563d67fcbc5e8f231bad7cf55a2436848c89579c5a06  imx-sc-firmware-1.8.0.bin
> +sha256  1272ac5c31a88017ef548721f3acf930a7eda6ac73aa9f41b5f0cade9d5c0e5f  imx-sc-firmware-1.15.0.bin
>  sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
>  sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING

Should go in a commit "package/freescale-imx/imx-sc-firmware: bump
version to 1.15.0".

> diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> index 6a304c0c..9f198b43 100644
> --- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> +++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk

Should go in a commit "package/freescale-imx/imx-sc-firmware: bump
version to 1.15.0".

> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMX_SC_FIRMWARE_VERSION = 1.8.0
> +IMX_SC_FIRMWARE_VERSION = 1.15.0
>  IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
>  IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
>  
> @@ -25,6 +25,10 @@ define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
>  	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
>  	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
>  endef
> +else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL),y)
> +define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
> +	cp $(@D)/mx8dxl-*-scfw-tcm.bin $(BINARIES_DIR)/
> +endef

Are these firmware files new in 1.15.0, or were they already present in
1.8.0 ?

>  else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
>  define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
>  	cp $(@D)/mx8qm-*-scfw-tcm.bin $(BINARIES_DIR)/
> diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
> index 41f84446..a9a2e92a 100644
> --- a/package/freescale-imx/imx-seco/Config.in
> +++ b/package/freescale-imx/imx-seco/Config.in
> @@ -1,7 +1,8 @@
>  config BR2_PACKAGE_IMX_SECO
>  	bool "imx-seco"
>  	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
>  	help
>  	  Firmware file for the i.MX8 and i.MX8X Security Controller.
>  
> @@ -14,6 +15,7 @@ choice
>  	prompt "i.MX Seco Firmware Release"
>  	default BR2_PACKAGE_IMX_SECO_MX8QMB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	default BR2_PACKAGE_IMX_SECO_MX8QXC0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +	default BR2_PACKAGE_IMX_SECO_MX8DXLB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL

How can this work if BR2_PACKAGE_IMX_SECO_MX8DXLB0 is not defined?

> diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
> index 378c24bc..a7ff6cdb 100644
> --- a/package/freescale-imx/imx-seco/imx-seco.hash
> +++ b/package/freescale-imx/imx-seco/imx-seco.hash
> @@ -1,4 +1,5 @@
>  # Locally calculated
>  sha256  08cf25a4be6841ca7264a50b29c311b386eae1c02fced8a3b55fd04213acb4bc  imx-seco-3.7.5.bin
> +sha256  c3bd761f457e939035b01a0ab36e79064a2a1bc6c3cdb3cd847f7f38df0964df  imx-seco-5.9.0.bin
>  sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>  sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING

This should go in "package/freescale-imx/imx-seco: bump version to 5.9.0".

> diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
> index 987f2465..3788f1e4 100644
> --- a/package/freescale-imx/imx-seco/imx-seco.mk
> +++ b/package/freescale-imx/imx-seco/imx-seco.mk

This should go in "package/freescale-imx/imx-seco: bump version to 5.9.0".

Could you rework your patch into a patch series, splitting the changes
as requested?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
