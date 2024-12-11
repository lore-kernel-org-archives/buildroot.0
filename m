Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B897CE77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D324069F;
	Wed, 11 Dec 2024 15:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKt43ApnePaK; Wed, 11 Dec 2024 15:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A74406A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A74406A5;
	Wed, 11 Dec 2024 15:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA60F6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C719160B55
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6vaRFfF1Jul for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 15:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6657608B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6657608B3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:44:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9236686D0E; Wed, 11 Dec 2024 15:44:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 16:23:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cc2d8b183fdd3fd52454d916ea8eac6f1136925
X-Git-Newrev: 4f6a924fa8e1a1b5d94acd5529eeb7feb9af94e5
X-Patchwork-Hint: ignore
Message-Id: <20241211154453.9236686D0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/cubieboard2: switch to use
 extlinux.conf
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f6a924fa8e1a1b5d94acd5529eeb7feb9af94e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to extlinux instead of U-Boot boot script.
Remove obsolete entry from the .checkpackageignore file.
Drop custom boot script and genimage config.
Drop unnecessary generic and host configs.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                |  1 -
 board/cubietech/cubieboard2/boot.cmd               |  5 -----
 board/cubietech/cubieboard2/genimage.cfg           | 22 ----------------------
 board/cubietech/cubieboard2/post-image.sh          | 16 ----------------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 ++++
 configs/cubieboard2_defconfig                      | 13 ++++---------
 6 files changed, 8 insertions(+), 53 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 42efd60b50..f24859bf49 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -25,7 +25,6 @@ board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
 board/chromebook/snow/sign.sh Shellcheck
 board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch lib_patch.Upstream
-board/cubietech/cubieboard2/post-image.sh Shellcheck
 board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
 board/freescale/common/mxs/post-image.sh Shellcheck
 board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
diff --git a/board/cubietech/cubieboard2/boot.cmd b/board/cubietech/cubieboard2/boot.cmd
deleted file mode 100644
index a9ae0e24e6..0000000000
--- a/board/cubietech/cubieboard2/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv fdt_high ffffffff
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun7i-a20-cubieboard2.dtb
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index f8a8ec05c8..92c8677545 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -1,18 +1,3 @@
-# Minimal SD card image for the Cubieboard2
-# Based in the Orange Pi genimage.cfg
-
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun7i-a20-cubieboard2.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 16M
-}
-
 image sdcard.img {
 	hdimage {
 	}
@@ -24,15 +9,8 @@ image sdcard.img {
 		size = 1016K # 1MB - 8KB
 	}
 
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 512M
 	}
 }
diff --git a/board/cubietech/cubieboard2/post-image.sh b/board/cubietech/cubieboard2/post-image.sh
deleted file mode 100755
index 9cca1b1789..0000000000
--- a/board/cubietech/cubieboard2/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
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
-exit $?
diff --git a/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..14c873e167
--- /dev/null
+++ b/board/cubietech/cubieboard2/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label cubieboard-buildroot
+  kernel /boot/zImage
+  devicetree /boot/sun7i-a20-cubieboard2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 42344eaf9e..9c0e51b37d 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -4,16 +4,16 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
+BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard2/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
@@ -26,9 +26,4 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
