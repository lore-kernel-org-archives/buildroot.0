Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DCBCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 20:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A491F60606;
	Mon, 18 Aug 2025 20:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnWbCXTpoZA9; Mon, 18 Aug 2025 20:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BDAB60631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BDAB60631;
	Mon, 18 Aug 2025 20:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8FBE2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2430380C15
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj9CryQjqYBX for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 20:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 837B6804D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 837B6804D9
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 837B6804D9
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:32:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0311CC6B3B0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 20:32:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 524C3606A6;
 Mon, 18 Aug 2025 20:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16D801C22A17A; 
 Mon, 18 Aug 2025 22:32:25 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 18 Aug 2025 22:32:22 +0200
Message-ID: <20250818203223.3219221-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755549147; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=/NWJwCXkgAVLTC2kFYXV9Z3KrvOWwgvTbuV6/uB1R9E=;
 b=onzLvpWdf5mnp0GdGEXFkGvAScyI1M2b4j6icH8j2XfJ6xvK2dqO0tmS51Faex6AhwV1vu
 Lcqo7uvicGMRWwPMCnor3G5wurnsXTGluDuofxZzz1cEMGsjgzg+jdxoVSzNDOQIvvwFTc
 hQiMRUHRS9kPN/gK9MEj3/gzd56wVOpiOT9q9a3bUO+h05RC/q6dZPrk55C+3qfwFe34Xe
 /GmBOXLaA5N2tvSKFm3DhICIJQkL+qfOSKd0ZyqhKWs0fQl1aK7Js8msnvDoDuwORIzVO5
 g8fDDNiyH6A1ZizDvRoDh0Ot7V95Ojo2AQCKBgRrY2kqsfM8RHxzT4T/+dBTCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=onzLvpWd
Subject: [Buildroot] [PATCH] configs/andes_ae350_45: remove defconfig, broken
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

This configuration doesn't build anymore as its kernel version has
been removed from https://github.com/andestech/linux/.

This has been failing for over 2 months without anyone bothering to
fix it, so let's drop this defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272348

Cc: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |   4 -
 DEVELOPERS                                    |   2 -
 board/andes/ae350/genimage_sdcard.cfg         |  26 -----
 ...-Support-DTS-of-ftsdc010-driver-for-.patch |  38 -------
 ...-tree-blob-address-at-8-byte-boundar.patch |  42 -------
 board/andes/ae350/post-build.sh               |   3 -
 board/andes/ae350/readme.txt                  | 106 ------------------
 .../boot/extlinux/extlinux.conf               |   4 -
 board/andes/ae350/uboot.config.fragment       |   6 -
 configs/andes_ae350_45_defconfig              |  40 -------
 10 files changed, 271 deletions(-)
 delete mode 100644 board/andes/ae350/genimage_sdcard.cfg
 delete mode 100644 board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
 delete mode 100644 board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
 delete mode 100755 board/andes/ae350/post-build.sh
 delete mode 100644 board/andes/ae350/readme.txt
 delete mode 100644 board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
 delete mode 100644 board/andes/ae350/uboot.config.fragment
 delete mode 100644 configs/andes_ae350_45_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 554c05ef70..8b21f78357 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,7 +1,4 @@
 board/amarula/vyasa/post-build.sh Shellcheck
-board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch lib_patch.Upstream
-board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch lib_patch.Upstream
-board/andes/ae350/post-build.sh Shellcheck
 board/arcturus/aarch64-ucls1012a/post-build.sh Shellcheck
 board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
@@ -101,7 +98,6 @@ boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_p
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
-configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/aspeed_ast2500evb_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index a28f3e8d57..f50a92fc56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2601,8 +2601,6 @@ F:	package/systemd/
 F:	package/tcf-agent/
 
 N:	Leo Yu-Chi Liang <ycliang@andestech.com>
-F:	board/andes
-F:	configs/andes_ae350_45_defconfig
 F:	package/andes-spi-burn/
 F:	package/kmon/
 
