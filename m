Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547BEC8736
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E1D2830DE;
	Thu,  7 Sep 2023 15:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E1D2830DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOf3B7Ir_KoX; Thu,  7 Sep 2023 15:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA7282F6C;
	Thu,  7 Sep 2023 15:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA7282F6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C27DC1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4431061263
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4431061263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLgEGtrLaDPt for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52E1861257
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E1861257
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41E7086A25; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 23:12:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9488ec2b58d94b1bd4954dc5348626e94b3e79ac
X-Git-Newrev: c46ba34cde7035a038a919d8a902f14071c2d1cf
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.41E7086A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/asus_tinker-s_rk3288: new defconfig
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
Content-Type: multipart/mixed; boundary="===============8673806721684138554=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8673806721684138554==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c46ba34cde7035a038a919d8a902f14071c2d1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit duplicates the asus_tinker_rk3288_defconfig changing:

  - BR2_LINUX_KERNEL_INTREE_DTS_NAME to rk3288-tinker-s
  - BR2_TARGET_UBOOT_BOARD_DEFCONFIG to tinker-s-rk3288
  - extlinux.conf devicetree to /boot/rk3288-tinker-s.dtb
  - root device format to <major>:<minor> in order to prevent the kernel to mount rootfs
    from the wrong device
  - Add Flávio Tapajós for configs/asus_tinker-s_rk3288_defconfig and for
    configs/asus_tinker-s_rk3288_defconfig and for board/asus/tinker-s

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  4 +++
 board/asus/tinker-s/extlinux.conf      |  4 +++
 board/asus/tinker-s/post-build.sh      |  9 +++++++
 board/asus/tinker-s/readme.txt         | 43 +++++++++++++++++++++++++++++++
 configs/asus_tinker-s_rk3288_defconfig | 46 ++++++++++++++++++++++++++++++++++
 5 files changed, 106 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 478e32b08f..1357f150ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1036,6 +1036,10 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
+N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
+F:	configs/asus_tinker-s_rk3288_defconfig
+F:	board/asus/tinker-s/
+
 N:	Florian Fainelli <f.fainelli@gmail.com>
 F:	package/cpulimit/
 
diff --git a/board/asus/tinker-s/extlinux.conf b/board/asus/tinker-s/extlinux.conf
new file mode 100644
index 0000000000..5a2d05b811
--- /dev/null
+++ b/board/asus/tinker-s/extlinux.conf
@@ -0,0 +1,4 @@
+label Tinker linux
+  kernel /boot/uImage
+  devicetree /boot/rk3288-tinker-s.dtb
+  append console=ttyS2,115200n8 root=179:1 rootwait
diff --git a/board/asus/tinker-s/post-build.sh b/board/asus/tinker-s/post-build.sh
new file mode 100755
index 0000000000..ffbbcdeb58
--- /dev/null
+++ b/board/asus/tinker-s/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
+cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl-dtb.bin > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/asus/tinker-s/readme.txt b/board/asus/tinker-s/readme.txt
new file mode 100644
index 0000000000..3dffa12b45
--- /dev/null
+++ b/board/asus/tinker-s/readme.txt
@@ -0,0 +1,43 @@
+Tinker S RK3288
+=============
+
+Tinker Board is a Single Board Computer (SBC) in an ultra-small form
+factor that offers class-leading performance while leveraging outstanding
+mechanical compatibility. The "S" variant of the Tinker Board has eMMC
+
+Tinker link:
+https://www.asus.com/br/motherboards-components/single-board-computer/all-series/tinker-board-s/
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Tinker+RK3288
+
+How to build it
+===============
+
+  $ make asus_tinker-s_rk3288_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Prepare your SDCard
+===================
+
+Buildroot generates a ready-to-use SD card image that you can flash directly to
+the card. The image will be in output/images/sdcard.img.
+You can write this image directly to an SD card device (i.e. /dev/xxx):
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/xxx
+  $ sudo sync
+
+Finally, you can insert the SD card to the Tinker RK3288 board and boot it.
+
+NOTE:
+USB power supply requires more than the standard 500mA USB current, so
+this board must be supplied from a capable port or from an external
+AC/DC adapter. Otherwise it will hang forever while loading the kernel
+image.
diff --git a/configs/asus_tinker-s_rk3288_defconfig b/configs/asus_tinker-s_rk3288_defconfig
new file mode 100644
index 0000000000..96fc79ee85
--- /dev/null
+++ b/configs/asus_tinker-s_rk3288_defconfig
@@ -0,0 +1,46 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a17=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-s-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker-s"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="tinker-rk3288-s"
+BR2_TARGET_GENERIC_ISSUE="Welcome to TINKER S RK3288!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker-s/post-build.sh"

--===============8673806721684138554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8673806721684138554==--
