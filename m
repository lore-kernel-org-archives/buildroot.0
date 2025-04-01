Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84427C36014
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 06:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E8941271;
	Wed,  2 Apr 2025 06:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGegQapY7KZh; Wed,  2 Apr 2025 06:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4AC4130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4AC4130B;
	Wed,  2 Apr 2025 06:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AAE611F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5144881145
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4oY0-i6k_m1 for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 06:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D7A38002A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D7A38002A
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:45:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1344183A5F; Wed,  2 Apr 2025 06:45:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 1 Apr 2025 23:34:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cab9ee22476373d45e0505dc21cafdd3c821212
X-Git-Newrev: 6e6bd098c31cf981c1498f105cf35405e1518c4c
X-Patchwork-Hint: ignore
Message-Id: <20250402064501.1344183A5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/engicam_px30_core_defconfig: new
 defconfig
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
Content-Type: multipart/mixed; boundary="===============6006923753434570562=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6006923753434570562==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6e6bd098c31cf981c1498f105cf35405e1518c4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for Engicam PX30 SOM board
with below features:
- U-Boot 2024.01
- Linux 6.12.19
- Default packages from buildroot

px30 ctouch2 with 10 inches display

https://www.engicam.com/vis-prod/C-Touch-2-0-Carrier-Board/

Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
[Julien:
 - fix linux-6.12.19 hash
 - add missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  4 ++
 board/engicam/px30core/extlinux.conf               |  4 ++
 board/engicam/px30core/genimage.cfg                | 22 ++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/engicam/px30core/patches/linux/linux.hash    |  2 +
 board/engicam/px30core/patches/uboot/uboot.hash    |  2 +
 board/engicam/px30core/post-build.sh               |  5 ++
 board/engicam/px30core/readme.txt                  | 60 ++++++++++++++++++++++
 configs/engicam_px30_core_defconfig                | 45 ++++++++++++++++
 9 files changed, 145 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e4b8085ca6..a26a4cbe68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2384,6 +2384,10 @@ F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 
+N:	Meena Murthy <meena.murthy@amarulasolutions.com>
+F:	board/engicam/px30core/
+F:	configs/engicam_px30_core_defconfig
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/board/engicam/px30core/extlinux.conf b/board/engicam/px30core/extlinux.conf
new file mode 100644
index 0000000000..6d5a845cb0
--- /dev/null
+++ b/board/engicam/px30core/extlinux.conf
@@ -0,0 +1,4 @@
+label Engicam-EDIMM linux
+  kernel /boot/Image
+  devicetree /boot/px30-engicam-px30-core-ctouch2-of10.dtb
+  append earlycon=uart8250,mmio32,0xff160000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/engicam/px30core/genimage.cfg b/board/engicam/px30core/genimage.cfg
new file mode 100644
index 0000000000..966c869273
--- /dev/null
+++ b/board/engicam/px30core/genimage.cfg
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
diff --git a/board/engicam/px30core/patches/linux-headers/linux-headers.hash b/board/engicam/px30core/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/engicam/px30core/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/engicam/px30core/patches/linux/linux.hash b/board/engicam/px30core/patches/linux/linux.hash
new file mode 100644
index 0000000000..2fb158b70c
--- /dev/null
+++ b/board/engicam/px30core/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
diff --git a/board/engicam/px30core/patches/uboot/uboot.hash b/board/engicam/px30core/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..bc999536af
--- /dev/null
+++ b/board/engicam/px30core/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/engicam/px30core/post-build.sh b/board/engicam/px30core/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/engicam/px30core/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/engicam/px30core/readme.txt b/board/engicam/px30core/readme.txt
new file mode 100644
index 0000000000..0693792d56
--- /dev/null
+++ b/board/engicam/px30core/readme.txt
@@ -0,0 +1,60 @@
+ENGICAM PX30-EDIMM2.2 carrier board
+===================================
+
+Build:
+
+  $ make engicam_px30_core_defconfig
+  $ make
+
+Files created in output directory
+---------------------------------
+
+output/images
+
+├── bl31.elf
+├── idbloader.img
+├── Image
+├── px30-engicam-px30-core-ctouch2-of10.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── u-boot.bin
+└── u-boot.itb
+
+How to connect the board and get started:
+-----------------------------------------
+Ensure that the power supply is stable and provides enough current to handle
+the board's needs, especially when peripherals are connected.
+
+Insert micro SD card on the board micro SD slot J17
+
+Creating bootable SD card:
+--------------------------
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+/dev/sdX is the path in host via which SD card is detected
+Where X is your SD card device
+
+Connect UART port on the board J26
+
+Serial console
+--------------
+Launch minicom at host with 1152008N1
+
+Power on the kit using J4
+
+Refer link on checking board booting
+
+Program eMMC
+------------
+Connect USB otg cable A-type to host pc, Micro USB end to board.
+
+Close Jumper JM5.
+
+Boot the Kit with SD boot.
+
+Program eMMC in U-Boot. (Refer link for the steps)
+
+Wiki link:
+https://wiki.amarulasolutions.com/bsp/rockchip/px30/engicam-px30-edimm2.2.html
diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
new file mode 100644
index 0000000000..feaa8b3302
--- /dev/null
+++ b/configs/engicam_px30_core_defconfig
@@ -0,0 +1,45 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_GLOBAL_PATCH_DIR="board/engicam/px30core/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/engicam/px30core/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/engicam/px30core/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/px30-engicam-px30-core-ctouch2-of10"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="150M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.12.1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="px30"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="px30-core-ctouch2-of10-px30"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============6006923753434570562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6006923753434570562==--
