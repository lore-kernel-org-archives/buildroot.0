Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB671CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 07:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 829C8810CA;
	Tue, 19 Aug 2025 07:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_rOlXwjID4T; Tue, 19 Aug 2025 07:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 665D6810CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 665D6810CC;
	Tue, 19 Aug 2025 07:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFD84E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6CB940406
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePVomUuK0Pcl for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 07:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98A5D4005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98A5D4005C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98A5D4005C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:52:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 42947C6B390
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:52:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE93C60697;
 Tue, 19 Aug 2025 07:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A1B51C228086; 
 Tue, 19 Aug 2025 09:52:42 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pierre Crokaert <pct@crookies.net>
Date: Tue, 19 Aug 2025 09:52:41 +0200
Message-ID: <20250819075241.3286980-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755589965; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Yz6e5q277s4a1qFSiegmMk2r/56VeAgxnaa3ZmQ63Hs=;
 b=mbqLoZaifkCnUg3KmAvo7wM8SCvtIh+gOv+OCkX/CHkdgfYir0MwjZzWfKRKzimRVt3Wba
 GLb+vGGKrz+EsOlyMjgJjNDKKeS6LFio2X6SxzUgoB/sSkR1QyZnRyDt6Natw02z0QX+ik
 CnZfmOoX2IBwbIfjXLOXAi0dtvNkxa9YXrpD+gjgquVmH2vfGjrCRRWi/xMkfkWJQLHIET
 p5cGSJkL91TAihN/3i2D9G/5eH4azhukAiFFTw2ExI9zHow6nsn4YZGMIBAVm3yasfv99P
 GyokNXNZkjocTvh0ztOIlhEriD0Zx5anoIIZjNciTmKD9pHDHi0wZ9XDMM83bA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mbqLoZai
Subject: [Buildroot] [PATCH] configs/odroidxu4: remove defconfig, broken
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273936

It has been broken for over 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dodroidxu4&kind=BUILD

Most likely the U-Boot version used is no longer compatible with
recent toolchains.

Unless a fix is provided, this defconfig will be removed.

Cc: Pierre Crokaert <pct@crookies.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                      |  2 -
 DEVELOPERS                               |  4 --
 board/hardkernel/odroidxu4/boot.ini      | 38 ----------------
 board/hardkernel/odroidxu4/genimage.cfg  | 55 ------------------------
 board/hardkernel/odroidxu4/post-image.sh | 24 -----------
 board/hardkernel/odroidxu4/readme.txt    | 37 ----------------
 configs/odroidxu4_defconfig              | 27 ------------
 7 files changed, 187 deletions(-)
 delete mode 100644 board/hardkernel/odroidxu4/boot.ini
 delete mode 100644 board/hardkernel/odroidxu4/genimage.cfg
 delete mode 100755 board/hardkernel/odroidxu4/post-image.sh
 delete mode 100644 board/hardkernel/odroidxu4/readme.txt
 delete mode 100644 configs/odroidxu4_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index e8f1eb2a1e..cf71d2f0c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -25,7 +25,6 @@ board/freescale/common/mxs/post-image.sh Shellcheck
 board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
 board/hardkernel/odroidc2/post-image.sh Shellcheck
 board/hardkernel/odroidc2/rootfs_overlay/etc/init.d/S09modload Shellcheck lib_sysv.Variables
-board/hardkernel/odroidxu4/post-image.sh Shellcheck lib_shellscript.EmptyLastLine
 board/kontron/bl-imx8mm/post-build.sh Shellcheck
 board/kontron/smarc-sal28/post-build.sh Shellcheck
 board/lego/ev3/post-image.sh Shellcheck
@@ -156,7 +155,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/odroidxu4_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 40dae0a279..10f035e007 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2756,10 +2756,6 @@ F:	package/liburcu/
 N:	Philippe Reynes <philippe.reynes@softathome.com>
 F:	package/ibm-sw-tpm2/
 
-N:	Pierre Crokaert <pct@crookies.net>
-F:	board/hardkernel/odroidxu4/
-F:	configs/odroidxu4_defconfig
-
 N:	Pierre Ducroquet <pinaraf@pinaraf.info>
 F:	package/kf5/
 
