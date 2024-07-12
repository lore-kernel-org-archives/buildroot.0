Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E443C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC074818CA;
	Fri, 12 Jul 2024 22:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxO5NcSvVmA6; Fri, 12 Jul 2024 22:05:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3DBA844F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DBA844F3;
	Fri, 12 Jul 2024 22:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF1D1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1911041A36
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibG68Sd_gdzc for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 122BA41811
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 122BA41811
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:05:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F12A486272; Fri, 12 Jul 2024 22:05:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:04:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c54134bf6914593caaa9ed4aa11cbe3a17c59eca
X-Git-Newrev: 6df6286b78eeb97b7bd399b6f75c829262fbdbe4
X-Patchwork-Hint: ignore
Message-Id: <20240712220515.F12A486272@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/uevm5432_defconfig: bump Linux and
 U-Boot
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
Content-Type: multipart/mixed; boundary="===============2219069301198616465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2219069301198616465==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6df6286b78eeb97b7bd399b6f75c829262fbdbe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux kernel to v6.8.10.
  The Devicetree has moved; update our config accordingly.

- Bump U-Boot to 2023.04.
  This is the most recent version we can use as U-Boot 2023.07 dropped
  support for the uevm.
  OpenSSL is now required for the build.
  The default boot method has changed; switch to booting with an extlinux
  configuration to overcome this.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/uevm5432/extlinux.conf |  4 ++++
 board/uevm5432/genimage.cfg  |  6 ++++--
 board/uevm5432/post-build.sh |  6 ++++++
 configs/uevm5432_defconfig   | 13 +++++++------
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/board/uevm5432/extlinux.conf b/board/uevm5432/extlinux.conf
new file mode 100644
index 0000000000..50f3cd30fb
--- /dev/null
+++ b/board/uevm5432/extlinux.conf
@@ -0,0 +1,4 @@
+label uevm5432-buildroot
+  kernel /zImage
+  fdt /omap5-uevm.dtb
+  append root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait console=ttyO2,115200
diff --git a/board/uevm5432/genimage.cfg b/board/uevm5432/genimage.cfg
index dfe388227e..7bb90e198b 100644
--- a/board/uevm5432/genimage.cfg
+++ b/board/uevm5432/genimage.cfg
@@ -2,7 +2,10 @@ image boot.vfat {
 	vfat {
 		files = {
 			"MLO",
-			"u-boot.img"
+			"u-boot.img",
+			"zImage",
+			"omap5-uevm.dtb",
+			"extlinux"
 		}
 	}
 
@@ -22,6 +25,5 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 512M
 	}
 }
diff --git a/board/uevm5432/post-build.sh b/board/uevm5432/post-build.sh
new file mode 100755
index 0000000000..f90f76d8b5
--- /dev/null
+++ b/board/uevm5432/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/configs/uevm5432_defconfig b/configs/uevm5432_defconfig
index 7b9a4309c6..03dc789fa8 100644
--- a/configs/uevm5432_defconfig
+++ b/configs/uevm5432_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a15=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+# Linux headers same as kernel, a 6.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 
 # System
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -12,17 +12,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
 BR2_SYSTEM_DHCP="eth0"
 
 # Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/uevm5432/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/uevm5432/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.10"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap5-uevm"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/omap5-uevm"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
@@ -34,8 +34,9 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap5_uevm"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"

--===============2219069301198616465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2219069301198616465==--
