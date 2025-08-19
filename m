Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD81CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 17:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E90814C2;
	Tue, 19 Aug 2025 17:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K2RV2agVNZM; Tue, 19 Aug 2025 17:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E7E814C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E7E814C6;
	Tue, 19 Aug 2025 17:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78680DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A3AB814C2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Y6Pochg-UHT for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 17:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3131B814C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3131B814C6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3131B814C6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:33:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 51E851A0D18
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:33:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 245E160697;
 Tue, 19 Aug 2025 17:33:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54E721C22C719; 
 Tue, 19 Aug 2025 19:33:22 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 19 Aug 2025 19:33:18 +0200
Message-ID: <20250819173319.3352151-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755624803; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=0mQHjBIli4+hFfZ1e3xQVuwAlFBdt1CKx9/jkzB70kY=;
 b=NaOf7lXmMOtAlB+eKX/n8afYwl/GQZ8XKeTDYnFG2/nMkQQAFDcVYJamBfEULE+nuFnp29
 3J98tJYUroH0rWcqqXLekh48w1ltA7asjHMVAna+WvgGU2sb1/98O6Ciai/dZnoJXWn0g+
 YMuk63TSR/nXOCdb5sY8UK4WiHaNksMnIjnFxPbym91de9bd1Z9w3OCLFrkmi9gk06FIBr
 hu5Zg+0nIX70qclUZaA+XN+IHIJy872LGDOdWOlph3JM8GWQmtS7nMck33ejak8GezjkSf
 jpf7KMS8u7oPskKENj0dqUi9RoS6u1aXpEb3VqEmrN3bePEqo0Nx4rc89IjqdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NaOf7lXm
Subject: [Buildroot] [PATCH] configs/toradex_apalis_imx6: remove defconfig,
 broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774072

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dtoradex_apalis_imx6&kind=BUILD

It uses an outdated Linux 4.9 kernel, which no longer builds with
modern toolchains.

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774072

Cc: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  2 -
 DEVELOPERS                                    |  2 -
 board/toradex/apalis-imx6/genimage.cfg        | 15 ------
 .../patches/linux-headers/linux-headers.hash  |  1 -
 .../apalis-imx6/patches/linux/linux.hash      |  2 -
 .../apalis-imx6/patches/uboot/uboot.hash      |  2 -
 board/toradex/apalis-imx6/post-image.sh       | 20 -------
 board/toradex/apalis-imx6/readme.txt          | 53 -------------------
 board/toradex/apalis-imx6/uEnv.txt            |  6 ---
 configs/toradex_apalis_imx6_defconfig         | 26 ---------
 10 files changed, 129 deletions(-)
 delete mode 100644 board/toradex/apalis-imx6/genimage.cfg
 delete mode 120000 board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/toradex/apalis-imx6/patches/linux/linux.hash
 delete mode 100644 board/toradex/apalis-imx6/patches/uboot/uboot.hash
 delete mode 100755 board/toradex/apalis-imx6/post-image.sh
 delete mode 100644 board/toradex/apalis-imx6/readme.txt
 delete mode 100644 board/toradex/apalis-imx6/uEnv.txt
 delete mode 100644 configs/toradex_apalis_imx6_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index b6d1821025..34646f144f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -63,7 +63,6 @@ board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
 board/synopsys/axs10x/post-build.sh Shellcheck
 board/technologic/ts4900/post-image.sh Shellcheck
-board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch lib_patch.Upstream
 boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch lib_patch.Upstream
@@ -186,7 +185,6 @@ configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
-configs/toradex_apalis_imx6_defconfig lib_defconfig.ForceCheckHash
 configs/ts4900_defconfig lib_defconfig.ForceCheckHash
 configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/ts7680_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 9519fa3ccb..9bcce10cb2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3024,8 +3024,6 @@ F:	package/wpa_supplicant/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
-F:	board/toradex/apalis-imx6/
-F:	configs/toradex_apalis_imx6_defconfig
 F:	package/aoetools/
 F:	package/asn1c/
 F:	package/azure-iot-sdk-c/