diff --git a/board/hardkernel/odroidxu4/boot.ini b/board/hardkernel/odroidxu4/boot.ini
deleted file mode 100644
index 87ac7ac135..0000000000
--- a/board/hardkernel/odroidxu4/boot.ini
+++ /dev/null
@@ -1,38 +0,0 @@
-ODROIDXU-UBOOT-CONFIG
-
-# U-Boot Parameters
-setenv initrd_high "0xffffffff"
-setenv fdt_high "0xffffffff"
-
-setenv macaddr "00:1e:06:61:7a:39"
-setenv bootrootfs "console=tty1 root=/dev/mmcblk1p2 rootwait rw fsck.repair=yes net.ifnames=0"
-setenv bootcmd "load mmc 0:1 0x40008000 zImage; load mmc 0:1 0x44000000 exynos5422-odroidxu4.dtb; bootz 0x40008000 - 0x44000000"
-setenv vout "hdmi"
-setenv governor "performance"
-setenv HPD "true"
-
-#  TMDS data amplitude control.
-setenv hdmi_tx_amp_lvl  "31"
-
-#  TMDS data amplitude fine control for each channel.
-setenv hdmi_tx_lvl_ch0      "3"
-setenv hdmi_tx_lvl_ch1      "3"
-setenv hdmi_tx_lvl_ch2      "3"
-
-#  TMDS data pre-emphasis level control.
-setenv hdmi_tx_emp_lvl      "6"
-
-#  TMDS clock amplitude control.
-setenv hdmi_clk_amp_lvl     "31"
-
-#  TMDS data source termination resistor control.
-setenv hdmi_tx_res      "0"
-
-setenv hdmi_phy_control "hdmi_tx_amp_lvl=${hdmi_tx_amp_lvl} hdmi_tx_lvl_ch0=${hdmi_tx_lvl_ch0} hdmi_tx_lvl_ch1=${hdmi_tx_lvl_ch1} hdmi_tx_lvl_ch2=${hdmi_tx_lvl_ch2} hdmi_tx_emp_lvl=${hdmi_tx_emp_lvl} hdmi_clk_amp_lvl=${hdmi_clk_amp_lvl} hdmi_tx_res=${hdmi_tx_res} HPD=${HPD} vout=${vout}"
-
-# final boot args
-setenv bootargs "${bootrootfs} ${videoconfig} smsc95xx.macaddr=${macaddr} governor=${governor} ${hdmi_phy_control}"
-
-# Boot the board
-boot
-
diff --git a/board/hardkernel/odroidxu4/genimage.cfg b/board/hardkernel/odroidxu4/genimage.cfg
deleted file mode 100644
index 0a90d6be50..0000000000
--- a/board/hardkernel/odroidxu4/genimage.cfg
+++ /dev/null
@@ -1,55 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"boot.ini",
-			"zImage",
-			"exynos5422-odroidxu4.dtb"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition bl1 {
-		in-partition-table = "no"
-		image = "bl1.bin.hardkernel"
-		offset = 512
-		size = 15K
-	}
-
-	partition bl2 {
-		in-partition-table = "no"
-		image = "bl2.bin.hardkernel.720k_uboot"
-		offset = 15872 # 15KB + 512B
-		size = 16K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-dtb.bin"
-		offset = 32256 # 31KB + 512B
-		size = 720K
-	}
-
-	partition tzsw {
-		in-partition-table = "no"
-		image = "tzsw.bin.hardkernel"
-		offset = 769536 # 751KB + 512B
-		size = 256K
-	}
-
-	partition vfat {
-		partition-type = 0xC
-		image = "boot.vfat"
-		offset = 2M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/hardkernel/odroidxu4/post-image.sh b/board/hardkernel/odroidxu4/post-image.sh
deleted file mode 100755
index 025906cd09..0000000000
--- a/board/hardkernel/odroidxu4/post-image.sh
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
-
-# The bl1.bin.hardkernel file provided by the uboot hardkernel repository is overwritten
-# by the bl2.bin.hardkernel in the sd_fusing.sh script because it is too big.
-# In order to implement this in genimage, we need to truncate the bl1.bin file
-# so that it does not exceed the available place.
-# An issue has been filled about this: https://github.com/hardkernel/u-boot/issues/45
-truncate -s 15360 ${BINARIES_DIR}/bl1.bin.hardkernel
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
diff --git a/board/hardkernel/odroidxu4/readme.txt b/board/hardkernel/odroidxu4/readme.txt
deleted file mode 100644
index e3cba8b0c1..0000000000
--- a/board/hardkernel/odroidxu4/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Odroid XU-4 board with Samsung Exynos 5422 SoC
-
-How to build it
-===============
-
-  $ make odroidxu4_defconfig
-
-Then you can edit the build options using
-
-  $ make menuconfig
-
-Compile all and build rootfs image:
-
-  $ make
-
-Note: you will need to have access to the network, since Buildroot will
-download the packages' sources.
-
-Result of the build
--------------------
-
-After building, you should obtain all output files in output/images/
-
-
-How to write the SD card or eMMC
-================================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Insert the SDcard into your ODROID-XU4, and power it up. Your new system
-should come up now.
-
diff --git a/configs/odroidxu4_defconfig b/configs/odroidxu4_defconfig
deleted file mode 100644
index ab819efa23..0000000000
--- a/configs/odroidxu4_defconfig
+++ /dev/null
@@ -1,27 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidxu4/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.14.16-104"
-BR2_LINUX_KERNEL_DEFCONFIG="odroidxu4"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="odroid-xu4"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="sd_fuse/bl1.bin.hardkernel sd_fuse/bl2.bin.hardkernel.720k_uboot sd_fuse/tzsw.bin.hardkernel "
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
