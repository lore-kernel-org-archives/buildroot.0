Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4464C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F32E60F61;
	Sat, 12 Feb 2022 13:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSgnpxPXqIMV; Sat, 12 Feb 2022 13:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7033E60746;
	Sat, 12 Feb 2022 13:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 554121BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A45DB80C93
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQWNM_aUDz5i for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C398680C35
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C7FE982210; Sat, 12 Feb 2022 13:06:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 13:56:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebde11d29f5ceb7f7398d24cbf71909c1e08a073
X-Git-Newrev: 9c78c8c0d7120b6de7103879961c778d32c57d52
X-Patchwork-Hint: ignore
Message-Id: <20220212130602.C7FE982210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/friendlyarm_nanopi_r2s: new
 defconfig
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5158012334989178012=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5158012334989178012==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9c78c8c0d7120b6de7103879961c778d32c57d52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NanoPi R2S is a FriendlyElec mini-router based on:

- Rockchip RK3328 SoC
- 1GB (or 2GB) DDR4 RAM
- Gigabit Ethernet (WAN)
- Gigabit Ethernet (USB3) (LAN)
- USB 2.0 Host Port
- MicroSD slot
- Reset button
- WAN - LAN - SYS LED

https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=282

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Arnout:
 - explicitly set BR2_cortex_a53=y;
 - remove unused mtools and dosfstools;
 - add BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y;
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                 |  2 ++
 board/friendlyarm/nanopi-r2s/extlinux.conf |  4 +++
 board/friendlyarm/nanopi-r2s/genimage.cfg  | 22 ++++++++++++
 board/friendlyarm/nanopi-r2s/post-build.sh |  5 +++
 board/friendlyarm/nanopi-r2s/readme.txt    | 57 ++++++++++++++++++++++++++++++
 configs/friendlyarm_nanopi_r2s_defconfig   | 40 +++++++++++++++++++++
 6 files changed, 130 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e89149cea0..55fd9344ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1068,7 +1068,9 @@ F:	configs/qemu_*
 
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
+F:	board/friendlyarm/nanopi-r2s/
 F:	configs/freescale_imx8mmevk_defconfig
+F:	configs/friendlyarm_nanopi_r2s_defconfig
 F:	package/cctz/
 F:	package/faad2/
 F:	package/fdk-aac/
diff --git a/board/friendlyarm/nanopi-r2s/extlinux.conf b/board/friendlyarm/nanopi-r2s/extlinux.conf
new file mode 100644
index 0000000000..1ea0cdd8a5
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi R2S linux
+  kernel /boot/Image
+  devicetree /boot/rk3328-nanopi-r2s.dtb
+  append root=/dev/mmcblk0p1 rw rootwait
diff --git a/board/friendlyarm/nanopi-r2s/genimage.cfg b/board/friendlyarm/nanopi-r2s/genimage.cfg
new file mode 100644
index 0000000000..a686b4f14e
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/genimage.cfg
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
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		offset = 16M
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/friendlyarm/nanopi-r2s/post-build.sh b/board/friendlyarm/nanopi-r2s/post-build.sh
new file mode 100755
index 0000000000..1f5ff6a611
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-r2s/readme.txt b/board/friendlyarm/nanopi-r2s/readme.txt
new file mode 100644
index 0000000000..6d291cdd60
--- /dev/null
+++ b/board/friendlyarm/nanopi-r2s/readme.txt
@@ -0,0 +1,57 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Nanopi R2S. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Nanopi R2S link:
+https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=282
+
+This configuration uses ATF, U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_r2s_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+Files created in output directory
+=================================
+
+output/images
+
+├── bl31.elf
+├── boot.vfat
+├── extlinux
+├── idbloader.img
+├── Image
+├── rk3328-nanopi-r2s.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── u-boot.bin
+└── u-boot.itb
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
+Insert the micro SDcard in your Nanopi R2S and power it up. The console
+is on the serial line, 1500000 8N1.
+
+Notes
+=====
+
+This configuration can also be used to drive the Friendlyarm Nanopi Neo3 board.
diff --git a/configs/friendlyarm_nanopi_r2s_defconfig b/configs/friendlyarm_nanopi_r2s_defconfig
new file mode 100644
index 0000000000..818c847f4b
--- /dev/null
+++ b/configs/friendlyarm_nanopi_r2s_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TARGET_GENERIC_HOSTNAME="rk3328-nanopi-r2s"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Nanopi R2S RK3328"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-r2s/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r2s/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-nanopi-r2s"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r2s-rk3328"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============5158012334989178012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5158012334989178012==--
