Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C44EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 526B2404F0;
	Sun, 16 Jul 2023 16:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526B2404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eUtldAsmvMwx; Sun, 16 Jul 2023 16:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 140C940602;
	Sun, 16 Jul 2023 16:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 140C940602
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD6CD1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 967E940602
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967E940602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8wRlbyhWRJt for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:34:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071F3404F0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 071F3404F0
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:34:01 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-992dcae74e0so534565066b.3
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689525240; x=1692117240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4qU0P3ODmnOAfkw/J2fcThtE/atKB9vO8TV4vxVs7Y=;
 b=W5MLQPXKK4+KXNO+I6IVnFM+pGErW7T45cwfSufjM/J7LfFNUFbH7LgEJqx1p2W7Nn
 ECRgmg/4EUKhXGyzxihQD4xf2/f4FHLzS9XaWpLpi7faqV0rnMd+b8g/S7G4YTPyxU+A
 yV4MFnioqk7uCNPRAC+Zka9Db58BMgIH0Q5t0lNEQc7eg+kOJT5lan+MRt0hmPN2Sc/j
 81682c9IrfxZdJbiA6Uj/XGT29dKp9aA5/CAXH0XOK0goAN1HsPsCUR84/21chQtc2jg
 pboPk7hcJ4ex98un0zM7RR/b4GNAaaiEDjt1nz/lYvT0m206jQwGXi2+YV7RGXe7Kbey
 8ZrA==
X-Gm-Message-State: ABy/qLbqPNUgxVNhHxV7bQE6STpli0m+n0vMHfvzk9kAe1gPKaDG2xUb
 wno2e5hd/kOcYhKABkQMx7K6DRB0QODX6g==
X-Google-Smtp-Source: APBJJlGPrst5RSuTCak0Ft1axKIJTwfEKzWr9CHaH0xx+kW+CnIVpJ+y6dEhckZFWiBR4hJw4+ib0A==
X-Received: by 2002:a17:906:77d9:b0:994:555a:e49f with SMTP id
 m25-20020a17090677d900b00994555ae49fmr6537538ejn.31.1689525239559; 
 Sun, 16 Jul 2023 09:33:59 -0700 (PDT)
Received: from effi.fritz.box
 (p200300d197289500922b34fffe35b24f.dip0.t-ipconnect.de.
 [2003:d1:9728:9500:922b:34ff:fe35:b24f])
 by smtp.gmail.com with ESMTPSA id
 um10-20020a170906cf8a00b0098e78ff1a87sm8059338ejb.120.2023.07.16.09.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 09:33:58 -0700 (PDT)
From: stefan.nickl@gmail.com
X-Google-Original-From: Stefan.Nickl@gmail.com
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 18:33:57 +0200
Message-ID: <20230716163357.24917-1-Stefan.Nickl@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689525240; x=1692117240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4qU0P3ODmnOAfkw/J2fcThtE/atKB9vO8TV4vxVs7Y=;
 b=m7eLj8YbBp4DAxW0WmMknBawtTmiN0YnAzaE+FcENZHKQb8J6wrJD/+RjqsDN5Jq2m
 2Wmv/RF9Yki8Dii+FZeeAlXI969rXqgwayIvYpulhtzE1bZSKz5425r/2WzS2OfpU1Kg
 L82ai8ukqajVosV0JHs0dsBMEHVA1yog+NhVGLuQvpUCz0RsojAtEm29VXQm1C08WZr7
 js5u5kA5Ukyg8E8gly5/KJhGZ8nPNxP11wyadQW+KMNnXArVIqaCUql4BFGOEthNC0J1
 iPhqTX75u9/vK9iya5X52GZC8V0p3Ark17fKttEhY38D+ma3FfnO4uMSguVCOeHmRzsS
 eLQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=m7eLj8Yb
Subject: [Buildroot] [PATCH 1/1] Add FREESCALE_IMX_PLATFORM_IMX8DXL
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>, Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Nickl <Stefan.Nickl@gmail.com>

Hello,
I got buildroot working on the NXP i.MX8DXL-WEVK eval board,
but it's unlikely in a shape to be accepted.

So first let me ask whether anyone more familiar with the i.MX8 parts of
buildroot is working on this as well, in which case it probably wouldn't
make sense for me to pursue this further.

This work was originally based on 2023.05, before
794b9e993273fbaa4e814f9a4b3e62c633d8d117 was applied, which also adds
the B0 seco revision, but under ..._PLATFORM_IMX8X, whereas I added a
new ..._PLATFORM_IMX8DXL since I needed a way to distinguish the
i.MX8DXL-WEVK from the i.MX8QXP-MEK in some places.

