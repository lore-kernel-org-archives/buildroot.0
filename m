Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2F0CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3467260663;
	Thu,  4 Sep 2025 16:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_TVyAzBTW1y; Thu,  4 Sep 2025 16:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A62E606DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A62E606DF;
	Thu,  4 Sep 2025 16:34:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02BB2AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CEFE6064A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHf3kMaq7c0M for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D406063A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D406063A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B4C87F4B; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:04:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e9ebce111dad09b91ef639bc6d5f2d9f3dad329d
X-Git-Newrev: 5abc5326fd695be7d2add2e848398c62891bcfdc
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.E4B4C87F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/odroidxu4: remove
 defconfig, broken
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5abc5326fd695be7d2add2e848398c62891bcfdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273936

It has been broken for over 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dodroidxu4&kind=BUILD

Most likely the U-Boot version used is no longer compatible with
recent toolchains.

Unless a fix is provided, this defconfig will be removed.

Cc: Pierre Crokaert <pct@crookies.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 585527b872193956a3354ee05cda30598eeb3e79)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                      |  2 --
 DEVELOPERS                               |  4 ---
 board/hardkernel/odroidxu4/boot.ini      | 38 ----------------------
 board/hardkernel/odroidxu4/genimage.cfg  | 55 --------------------------------
 board/hardkernel/odroidxu4/post-image.sh | 24 --------------
 board/hardkernel/odroidxu4/readme.txt    | 37 ---------------------
 configs/odroidxu4_defconfig              | 27 ----------------
 7 files changed, 187 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dd4da0b412..142e7b0dd0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -28,7 +28,6 @@ board/freescale/common/mxs/post-image.sh Shellcheck
 board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
 board/hardkernel/odroidc2/post-image.sh Shellcheck
 board/hardkernel/odroidc2/rootfs_overlay/etc/init.d/S09modload Shellcheck lib_sysv.Variables
-board/hardkernel/odroidxu4/post-image.sh Shellcheck lib_shellscript.EmptyLastLine
 board/kontron/bl-imx8mm/post-build.sh Shellcheck
 board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch lib_patch.NumberedSubject lib_patch.Upstream
 board/kontron/pitx-imx8m/post-build.sh Shellcheck
@@ -169,7 +168,6 @@ configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
 configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
 configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
-configs/odroidxu4_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 647c4beaf4..dac0c4694f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2745,10 +2745,6 @@ F:	package/liburcu/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
