Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40CBC282D2
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB9976FCB2;
	Fri, 28 Feb 2025 17:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33bM3Vlxxeh8; Fri, 28 Feb 2025 17:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73DBB706E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73DBB706E6;
	Fri, 28 Feb 2025 17:01:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1954F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E89724195D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxEZfPuj-tiK for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9436D42697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9436D42697
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B5DB82581; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 23 Jan 2025 21:08:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea8dcb2288149e4ebbdb473ef2ac2f0ddb1f786e
X-Git-Newrev: 11c11b9a247a920059a4e0f569da8eb39ad1914f
X-Patchwork-Hint: ignore
Message-Id: <20250228163016.8B5DB82581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/rock4se: new defconfig
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11c11b9a247a920059a4e0f569da8eb39ad1914f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
[Julien:
 - add Patrik Signed-off-by
 - regenerate defconfig with "make savedefconfig"
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  4 ++
 board/radxa/rock4se/extlinux.conf                  |  4 ++
 board/radxa/rock4se/genimage.cfg                   | 22 +++++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/radxa/rock4se/patches/linux/linux.hash       |  2 +
 board/radxa/rock4se/patches/uboot/uboot.hash       |  2 +
 board/radxa/rock4se/post-build.sh                  |  5 +++
 board/radxa/rock4se/readme.txt                     | 37 +++++++++++++++++++
 configs/rock4se_defconfig                          | 43 ++++++++++++++++++++++
 9 files changed, 120 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d8ae8289b..059383d364 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2564,6 +2564,10 @@ F:	support/testing/tests/package/test_lxc/
 N:	Patrick Oppenlander <patrick.oppenlander@gmail.com>
 F:	package/minisign/
 
+N:	Patrik Olsson <johan.patrik.olsson@gmail.com>
+F:	board/radxa/rock4se
+F:	configs/rock4se_defconfig
+
 N:	Paul Cercueil <paul@crapouillou.net>
 F:	package/libiio/
 F:	package/lightning/
diff --git a/board/radxa/rock4se/extlinux.conf b/board/radxa/rock4se/extlinux.conf
new file mode 100644
index 0000000000..eb037e0e0f
--- /dev/null
+++ b/board/radxa/rock4se/extlinux.conf
@@ -0,0 +1,4 @@
+label Radxa ROCK 4SE Linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-rock-4se.dtb
+  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
diff --git a/board/radxa/rock4se/genimage.cfg b/board/radxa/rock4se/genimage.cfg
new file mode 100644
index 0000000000..966c869273
--- /dev/null
+++ b/board/radxa/rock4se/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "idbloader.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 8M
+		size = 30M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/radxa/rock4se/patches/linux-headers/linux-headers.hash b/board/radxa/rock4se/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/radxa/rock4se/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
new file mode 100644
index 0000000000..9108b3e01a
--- /dev/null
+++ b/board/radxa/rock4se/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4a516e5ed748537a73cb42ec47fbbeb6df8b1298e8892c29c0e91de79095b297  linux-6.12.10.tar.xz
diff --git a/board/radxa/rock4se/patches/uboot/uboot.hash b/board/radxa/rock4se/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/radxa/rock4se/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/board/radxa/rock4se/post-build.sh b/board/radxa/rock4se/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/radxa/rock4se/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/radxa/rock4se/readme.txt b/board/radxa/rock4se/readme.txt
new file mode 100644
index 0000000000..30cf621746
--- /dev/null
+++ b/board/radxa/rock4se/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Radxa ROCK 4SE. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Radxa ROCK 4SE link:
+https://radxa.com/products/rock4/4se/
+
+Wiki link:
+https://forum.radxa.com/c/rockpi4
+
+GPIO connector pinout link:
+https://wiki.radxa.com/Rockpi4/hardware/gpio
+
+This configuration uses mainline ATF, U-Boot and kernel.
+
+How to build
+============
+
+    $ make rock4se_defconfig
+    $ make
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
+Insert the micro SDcard in your Radxa ROCK 4SE and power it up. The console
+is available on UART2 on the GPIO connector, 1500000bps 8N1.
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
new file mode 100644
index 0000000000..31fc2c6ecb
--- /dev/null
+++ b/configs/rock4se_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/radxa/rock4se/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="rock-4se"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Radxa ROCK 4SE"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock4se/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-4se-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
