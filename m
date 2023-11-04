Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE06C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9401A8231B;
	Sat,  4 Nov 2023 14:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9401A8231B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfPYTGW9Xdxk; Sat,  4 Nov 2023 14:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5AC8231D;
	Sat,  4 Nov 2023 14:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB5AC8231D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95C301BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E88B41E81
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E88B41E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MGnDuSSVz-6T for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E06E41E34
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E06E41E34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C4C4864E1; Sat,  4 Nov 2023 14:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 15:05:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e60fde3451236545c7ffc39d4885106507121730
X-Git-Newrev: 7aa75f9d16576a3206bf4ee54248dfa035522ece
X-Patchwork-Hint: ignore
Message-Id: <20231104140820.3C4C4864E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/bananapi/bananapi-m2-berry: switch
 to use extlinux.conf
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7aa75f9d16576a3206bf4ee54248dfa035522ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While switching bump Linux version to 6.1.57 and U-Boot version to
2023.10.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/bananapi/bananapi-m2-berry/boot.cmd      |  7 -------
 board/bananapi/bananapi-m2-berry/extlinux.conf |  4 ++++
 board/bananapi/bananapi-m2-berry/genimage.cfg  | 18 ------------------
 board/bananapi/bananapi-m2-berry/post-build.sh |  6 ++++++
 configs/bananapi_m2_berry_defconfig            |  9 ++++-----
 5 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/board/bananapi/bananapi-m2-berry/boot.cmd b/board/bananapi/bananapi-m2-berry/boot.cmd
deleted file mode 100644
index 9efb6bc89d..0000000000
--- a/board/bananapi/bananapi-m2-berry/boot.cmd
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait
-
-mmc dev 0
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-v40-bananapi-m2-berry.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m2-berry/extlinux.conf b/board/bananapi/bananapi-m2-berry/extlinux.conf
new file mode 100644
index 0000000000..1f1b4f5cf3
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/extlinux.conf
@@ -0,0 +1,4 @@
+label Bananapi M2 Berry linux
+  kernel /boot/zImage
+  devicetree /boot/sun8i-v40-bananapi-m2-berry.dtb
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/bananapi/bananapi-m2-berry/genimage.cfg b/board/bananapi/bananapi-m2-berry/genimage.cfg
index 535f3dffee..92c8677545 100644
--- a/board/bananapi/bananapi-m2-berry/genimage.cfg
+++ b/board/bananapi/bananapi-m2-berry/genimage.cfg
@@ -1,15 +1,3 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-v40-bananapi-m2-berry.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
-}
-
 image sdcard.img {
 	hdimage {
 	}
@@ -21,12 +9,6 @@ image sdcard.img {
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
diff --git a/board/bananapi/bananapi-m2-berry/post-build.sh b/board/bananapi/bananapi-m2-berry/post-build.sh
new file mode 100755
index 0000000000..21a2b0d8e7
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 644 -D "${BOARD_DIR}"/extlinux.conf \
+	"${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 300261d07f..200257ac0d 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -2,21 +2,23 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/bananapi-m2-berry/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.57"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -26,6 +28,3 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-berry/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
