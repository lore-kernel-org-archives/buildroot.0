Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61763C433FE
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 17:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45734189D;
	Fri,  8 Apr 2022 17:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbWcqsM6qWU4; Fri,  8 Apr 2022 17:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8580340A03;
	Fri,  8 Apr 2022 17:39:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32F211BF2B3
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20D6160AA7
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 17:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=email.cz
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeTsdiJQxzV3 for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 17:39:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56E7C60A92
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 17:39:23 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc21b.ng.seznam.cz (email-smtpc21b.ng.seznam.cz [10.23.18.27])
 id 26c785efa620ef7224b3bb81; Fri, 08 Apr 2022 19:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1649439561; bh=gkF+H6eaSZnO6SOioWkvTLF7Wmu+e726t5q40fD6LJo=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:X-szn-frgn:X-szn-frgc;
 b=iwcs580vcY2qRHEcxJEwy6jChrhkvNMVU1UOgCDHJ13ZGV+Tf7yz6digRgupz0sSt
 YDuYGxzSJ+8hww0Wahshjw//+4hWoHS5Uolb9QFT63ObVsXrG/qSE6GtoXMyJp5jlm
 fnAmNizDuCOLs1LGR0Hu3EI0QbsN6xs6/hrXDHnQ=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay10.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
 Fri, 08 Apr 2022 19:39:15 +0200 (CEST)  
Date: Fri, 8 Apr 2022 19:39:11 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <YlBzP4J4FGA4Z7nL@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-szn-frgn: <dccb973e-d83b-4385-a3d8-82440adf94f3>
X-szn-frgc: <0>
Subject: [Buildroot] [PATCH 1/1] board/pine64/pinecube: new board
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
Cc: Jan Havran <havran.jan@email.cz>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for PineCube with:
- U-Boot 2022.01
- Linux 5.15

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 DEVELOPERS                         |  4 +++
 board/pine64/pinecube/boot.cmd     |  6 ++++
 board/pine64/pinecube/genimage.cfg | 34 +++++++++++++++++++++
 board/pine64/pinecube/readme.txt   | 31 ++++++++++++++++++++
 configs/pinecube_defconfig         | 47 ++++++++++++++++++++++++++++++
 5 files changed, 122 insertions(+)
 create mode 100644 board/pine64/pinecube/boot.cmd
 create mode 100644 board/pine64/pinecube/genimage.cfg
 create mode 100644 board/pine64/pinecube/readme.txt
 create mode 100644 configs/pinecube_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index a66b9d7eee..d418a1af99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1356,6 +1356,10 @@ F:	package/pangomm/
 F:	package/rpm/
 F:	package/yad/
 
+N:	Jan Havran <havran.jan@email.cz>
+F:	board/pine64/pinecube/
+F:	configs/pinecube_defconfig
+
 N:	Jan Heylen <jan.heylen@nokia.com>
 F:	package/opentracing-cpp/
 
diff --git a/board/pine64/pinecube/boot.cmd b/board/pine64/pinecube/boot.cmd
new file mode 100644
index 0000000000..d8b62e0b4a
--- /dev/null
+++ b/board/pine64/pinecube/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait rw
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-s3-pinecube.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/pine64/pinecube/genimage.cfg b/board/pine64/pinecube/genimage.cfg
new file mode 100644
index 0000000000..af175811ad
--- /dev/null
+++ b/board/pine64/pinecube/genimage.cfg
@@ -0,0 +1,34 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-s3-pinecube.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 8M
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
+		size = 504K # 512KB - 8KB
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
diff --git a/board/pine64/pinecube/readme.txt b/board/pine64/pinecube/readme.txt
new file mode 100644
index 0000000000..7770bbfe42
--- /dev/null
+++ b/board/pine64/pinecube/readme.txt
@@ -0,0 +1,31 @@
+Intro
+=====
+
+This directory contains a Buildroot configuration for building a
+Pine64 PineCube.
+
+Board homepage: https://www.pine64.org/cube/
+Board wiki:     https://wiki.pine64.org/wiki/PineCube
+
+How to build it
+===============
+
+  $ make pinecube_defconfig
+  $ make
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
+Insert the micro SDcard in your PineCube and power it up. The console
+is on the serial port 2, 115200 8N1 (check Wiki for board pinout).
diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
new file mode 100644
index 0000000000..1064167d8e
--- /dev/null
+++ b/configs/pinecube_defconfig
@@ -0,0 +1,47 @@
+# Target options
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Toolchain options
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="pinecube"
+BR2_TARGET_GENERIC_ISSUE="Welcome to PINECUBE"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-s3-pinecube"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pinecube"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pinecube/boot.cmd"
+
+# Required host utilities for building an SDCard image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