Also, since I worked off the NXP LF6.1.22_2.0.0 release and can't test
any other i.MX8 platforms, I just added the relevant firmware versions
for that release.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 .../common/imx/imx8-bootloader-prepare.sh     |  2 +
 board/freescale/common/imx/post-image.sh      |  2 +
 board/freescale/imx8dxlevk/readme.txt         | 69 +++++++++++++++++++
 configs/freescale_imx8dxlevk_defconfig        | 39 +++++++++++
 package/freescale-imx/Config.in               |  7 +-
 package/freescale-imx/firmware-imx/Config.in  |  1 +
 .../firmware-imx/firmware-imx.hash            |  1 +
 .../firmware-imx/firmware-imx.mk              |  2 +-
 .../freescale-imx/imx-sc-firmware/Config.in   |  3 +-
 .../imx-sc-firmware/imx-sc-firmware.hash      |  1 +
 .../imx-sc-firmware/imx-sc-firmware.mk        |  6 +-
 package/freescale-imx/imx-seco/Config.in      |  4 +-
 package/freescale-imx/imx-seco/imx-seco.hash  |  1 +
 package/freescale-imx/imx-seco/imx-seco.mk    |  2 +-
 14 files changed, 134 insertions(+), 6 deletions(-)
 create mode 100644 board/freescale/imx8dxlevk/readme.txt
 create mode 100644 configs/freescale_imx8dxlevk_defconfig

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index ace0f6d6..7ebf15b6 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -63,6 +63,8 @@ main ()
 		dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
 		if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
 			${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+	        elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
+			${HOST_DIR}/bin/mkimage_imx8 -soc DXL -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8dxl-evk-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 		else
 			${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
 		fi
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index d36f8291..c359ef60 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -46,6 +46,8 @@ genimage_type()
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" ${BR2_CONFIG}; then
 		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
diff --git a/board/freescale/imx8dxlevk/readme.txt b/board/freescale/imx8dxlevk/readme.txt
new file mode 100644
index 00000000..33ceb669
--- /dev/null
+++ b/board/freescale/imx8dxlevk/readme.txt
@@ -0,0 +1,69 @@
+******************************
+Freescale i.MX8DXL WEVK board
+******************************
+
+This file documents the Buildroot support for the Freescale i.MX8DXL WEVK
+board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8DXL WEVK board:
+
+  make freescale_imx8dxlevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - Image
+  - imx8-boot-sd.bin
+  - imx8dxl-evk.dtb
+  - mkimg.commit
+  - mx8dxl-ddr3-evk-scfw-tcm.bin
+  - mx8dxl-evk-scfw-tcm.bin
+  - mx8dxl-phantom-mek-scfw-tcm.bin
+  - mx8dxl-val-scfw-tcm.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot-atf.bin
+  - u-boot.bin
+  - u-boot-hash.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx8.
+
+Boot the i.MX8DXL WEVK board
+============================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the boot switch as follows:
+SW1:	ON	ON	OFF	OFF
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
new file mode 100644
index 00000000..bf59e644
--- /dev/null
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_IMX_SC_FIRMWARE=y
+BR2_PACKAGE_IMX_SECO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 13d611b6..fe3f2659 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -57,6 +57,10 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
+	bool "imx8dxl"
+
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
@@ -100,7 +104,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0c1913e2..087ddef8 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
 	default "imx6"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	default "imx8"  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	bool
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index eb0c387a..d95a8bea 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
+sha256  f6dc6a5c8fd9b913a15360d3ccd53d188db05a08a8594c518e57622478c72383  firmware-imx-8.20.bin
 sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
 sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 4cceb670..66ef8c39 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.15
+FIRMWARE_IMX_VERSION = 8.20
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
index 4932e62d..016f9739 100644
--- a/package/freescale-imx/imx-sc-firmware/Config.in
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_IMX_SC_FIRMWARE
 	bool "imx-sc-firmware"
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	help
 	  System Control Unit Firmware blobs for the Freescale i.MX8
 	  SoCs.
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index ed83e757..2a4d3b7b 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,5 @@
 # Locally calculated
 sha256  24a647237c0077ce0172563d67fcbc5e8f231bad7cf55a2436848c89579c5a06  imx-sc-firmware-1.8.0.bin
+sha256  1272ac5c31a88017ef548721f3acf930a7eda6ac73aa9f41b5f0cade9d5c0e5f  imx-sc-firmware-1.15.0.bin
 sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
 sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 6a304c0c..9f198b43 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.8.0
+IMX_SC_FIRMWARE_VERSION = 1.15.0
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
@@ -25,6 +25,10 @@ define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
 	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
 endef
+else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL),y)
+define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
+	cp $(@D)/mx8dxl-*-scfw-tcm.bin $(BINARIES_DIR)/
+endef
 else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
 define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
 	cp $(@D)/mx8qm-*-scfw-tcm.bin $(BINARIES_DIR)/
diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
index 41f84446..a9a2e92a 100644
--- a/package/freescale-imx/imx-seco/Config.in
+++ b/package/freescale-imx/imx-seco/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_IMX_SECO
 	bool "imx-seco"
 	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	help
 	  Firmware file for the i.MX8 and i.MX8X Security Controller.
 
@@ -14,6 +15,7 @@ choice
 	prompt "i.MX Seco Firmware Release"
 	default BR2_PACKAGE_IMX_SECO_MX8QMB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default BR2_PACKAGE_IMX_SECO_MX8QXC0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	default BR2_PACKAGE_IMX_SECO_MX8DXLB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL
 	help
 	  Select the appropriate ahab container image to install
 	  to match the iMX asics revision.
diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index 378c24bc..a7ff6cdb 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,5 @@
 # Locally calculated
 sha256  08cf25a4be6841ca7264a50b29c311b386eae1c02fced8a3b55fd04213acb4bc  imx-seco-3.7.5.bin
+sha256  c3bd761f457e939035b01a0ab36e79064a2a1bc6c3cdb3cd847f7f38df0964df  imx-seco-5.9.0.bin
 sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
 sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 987f2465..3788f1e4 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 3.7.5
+IMX_SECO_VERSION = 5.9.0
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
 IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
