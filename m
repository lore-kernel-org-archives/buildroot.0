Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AA0CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BE360FB7;
	Fri, 13 Oct 2023 21:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98BE360FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8aNbupKG-OYK; Fri, 13 Oct 2023 21:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FBC06107E;
	Fri, 13 Oct 2023 21:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FBC06107E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 253161BF3C0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C2AE60F28
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C2AE60F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gG2h3BChtZ48 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 21:08:46 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8551D60F0B
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 21:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8551D60F0B
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rPOkqOJuYfJOlrPOkq5Pwy; Fri, 13 Oct 2023 23:08:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 23:08:40 +0200
Message-Id: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMvoDhHwK2FwXF02jecPkaslaW4+n1pFOces/H26qxyUuNcnTnINRzytmHw5FkJ9z5D9tyii4WCsege7XdziOsr5YtqVualuszVfr0ikq9kGqgvtYHX0
 9OF7kyh0J70JBcHXHkTMGl6SizmZVyq3q/3M7KcbYR+zBnzL9IJLVKCDLm2F1w84gEY+qVkMOzk9lwauH7myfbw6UsarlDyQnq9gk3y/31fj4LMchSvrV4jD
 hND3R1MFZBmWhdzgcTjY+3Z9GbKoyxCFpz8d7gTZ19G4oej8oMoY/dMgdkEHbLd4iiDtysRo8FMW1Z66vkFxjk7HdqqqGiavbJgjCJ4t33+4iIIrMh/lWWIo
 iIoNd0iz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697231322; bh=34aLGzUOL6YLfMiVpMb52aoAE2BiDzxnoE+UHRwm9no=;
 h=From:To:Subject:Date:MIME-Version;
 b=LT8NIQzx53QtzDHnqYdLYN8P7i41buDBfkzxKP1e2hP37xUQ7d42WvaYK7vB8OhOB
 2XXZOcnjY0N0q2TczmItl0efa+PSzblDAKKeEM/Z0dlCBCdasrvrvJmSAyXK6p0wAO
 gnh7ZAkOimt8WPg5pTFRCrS5/3cMWVlurRVu3OD2MbIa4fAMc94sqXgGMNY3e/3m3B
 HXZUFNQ8x7hPDzL+L3BoQ9qlvCTEyLnO7bMGi4lyqu3ici2paGyl/SVJk/vZaB0ydu
 NZQjoA8TJTA+iwRtDBcwQw3WgpsAoQU0JKBC/DmbKnyhsiEBKwuJZhwK4MwV5gUlqt
 ESWcIkXQeLuiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LT8NIQzx
Subject: [Buildroot] [PATCH 1/2] board/bananapi/bananapi-m2-berry: switch to
 use extlinux.conf
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While switching bump Linux version to 6.1.57 and U-Boot version to
2023.10.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/bananapi/bananapi-m2-berry/boot.cmd      |  7 -------
 board/bananapi/bananapi-m2-berry/extlinux.conf |  4 ++++
 board/bananapi/bananapi-m2-berry/genimage.cfg  | 18 ------------------
 board/bananapi/bananapi-m2-berry/post-build.sh |  5 +++++
 configs/bananapi_m2_berry_defconfig            |  9 ++++-----
 5 files changed, 13 insertions(+), 30 deletions(-)
 delete mode 100644 board/bananapi/bananapi-m2-berry/boot.cmd
 create mode 100644 board/bananapi/bananapi-m2-berry/extlinux.conf
 create mode 100755 board/bananapi/bananapi-m2-berry/post-build.sh

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
index 0000000000..1f5ff6a611
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
