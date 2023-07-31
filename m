Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B83C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0E7610A9;
	Mon, 31 Jul 2023 14:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0E7610A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbYpGPzq9tyb; Mon, 31 Jul 2023 14:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4A56106F;
	Mon, 31 Jul 2023 14:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4A56106F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37D341BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F49740B3B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F49740B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f289Qbs8hdTP for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:48:03 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 14:48:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3252C40B55
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3252C40B55
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:48:02 +0000 (UTC)
Received: from localhost.localdomain ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id QU4tqlTMLaJ4NQU4tqHNsf; Mon, 31 Jul 2023 16:40:55 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 16:40:54 +0200
Message-Id: <20230731144054.68670-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP2SFrN9PnWKxwO1WgrR+qiR7sYXucmEFgKb3IRv953E+qzkUJ1WFD0aYXPjhmQqftRy5F5bdAbzTQRJ1eskg8sEiz1trguxCcrBhuJOLU1kocpYnNdw
 BiiGv+opjyHeNdjUvrz5/XFmX4+801sFxEKsoBR1c4uN4RqAAu2dYXAWjE4lC7JmAIi7/48m1RJ89cWglTpzQiNpkdoK9TmPW5EzwGBxSODmYPrRgB41FHbj
 eQBpd/yXmzeW+Jgkc1MwGkC6VexRcKsagcJi/lThx7IVswidpbKSuilQIJbRRUPAcBHIcjxkalFu5TZkyv1lNg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690814455; bh=WNhzqkCgA9J9bT2HDxp3Np1k+CADswY1/g0T67q9OBE=;
 h=From:To:Subject:Date:MIME-Version;
 b=gGWr5VM1fQ85mbO0KE1LMISTjQuKoLDJHcaH2O7SiuUhtRtU+DjF883t066ygZfv5
 ZX0DpOOZkJzT4MMLZ8rHG/xHrBOG3i4o3ZAjJIIDNazDZzfwxnwsYLkNClA1HCrjTJ
 OrSbwG/mttu9Xrcq+wYo9U9soIzDoF5PBAT56/VB1ljVvvOFghPgLDbgAubb0HrOUx
 oNaLusxtpywxCPLDzIumC3/8mNjapvJkdSch60Wq9fcdZvoG+BDuvKVqd6mpkSmrKj
 8J2eccMokmg/lakBRw0qynhL/zE72dm6wOom3qr4HJ/dNaIPrbNTwGpYWAvdRWHpYL
 cu/3fVR4k8byg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gGWr5VM1
Subject: [Buildroot] [PATCH] configs/bananapi_m2_ultra: new defconfig
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for Bananapi M2 Ultra board based on the Allwinner V40/A40i
SoC.

- U-Boot 2023.07
- Linux 6.1.38

Board specifications: https://wiki.banana-pi.org/Banana_Pi_BPI-M2_Berry

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                    |  1 +
 board/bananapi/bananapi-m2-berry/boot.cmd     |  7 ++++
 board/bananapi/bananapi-m2-berry/genimage.cfg | 34 +++++++++++++++++
 board/bananapi/bananapi-m2-berry/readme.txt   | 35 ++++++++++++++++++
 configs/bananapi_m2_berry_defconfig           | 37 +++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 board/bananapi/bananapi-m2-berry/boot.cmd
 create mode 100644 board/bananapi/bananapi-m2-berry/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m2-berry/readme.txt
 create mode 100644 configs/bananapi_m2_berry_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 29963278cb..d106fe953c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1166,6 +1166,7 @@ F:	board/freescale/imx6ullevk/
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/bananapi_m2_berry_defconfig
 F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
diff --git a/board/bananapi/bananapi-m2-berry/boot.cmd b/board/bananapi/bananapi-m2-berry/boot.cmd
new file mode 100644
index 0000000000..a808fa0407
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait drm.debug=0xff
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-v40-bananapi-m2-berry.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m2-berry/genimage.cfg b/board/bananapi/bananapi-m2-berry/genimage.cfg
new file mode 100644
index 0000000000..535f3dffee
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/genimage.cfg
@@ -0,0 +1,34 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-v40-bananapi-m2-berry.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 64M
+}
+
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
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/bananapi/bananapi-m2-berry/readme.txt b/board/bananapi/bananapi-m2-berry/readme.txt
new file mode 100644
index 0000000000..838675ed94
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Bananapi M2 Berry. With the current
+configuration it will bring-up the board, and allow access through the
+serial console.
+
+Bananapi M2 Berry link:
+https://wiki.banana-pi.org/Banana_Pi_BPI-M2_Berry
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make bananapi_m2_berry_defconfig
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
+Insert the micro SDcard in your Bananapi M2 Berry and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
new file mode 100644
index 0000000000..95652e7939
--- /dev/null
+++ b/configs/bananapi_m2_berry_defconfig
@@ -0,0 +1,37 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
+BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA=y
+BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_HTOP=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-berry/boot.cmd"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