diff --git a/board/toradex/apalis-imx6/genimage.cfg b/board/toradex/apalis-imx6/genimage.cfg
deleted file mode 100644
index a277decaa8..0000000000
--- a/board/toradex/apalis-imx6/genimage.cfg
+++ /dev/null
@@ -1,15 +0,0 @@
-# Minimal SD card image for the Toradex Apalis i.MX6 COM
-#
-# It does not need a boot section for a bootloader since it is booted
-# from its internal flash memory (eMMC).
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-		size = 512M
-	}
-}
diff --git a/board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash b/board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/toradex/apalis-imx6/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
deleted file mode 100644
index 0697228724..0000000000
--- a/board/toradex/apalis-imx6/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  722ece80ee8dbcc04309c89139da8b1df6974e1ab4bb66d04c1906a576fa46fa  linux-d899927728beca8357a5b4120b690cb3c1d80844-git4.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
deleted file mode 100644
index 6132435fed..0000000000
--- a/board/toradex/apalis-imx6/patches/uboot/uboot.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  f8d3e45d7944c9620ecacbd8f8824db42134c70e3b55efd6dab127bf763e48c2  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git4.tar.gz
diff --git a/board/toradex/apalis-imx6/post-image.sh b/board/toradex/apalis-imx6/post-image.sh
deleted file mode 100755
index 2b49f9d3d0..0000000000
--- a/board/toradex/apalis-imx6/post-image.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/usr/bin/env bash
-
-GENIMAGE_CFG="$(dirname $0)/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-# copy the uEnv.txt to the output/images directory
-cp board/toradex/apalis-imx6/uEnv.txt $BINARIES_DIR/uEnv.txt
-
-rm -rf "${GENIMAGE_TMP}"
-
-# generate rootfs.img
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
-
-RET=${?}
-exit ${RET}
diff --git a/board/toradex/apalis-imx6/readme.txt b/board/toradex/apalis-imx6/readme.txt
deleted file mode 100644
index feddad641c..0000000000
--- a/board/toradex/apalis-imx6/readme.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Toradex Apalis i.MX6 Computer on Module
-
-Intro
-=====
-
-The Apalis iMX6 is a small form-factor Computer on Module that comes
-in both quad core and dual core versions based on Freescale i.MX6Q and
-Freescale i.MX6D SoCs respectively. The Cortex A9 quad core and dual
-core CPU peaks at 1 GHz for commercial temperature variant, while the
-industrial temperature variant has a peak frequency of 800 MHz.
-
-https://www.toradex.com/computer-on-modules/apalis-arm-family/freescale-imx-6
-
-It supports two carrier boards:
-
-Apalis Evaluation Board
-https://www.toradex.com/products/carrier-boards/apalis-evaluation-board
-
-Ixora Carrier Board
-https://www.toradex.com/products/carrier-boards/ixora-carrier-board
-
-How to build it
-===============
-
-Configure Buildroot:
-
-    $ make toradex_apalis_imx6_defconfig
-
-Compile everything and build the rootfs image:
-
-    $ make
-
-How to boot the image
-=====================
-
-The board only boots from its internal flash memory eMMC, so the
-bootloader image should be copied to it, following the procedures
-described in Toradex website.
-
-http://developer.toradex.com/knowledge-base/flashing-linux-on-imx6-modules
-
-Buildroot prepares a "sdcard.img" in output/images/ with the kernel
-image, device tree and a root filesystem, ready to be dumped on an SD
-card.
-
-    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
-
-To boot from the SD card, you should change the U-Boot
-environment. Since U-Boot is running from internal eMMC, you will need
-to access its command line prompt and manually set the necessary
-variables to boot from the external SD card. For convenience, you can
-use uEnv.txt provided in output/images/ as a reference to create the
-necessary U-Boot variables to boot from the SD card.
diff --git a/board/toradex/apalis-imx6/uEnv.txt b/board/toradex/apalis-imx6/uEnv.txt
deleted file mode 100644
index 96ab80cfb6..0000000000
--- a/board/toradex/apalis-imx6/uEnv.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-boot_file=zImage
-fdt_file=imx6q-apalis_v1_0-ixora.dtb
-sdargs=ip=off root=/dev/mmcblk1p1 rw,noatime rootfstype=ext4 rootwait
-sddtbload=ext2load mmc 2:1 ${fdt_addr_r} boot/${fdt_file}
-sdkernelload=ext2load mmc 2:1 ${kernel_addr_r} boot/${boot_file}
-bootcmd=run setup; setenv bootargs ${defargs} ${sdargs} ${setupargs} ${vidargs}; echo Booting from SD card...; run sddtbload; run sdkernelload; bootz ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/configs/toradex_apalis_imx6_defconfig b/configs/toradex_apalis_imx6_defconfig
deleted file mode 100644
index e447190e0c..0000000000
--- a/configs/toradex_apalis_imx6_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_GLOBAL_PATCH_DIR="board/toradex/apalis-imx6/patches"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d899927728beca8357a5b4120b690cb3c1d80844"
-BR2_LINUX_KERNEL_DEFCONFIG="apalis_imx6"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora imx6q-apalis-ixora-v1.1"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="30a1208727729dae22cb42f9ba9ba17efe5e6f77"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="apalis_imx6"
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
