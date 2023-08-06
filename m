Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE09C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 22:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EA160F9E;
	Sun,  6 Aug 2023 22:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45EA160F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ev_Jf6nOfxKF; Sun,  6 Aug 2023 22:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E12060AA7;
	Sun,  6 Aug 2023 22:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E12060AA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 202821BF951
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA1660596
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA1660596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5u51w0XGMrmM for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 22:18:29 +0000 (UTC)
Received: from smtpcmd15188.aruba.it (smtpcmd15188.aruba.it [62.149.156.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C21960017
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 22:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C21960017
Received: from localhost.localdomain ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Sm4tqj45gQDLBSm4vqQen1; Mon, 07 Aug 2023 00:18:25 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 00:18:21 +0200
Message-Id: <20230806221821.284678-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCATAAZvCnbQP6mYEJylX6icbbyjDZxm/fhehwyNe23BxRHK7Mzlpb+mUhsarR6blpNuq93j+/JKSlE3ZNvnRILA99dmDaFRZ7G9yGi+vGVVhTfjxG4F
 cRbqv1CrziNIiU/F52a0u8H+fwZliaoG0aVNrS65Kw966JpZR3RWsiHo4p2fSyeayBF2+vOFDZTVfE/lkeHxE8p1iH95/iIsFQXuBdQiLDyplK7FKXGPD1pS
 LkQUlFsx1d1gmAOhlY5rU2JqakUay2yIVePzMPoyfn9Ws7OhnzvhxuxrQ6lhBPAvTlj9oCLkDWMDMzOzvOzlT8NqPmW6pr5r5T+ijkpxGDo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691360305; bh=/QoAKkPs6r14rf5jC/dHJ0hh1wJvTmpknMToZ/LrCRg=;
 h=From:To:Subject:Date:MIME-Version;
 b=g0BF4wj+IQrrZD6/VF1Ylu4cIhi4PHqGysCBYnosbvwC3ISHWUSDwTa7/EO/uIjMQ
 yWJqoPCsQbMnjewTGlGO3BCelmzJjgI22eDesRRjICBmlFXPHYP1c7mXzGD02i+/Tr
 ypLbF6wFTew++wdKUjjwefLRceIbb3l1tMDSAcDcbvjh6WomLbWFYoO7hlkZLZiBhN
 V7dUWL5fjyzDqtGDEA0XO+NE8/1x2fubAGrL+dhixtegf5GFPEVtv1OdiDBzgBatgS
 s+0Bp1g3kMvUvXw+YSsnYURhWdDAZC2YFvCg4zNrWKpTkokTdhf76V4qP0RA7ScLff
 vpEWfxnOlVdWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=g0BF4wj+
Subject: [Buildroot] [PATCH] configs/bananapi_m2_berry: new defconfig
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

Add support for Bananapi M2 Berry board based on the Allwinner V40/A40i
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
index 0f6cb75e0e..a24ceeb742 100644
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
