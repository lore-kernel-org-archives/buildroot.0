Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907B2C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9454981E41;
	Sat, 13 Jul 2024 20:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XO9AIemIfoIy; Sat, 13 Jul 2024 20:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 033FD812C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033FD812C5;
	Sat, 13 Jul 2024 20:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD361BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9648B812C5
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rAZn1_6NOQh for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F00B81257
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F00B81257
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:45:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46FE286664; Sat, 13 Jul 2024 20:45:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:44:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23c21c6f2942e8038133d20d33f6388ef8a06c18
X-Git-Newrev: d90980129f5773e1cff33f66f999209b68a0831a
X-Patchwork-Hint: ignore
Message-Id: <20240713204515.46FE286664@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/cubieboard1: new defconfig
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
Content-Type: multipart/mixed; boundary="===============7464368611844074513=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7464368611844074513==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d90980129f5773e1cff33f66f999209b68a0831a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new defconfig for Cubieboard1 made by Cubietech. It is
based on the Allwinner A10 SoC. See:
http://www.cubietech.com/product-detail/cubieboard1.

The defconfig uses upstream U-Boot and Linux.

Signed-off-by: Gero Schwäricke <gero.schwaericke@posteo.de>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 +++
 board/cubietech/cubieboard1/genimage.cfg           | 16 +++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../cubietech/cubieboard1/patches/linux/linux.hash |  2 ++
 .../cubietech/cubieboard1/patches/uboot/uboot.hash |  2 ++
 board/cubietech/cubieboard1/readme.txt             | 32 +++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  5 +++
 configs/cubieboard1_defconfig                      | 42 ++++++++++++++++++++++
 8 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 152789cd5d..9474d03520 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1210,6 +1210,10 @@ F:	package/flannel/
 N:	Geoffrey Ragot <geoffreyragot@gmail.com>
 F:	package/python-pyyaml/
 
+N:	Gero Schwaericke <gero.schwaericke@posteo.de>
+F:	board/cubietech/cubieboard1/
+F:	configs/cubieboard1_defconfig
+
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	board/friendlyarm/nanopi-r2s/
diff --git a/board/cubietech/cubieboard1/genimage.cfg b/board/cubietech/cubieboard1/genimage.cfg
new file mode 100644
index 0000000000..92c8677545
--- /dev/null
+++ b/board/cubietech/cubieboard1/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/cubietech/cubieboard1/patches/linux-headers/linux-headers.hash b/board/cubietech/cubieboard1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/cubietech/cubieboard1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
new file mode 100644
index 0000000000..5e9df51ecd
--- /dev/null
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/cubietech/cubieboard1/readme.txt b/board/cubietech/cubieboard1/readme.txt
new file mode 100644
index 0000000000..d5033f473f
--- /dev/null
+++ b/board/cubietech/cubieboard1/readme.txt
@@ -0,0 +1,32 @@
+Cubietech Cubieboard1
+=====================
+
+Cubieboard1 is the first generation Cubieboard from Cubietech.
+
+Cubietech:
+http://www.cubietech.com/product-detail/cubieboard1
+
+Linux Sunxi Wiki:
+https://linux-sunxi.org/Cubietech_Cubieboard
+
+Building
+--------
+
+Configure and build with
+
+  make cubieboard1_defconfig
+  make
+
+Flashing
+--------
+
+Flash the sdcard image onto a micro sdcard with
+
+  dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+
+Running
+-------
+
+Connect a 3V3 serial interface to the serial header on the top side of the board
+(between the USB jacks and the A10 chip). Then provide power to the board. The
+interface uses 115200 baud.
diff --git a/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..2fde683f38
--- /dev/null
+++ b/board/cubietech/cubieboard1/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,5 @@
+DEFAULT linux
+LABEL linux
+  KERNEL /boot/zImage
+  DEVICETREE /boot/sun4i-a10-cubieboard.dtb
+  APPEND console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p1 rootwait
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
new file mode 100644
index 0000000000..d51f2ab746
--- /dev/null
+++ b/configs/cubieboard1_defconfig
@@ -0,0 +1,42 @@
+# Target
+BR2_arm=y
+BR2_cortex_a8=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+
+# Build options
+BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# System configuration
+BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.12"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem images
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Host utilities
+BR2_PACKAGE_HOST_GENIMAGE=y

--===============7464368611844074513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7464368611844074513==--