diff --git a/board/andes/ae350/genimage_sdcard.cfg b/board/andes/ae350/genimage_sdcard.cfg
deleted file mode 100644
index 58c6f8f156..0000000000
--- a/board/andes/ae350/genimage_sdcard.cfg
+++ /dev/null
@@ -1,26 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"u-boot-spl.bin",
-			"u-boot.itb",
-			"ae350_ax45mp.dtb",
-		}
-	}
-	size = 2M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		bootable = true
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch b/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
deleted file mode 100644
index be89a1563f..0000000000
--- a/board/andes/ae350/patches/uboot/0001-mmc-ftsdc010_mci-Support-DTS-of-ftsdc010-driver-for-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 16aad5594e08550295ea3c12c1c9ed6f64774748 Mon Sep 17 00:00:00 2001
-From: Rick Chen <rick@andestech.com>
-Date: Tue, 29 Mar 2022 13:41:10 +0800
-Subject: [PATCH] mmc: ftsdc010_mci: Support DTS of ftsdc010 driver for
- generic dma
-
-The ftsdc010 driver has been implemented for generic dma in Linux
-kernel. And its compatible is andestech,atfsdc010g to distinguish
-the legacy andestech,atfsdc010 which is not for generic dma.
-
-Althought the ftsdc010_mci driver in U-Boot does not use dma, but
-it still can work well with the mmc node for generic dma. So add
-the compatible string to support it.
-
-Signed-off-by: Rick Chen <rick@andestech.com>
-
-Upstream-Status: Pending
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- drivers/mmc/ftsdc010_mci.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/mmc/ftsdc010_mci.c b/drivers/mmc/ftsdc010_mci.c
-index 570d54cf9d..65b1d447a8 100644
---- a/drivers/mmc/ftsdc010_mci.c
-+++ b/drivers/mmc/ftsdc010_mci.c
-@@ -460,6 +460,7 @@ int ftsdc010_mmc_bind(struct udevice *dev)
- 
- static const struct udevice_id ftsdc010_mmc_ids[] = {
- 	{ .compatible = "andestech,atfsdc010" },
-+	{ .compatible = "andestech,atfsdc010g" },
- 	{ }
- };
- 
--- 
-2.34.1
-
diff --git a/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch b/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
deleted file mode 100644
index 5080554ca1..0000000000
--- a/board/andes/ae350/patches/uboot/0002-spl-Align-device-tree-blob-address-at-8-byte-boundar.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 933ad8a59f7fd9b2088badc3e97167d750a40b5a Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Mon, 12 Jul 2021 11:52:31 +0800
-Subject: [PATCH] spl: Align device tree blob address at 8-byte boundary
-
-Since libfdt v1.6.1, a new requirement on the device tree address via:
-
-  commit 5e735860c478 ("libfdt: Check for 8-byte address alignment in fdt_ro_probe_()")
-
-must be met that the device tree must be loaded in to memory at an
-8-byte aligned address.
-
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-
-This patch was imported from U-boot patchwork:
-https://patchwork.ozlabs.org/project/uboot/patch/20210712035231.26475-1-bmeng.cn@gmail.com/
-
-Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
----
- common/spl/spl_fit.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/common/spl/spl_fit.c b/common/spl/spl_fit.c
-index a35be529..a76ad14a 100644
---- a/common/spl/spl_fit.c
-+++ b/common/spl/spl_fit.c
-@@ -382,6 +382,12 @@ static int spl_fit_append_fdt(struct spl_image_info *spl_image,
- 	 */
- 	image_info.load_addr = spl_image->load_addr + spl_image->size;
- 
-+	/*
-+	 * Since libfdt v1.6.1, the device tree must be loaded in to memory
-+	 * at an 8-byte aligned address.
-+	 */
-+	image_info.load_addr = roundup(image_info.load_addr, 8);
-+
- 	/* Figure out which device tree the board wants to use */
- 	node = spl_fit_get_image_node(ctx, FIT_FDT_PROP, index++);
- 	if (node < 0) {
--- 
-2.34.1
-
diff --git a/board/andes/ae350/post-build.sh b/board/andes/ae350/post-build.sh
deleted file mode 100755
index 84187a064b..0000000000
--- a/board/andes/ae350/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-cp $BINARIES_DIR/Image $TARGET_DIR/boot
-cp $BINARIES_DIR/ae350_ax45mp.dtb $TARGET_DIR/boot
diff --git a/board/andes/ae350/readme.txt b/board/andes/ae350/readme.txt
deleted file mode 100644
index 36561fc777..0000000000
--- a/board/andes/ae350/readme.txt
+++ /dev/null
@@ -1,106 +0,0 @@
-Intro
-=====
-
-Andestech AE350 Platform
-
-The AE350 prototype demonstrates the AE350 platform on the FPGA.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-  $ make andes_ae350_45_defconfig
-
-If you want to customize your configuration:
-
-  $ make menuconfig
-
-Build everything
-----------------
-Note: you will need to access to the network, since Buildroot will
-download the packages' sources.
-
-  $ make
-
-Result of the build
--------------------
-
-After building, you should obtain the following files:
-
-  output/images/
-  |-- ae350_ax45mp.dtb
-  |-- boot.vfat
-  |-- fw_dynamic.bin
-  |-- fw_dynamic.elf
-  |-- Image
-  |-- rootfs.ext2
-  |-- rootfs.ext4 -> rootfs.ext2
-  |-- sdcard.img
-  |-- u-boot-spl.bin
-  `-- u-boot.itb
-
-How to update the bootloader and device-tree
-============================================
-
-To update the bootloader and device tree, make sure you have
-an ICEman (Andes OpenOCD [1]) and AICE [2] connection set up
-as below:
-
-  Local Host                 Local/Remote Host
- .-----------------.          .--------------.
- | buildroot images|          |              |
- |                 |         ICEman host <IP:PORT>
- | .----------.    |          |  .--------.  |
- | | SPI_burn |<---+--socket--+->| ICEman |  |
- | '----------'    |          |  '--.-----'  |
- '-----------------'          '-----|--------'
-                                    |
-                                    USB
-   .--------------.                 |
-   | target       |           .-----v-----.
-   | board        <----JTAG---| AICE      |
-   |              |           '-----------'
-   '--------------'
-
-[1] https://github.com/andestech/ICEman
-[2] https://www.andestech.com/en/products-solutions/andeshape-platforms/aice-micro/
-
-The Andes SPI_burn tool will be located in output/host/bin. Use
-the following commands to update the bootloader and device tree:
-
-  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x0     -i u-boot-spl.bin
-  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x10000 -i u-boot.itb
-  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0xf0000 -i ae350_ax45mp.dtb
-
-Note that the --addr option specifies the offset starting from
-the flash base address 0x80000000 and set by U-Boot configurations.
-e.g.
-u-boot-spl.bin  : CONFIG_SPL_TEXT_BASE=0x80000000
-u-boot.itb      : CONFIG_SPL_LOAD_FIT_ADDRESS=0x80010000
-ae350_ax45mp.dtb: CONFIG_SYS_FDT_BASE=0x800f0000
-
-How to write the SD card
-========================
-
-Copy the sdcard.img to a SD card with "dd":
-
-  $ sudo dd if=sdcard.img of=/dev/sdX bs=4096
-  $ sudo sync
-
-Your SD card partition should be:
-
-  Disk /dev/sdb: 14.48 GiB, 15552479232 bytes, 30375936 sectors
-  Disk model: Multi-Card
-  Units: sectors of 1 * 512 = 512 bytes
-  Sector size (logical/physical): 512 bytes / 512 bytes
-  I/O size (minimum/optimal): 512 bytes / 512 bytes
-  Disklabel type: dos
-  Disk identifier: 0x00000000
-
-  Device     Boot Start    End Sectors Size Id Type
-  /dev/sdb1           1   4096    4096   2M  c W95 FAT32 (LBA)
-  /dev/sdb2  *     4097 126976  122880  60M 83 Linux
-
-Insert SD card and reset the board, it should boot Linux from mmc.
diff --git a/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf b/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
deleted file mode 100644
index be19e196a8..0000000000
--- a/board/andes/ae350/rootfs_overlay/boot/extlinux/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-   kernel /boot/Image
-   fdt /boot/ae350_ax45mp.dtb
-   append earlycon=sbi root=/dev/mmcblk0p2 rootwait
diff --git a/board/andes/ae350/uboot.config.fragment b/board/andes/ae350/uboot.config.fragment
deleted file mode 100644
index 4497ed4c74..0000000000
--- a/board/andes/ae350/uboot.config.fragment
+++ /dev/null
@@ -1,6 +0,0 @@
-CONFIG_SPL_FS_FAT=y
-CONFIG_SPL_MMC=y
-CONFIG_SPL_OPENSBI_LOAD_ADDR=0x0
-CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
-CONFIG_DISPLAY_CPUINFO=y
-CONFIG_DISPLAY_BOARDINFO=y
diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
deleted file mode 100644
index 7b5a6f73c6..0000000000
--- a/configs/andes_ae350_45_defconfig
+++ /dev/null
@@ -1,40 +0,0 @@
-BR2_riscv=y
-BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
-BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_OVERLAY="board/andes/ae350/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/andes/ae350/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,v6.0.y_ae350-ax45mp)/linux-v6.0.y_ae350-ax45mp.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_OPENSBI=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,22f38ee6c658a660083aa45c4ec6c72f66a17260)/opensbi-22f38ee6c658a660083aa45c4ec6c72f66a17260.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="andes/ae350"
-# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,u-boot,u-boot,a5dfa3b8a0f7ad555495bad1386613d2de4ba619)/u-boot-a5dfa3b8a0f7ad555495bad1386613d2de4ba619.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350/uboot.config.fragment"
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
-# BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_PACKAGE_HOST_ANDES_SPI_BURN=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
