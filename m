Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A49E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15367844C8;
	Fri,  6 Sep 2024 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kXufWWrjRxz; Fri,  6 Sep 2024 20:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C6E844BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C6E844BF;
	Fri,  6 Sep 2024 20:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA2C1BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4EFF6108E
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYEWpdeckmzv for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB37A60770
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB37A60770
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A830A86EE3; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 00:04:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52e9d8785a33b5fd3aa3dd8f1af60fa17a17f4d0
X-Git-Newrev: 4265790541e925708364e1e86038bd2884eec3a5
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.A830A86EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_neo_defconfig:
 new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=4265790541e925708364e1e86038bd2884eec3a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new defconfig for the NanoPi NEO board made by
FriendlyARM. This board is based on the Allwinner H3 SoC.

See: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO

This patch uses the mainline kernel and u-boot for the board.

The configurations are based on the previously dropped defconfig
maintained by Yann E. MORIN <yann.morin.1998@free.fr>.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 ++
 board/friendlyarm/nanopi-neo/extlinux.conf         |  4 ++
 board/friendlyarm/nanopi-neo/genimage.cfg          | 17 ++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../nanopi-neo/patches/linux/linux.hash            |  2 +
 .../nanopi-neo/patches/uboot/uboot.hash            |  2 +
 board/friendlyarm/nanopi-neo/post-build.sh         |  5 +++
 board/friendlyarm/nanopi-neo/readme.txt            | 41 ++++++++++++++++++
 configs/friendlyarm_nanopi_neo_defconfig           | 48 ++++++++++++++++++++++
 9 files changed, 124 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..754f153b39 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -868,6 +868,10 @@ F:	package/logsurfer/
 N:	Dominik Michael Rauh <dmrauh@posteo.de>
 F:	package/gdal/
 
+N:	Dong Wang <wangdong115@foxmail.com>
+F:	board/friendlyarm/nanopi-neo/
+F:	configs/friendlyarm_nanopi_neo_defconfig
+
 N:	Doug Kehn <rdkehn@gmail.com>
 F:	package/nss-pam-ldapd/
 F:	package/sp-oops-extract/
diff --git a/board/friendlyarm/nanopi-neo/extlinux.conf b/board/friendlyarm/nanopi-neo/extlinux.conf
new file mode 100644
index 0000000000..e65951f9d9
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi NEO linux
+  kernel /boot/zImage
+  devicetree /boot/sun8i-h3-nanopi-neo.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait panic=10
diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
new file mode 100644
index 0000000000..ec78fd0e56
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -0,0 +1,17 @@
+# Minimal SD card image for the NanoPi NEO.
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash b/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/friendlyarm/nanopi-neo/patches/linux/linux.hash b/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
new file mode 100644
index 0000000000..ecff37638a
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  93218296934915636fe6ba08e125948424cc270fd8948502c0ab91087a9fccd8  linux-6.6.44.tar.xz
diff --git a/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/friendlyarm/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-neo/readme.txt b/board/friendlyarm/nanopi-neo/readme.txt
new file mode 100644
index 0000000000..cfe7714a41
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo/readme.txt
@@ -0,0 +1,41 @@
+Nanopi NEO
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi NEO. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+FriendlyARM Nanopi NEO link:
+https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_neo_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SD card in your Nanopi NEO and power it up. The console
+is on the debug TTL UART, 115200 8N1.
+
+Ethernet
+==========
+
+  # udhcpc -i eth0
+
+Enjoy!
diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
new file mode 100644
index 0000000000..754af777fb
--- /dev/null
+++ b/configs/friendlyarm_nanopi_neo_defconfig
@@ -0,0 +1,48 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Hashes
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.44"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Host utilities
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
