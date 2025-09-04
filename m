Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD8ECA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E1B8087C;
	Thu,  4 Sep 2025 16:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTr1zAwVTig7; Thu,  4 Sep 2025 16:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08F1E80874
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F1E80874;
	Thu,  4 Sep 2025 16:14:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11330106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B48B28075B
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWxm22rop5PP for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1018078E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE1018078E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC5EE8617D; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c2362007679c953e24eb6fa74e7923dfd6222f5
X-Git-Newrev: 13eb6c293ec5f2068f0dde9f615cee4042ed3905
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.DC5EE8617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/engicam_imx6*:
 remove defconfigs, broken
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=13eb6c293ec5f2068f0dde9f615cee4042ed3905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Remove numerous Engicam i.MX6 defconfigs as they don't build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273148
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273147
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273145
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273144
  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273136

All of them are using outdated Linux kernel versions, not even LTS,
which fail to build with modern toolchains.

Unless fixes are provided, these defconfigs will be dropped.

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 61d361c3c59514669a0cc47ac402fbe2dc15c5e7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |  5 --
 DEVELOPERS                                         |  5 --
 board/engicam/geam6ul/genimage.cfg                 | 39 ---------
 board/engicam/geam6ul/readme.txt                   | 66 ---------------
 board/engicam/icorem6/genimage.cfg                 | 42 ----------
 board/engicam/icorem6/linux_qt5.fragment           |  4 -
 board/engicam/icorem6/readme.txt                   | 93 ----------------------
 .../rootfs_overlay/root/imx6qdl-icore-ofcap10.json | 11 ---
 .../rootfs_overlay/root/imx6qdl-icore-ofcap12.json | 11 ---
 .../icorem6/rootfs_overlay/root/imx6qdl-icore.json | 11 ---
 board/engicam/icorem6_rqs/genimage.cfg             | 40 ----------
 board/engicam/icorem6_rqs/readme.txt               | 69 ----------------
 board/engicam/isiot/genimage.cfg                   | 39 ---------
 board/engicam/isiot/readme.txt                     | 66 ---------------
 configs/engicam_imx6qdl_icore_defconfig            | 33 --------
 configs/engicam_imx6qdl_icore_qt5_defconfig        | 60 --------------
 configs/engicam_imx6qdl_icore_rqs_defconfig        | 33 --------
 configs/engicam_imx6ul_geam_defconfig              | 33 --------
 configs/engicam_imx6ul_isiot_defconfig             | 33 --------
 19 files changed, 693 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 34f4ee5d3b..ebf6fb44d0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -115,11 +115,6 @@ configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
 configs/ci20_defconfig lib_defconfig.ForceCheckHash
-configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash
-configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
-configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
-configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
-configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 1179ba0b90..5e9db46334 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1471,11 +1471,6 @@ F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
-F:	configs/engicam_imx6qdl_icore_defconfig
-F:	configs/engicam_imx6qdl_icore_qt5_defconfig
-F:	configs/engicam_imx6qdl_icore_rqs_defconfig
-F:	configs/engicam_imx6ul_geam_defconfig
-F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
diff --git a/board/engicam/geam6ul/genimage.cfg b/board/engicam/geam6ul/genimage.cfg
deleted file mode 100644
index 3d290b2ea6..0000000000
--- a/board/engicam/geam6ul/genimage.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"uImage",
-			"imx6ul-geam-kit.dtb"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition SPL {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot-dtb.img"
-		offset = 69K
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-		offset = 8M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-	}
-}
diff --git a/board/engicam/geam6ul/readme.txt b/board/engicam/geam6ul/readme.txt
deleted file mode 100644
index ace993a661..0000000000
--- a/board/engicam/geam6ul/readme.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-********************************************
-Buildroot for Engicam GEAM6UL SOM platforms:
-********************************************
-
-This file documents the Buildroot support for all Engicam GEAM6UL
-SOM platform boards.
-
-GEAM6UL SOM Starter kits:
-https://www.engicam.com/vis-prod/101115
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-Build
-=====
-
-First, configure Buildroot for the Engicam GEAM6UL SOM:
-
-- for GEAM6UL SOM:
-
-  make engicam_imx6ul_geam_defconfig
-
-Build all components:
-
-  make
-
-You will find the following files in output/images/:
-  - imx6ul-geam-kit.dtb
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - SPL
-  - u-boot-dtb.img
-  - uImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-  sync
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-For details about the medium image layout, see the definition in
-board/engicam/geam6ul/genimage.cfg
-
-Boot the GEAM6UL boards with SD boot:
-====================================
-
-To boot your newly created system:
-- insert the SD card in the SD slot of the board;
-- connect 3-wire RS232 serial port J28 on board, and connect with other
-  serial end or USB cable(if serial-to-usb converter used) using
-  a terminal emulator at 115200 bps, 8n1;
-- close JM3 for sd boot.
-- power on the board.
-
-Enjoy!
diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/genimage.cfg
deleted file mode 100644
index 985d9e5de1..0000000000
--- a/board/engicam/icorem6/genimage.cfg
+++ /dev/null
@@ -1,42 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"uImage",
-			"imx6dl-icore.dtb",
-			"imx6q-icore.dtb",
-			"imx6q-icore-ofcap10.dtb",
-			"imx6q-icore-ofcap12.dtb"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition SPL {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot-dtb.img"
-		offset = 69K
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-		offset = 8M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-	}
-}
diff --git a/board/engicam/icorem6/linux_qt5.fragment b/board/engicam/icorem6/linux_qt5.fragment
deleted file mode 100644
index 5c0505e510..0000000000
--- a/board/engicam/icorem6/linux_qt5.fragment
+++ /dev/null
@@ -1,4 +0,0 @@
-# Currently kernel mainline exhibits issues when running cpufreq as ondemand
-# governor on mx6.
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
deleted file mode 100644
index bd78c5a556..0000000000
--- a/board/engicam/icorem6/readme.txt
+++ /dev/null
@@ -1,93 +0,0 @@
-*********************************************
-Buildroot for Engicam i.CoreM6 SOM platforms:
-*********************************************
-
-This file documents the Buildroot support for Engicam i.CoreM6
-platform boards.
-
-i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:
-https://www.engicam.com/vis-prod/101120
-i.CoreM6 Quad/Dual/DualLite/Solo Open Frame 10.1 C.TOUCH kits:
-https://www.engicam.com/vis-prod/101133
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-Build
-=====
-
-First, configure Buildroot for the Engicam i.CoreM6:
-
-  make engicam_imx6qdl_icore_defconfig
-
-Build all components:
-
-  make
-
-You will find the following files in output/images/:
-  - imx6q-icore.dtb (for i.CoreM6 Quad/Dual)
-  - imx6dl-icore.dtb (for i.CoreM6 DualLite/Solo)
-  - imx6q-icore-ofcap10.dtb (for i.CoreM6 Quad/Dual ofcap 10)
-  - imx6q-icore-ofcap12.dtb (for i.CoreM6 Quad/Dual ofcap 12)
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - SPL
-  - u-boot-dtb.img
-  - uImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-  sync
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-For details about the medium image layout, see the definition in
-board/engicam/icorem6/genimage.cfg
-
-Boot the i.CoreM6 boards with SD boot:
-=====================================
-
-To boot your newly created system:
-- insert the SD card in the SD slot of the board;
-- connect 3-wire RS232 serial port J28 on board, and connect with other
-  serial end or USB cable(if serial-to-usb converter used) using
-  a terminal emulator at 115200 bps, 8n1;
-- close JM3 for sd boot.
-- power on the board.
-
-Testing graphics on i.CoreM6:
-============================
-
-Build with support for Etnaviv, Qt5 and demo applications:
-
-  make engicam_imx6qdl_icore_qt5_defconfig
-  make
-
-Running kmscube
-# kmscube -D /dev/dri/card1
-
-Running glmark2-es2-drm
-# glmark2-es2-drm
-
-Running Qt5 Cinematic Demo:
-- for i.CoreM6 Starter Kit
-# export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore.json
-- for i.CoreM6 ofcap10
-# export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore-ofcap10.json
-- for i.CoreM6 ofcap12
-# export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore-ofcap12.json
-
-# CinematicExperience-demo
-
-Enjoy!
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
deleted file mode 100644
index 3bfe4a2362..0000000000
--- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
+++ /dev/null
@@ -1,11 +0,0 @@
-{
-  "device": "/dev/dri/card1",
-  "hwcursor": false,
-  "pbuffers": true,
-  "outputs": [
-    {
-      "name": "LVDS1",
-      "mode": "1280x800"
-    }
-  ]
-}
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
deleted file mode 100644
index ea5ce6f97a..0000000000
--- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap12.json
+++ /dev/null
@@ -1,11 +0,0 @@
-{
-  "device": "/dev/dri/card1",
-  "hwcursor": false,
-  "pbuffers": true,
-  "outputs": [
-    {
-      "name": "LVDS1",
-      "mode": "1280x480"
-    }
-  ]
-}
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
deleted file mode 100644
index b4fa359b64..0000000000
--- a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
+++ /dev/null
@@ -1,11 +0,0 @@
-{
-  "device": "/dev/dri/card1",
-  "hwcursor": false,
-  "pbuffers": true,
-  "outputs": [
-    {
-      "name": "LVDS1",
-      "mode": "800x480"
-    }
-  ]
-}
diff --git a/board/engicam/icorem6_rqs/genimage.cfg b/board/engicam/icorem6_rqs/genimage.cfg
deleted file mode 100644
index d6936f8109..0000000000
--- a/board/engicam/icorem6_rqs/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"uImage",
-			"imx6dl-icore-rqs.dtb",
-			"imx6q-icore-rqs.dtb"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition SPL {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot-dtb.img"
-		offset = 69K
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-		offset = 8M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-	}
-}
diff --git a/board/engicam/icorem6_rqs/readme.txt b/board/engicam/icorem6_rqs/readme.txt
deleted file mode 100644
index a0bf6f508f..0000000000
--- a/board/engicam/icorem6_rqs/readme.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-*************************************************
-Buildroot for Engicam i.CoreM6 RQS SOM platforms:
-*************************************************
-
-This file documents the Buildroot support for Engicam i.CoreM6 RQS
-SOM platform boards.
-
-i.CoreM6 Quad/Dual/DualLite/Solo RQS SOM Starter kits:
-https://www.engicam.com/vis-prod/101124
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-Build
-=====
-
-First, configure Buildroot for the Engicam i.CoreM6 RQS:
-
-- for i.CoreM6 RQS Quad/Dual/DualLite/Solo:
-
-  make engicam_imx6qdl_icore_rqs_defconfig
-
-Build all components:
-
-  make
-
-You will find the following files in output/images/:
-- for i.CoreM6 Quad/Dual RQS:
-  - imx6q-icore-rqs.dtb
-- for i.CoreM6 DualLite/Solo RQS:
-  - imx6dl-icore-rqs.dtb
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - SPL
-  - u-boot-dtb.img
-  - uImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-  sync
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-For details about the medium image layout, see the definition in
-board/engicam/icorem6_rqs/genimage.cfg
-
-Boot the i.CoreM6 RQS boards with SD boot:
-=========================================
-
-To boot your newly created system:
-- insert the SD card in the SD slot of the board;
-- connect 3-wire RS232 serial port J7 on board, and connect with other
-  serial end or USB cable(if serial-to-usb converter used) using
-  a terminal emulator at 115200 bps, 8n1;
-- close JM2 for sd boot.
-- power on the board.
-
-Enjoy!
diff --git a/board/engicam/isiot/genimage.cfg b/board/engicam/isiot/genimage.cfg
deleted file mode 100644
index 4e65a70110..0000000000
--- a/board/engicam/isiot/genimage.cfg
+++ /dev/null
@@ -1,39 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"uImage",
-			"imx6ul-isiot-emmc.dtb"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition SPL {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot-dtb {
-		in-partition-table = "no"
-		image = "u-boot-dtb.img"
-		offset = 69K
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-		offset = 8M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext2"
-	}
-}
diff --git a/board/engicam/isiot/readme.txt b/board/engicam/isiot/readme.txt
deleted file mode 100644
index 5394007ca5..0000000000
--- a/board/engicam/isiot/readme.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-********************************************
-Buildroot for Engicam Is.IoT SOM platforms:
-********************************************
-
-This file documents the Buildroot support for all Engicam Is.IoT MX6UL
-SOM platform boards.
-
-Is.IoT MX6UL SOM Starter kits:
-https://www.engicam.com/vis-prod/101122
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-Build
-=====
-
-First, configure Buildroot for the Engicam Is.IoT MX6UL SOM:
-
-- for Is.IoT MX6UL SOM:
-
-  make engicam_imx6ul_isiot_defconfig
-
-Build all components:
-
-  make
-
-You will find the following files in output/images/:
-  - imx6ul-isiot-emmc.dtb
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - SPL
-  - u-boot-dtb.img
-  - uImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-  sync
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-For details about the medium image layout, see the definition in
-board/engicam/isiot/genimage.cfg
-
-Boot the Is.IoT MX6UL boards with SD boot:
-=========================================
-
-To boot your newly created system:
-- insert the SD card in the SD slot of the board;
-- connect 3-wire RS232 serial port J28 on board, and connect with other
-  serial end or USB cable(if serial-to-usb converter used) using
-  a terminal emulator at 115200 bps, 8n1;
-- close JM3 for sd boot.
-- power on the board.
-
-Enjoy!
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
deleted file mode 100644
index 2ac415e335..0000000000
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ /dev/null
@@ -1,33 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10 imx6q-icore-ofcap12"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
deleted file mode 100644
index 8b0c8bbe28..0000000000
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ /dev/null
@@ -1,60 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
-BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/engicam/icorem6/linux_qt5.fragment"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10 imx6q-icore-ofcap12"
-BR2_PACKAGE_BITSTREAM_VERA=y
-BR2_PACKAGE_CANTARELL=y
-BR2_PACKAGE_DEJAVU=y
-BR2_PACKAGE_FONT_AWESOME=y
-BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
-BR2_PACKAGE_INCONSOLATA=y
-BR2_PACKAGE_LIBERATION=y
-BR2_PACKAGE_GLMARK2=y
-BR2_PACKAGE_KMSCUBE=y
-BR2_PACKAGE_MESA3D_DEMOS=y
-BR2_PACKAGE_QT5CINEX=y
-BR2_PACKAGE_QT5CINEX_HD=y
-BR2_PACKAGE_MESA3D=y
-BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
-BR2_PACKAGE_MESA3D_OPENGL_EGL=y
-BR2_PACKAGE_MESA3D_OPENGL_ES=y
-BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
-BR2_PACKAGE_QT5BASE_LINUXFB=y
-BR2_PACKAGE_QT5BASE_FONTCONFIG=y
-BR2_PACKAGE_QT5BASE_GIF=y
-BR2_PACKAGE_QT5BASE_JPEG=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_imx6qdl_icore_rqs_defconfig
deleted file mode 100644
index 7d4d4e3df4..0000000000
--- a/configs/engicam_imx6qdl_icore_rqs_defconfig
+++ /dev/null
@@ -1,33 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo RQS Starter Kit"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6_rqs/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore-rqs imx6q-icore-rqs"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_rqs"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/engicam_imx6ul_geam_defconfig b/configs/engicam_imx6ul_geam_defconfig
deleted file mode 100644
index ed4b491ebe..0000000000
--- a/configs/engicam_imx6ul_geam_defconfig
+++ /dev/null
@@ -1,33 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam GEAM6UL Starter Kit"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/geam6ul/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-geam-kit"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_geam_mmc"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/engicam_imx6ul_isiot_defconfig b/configs/engicam_imx6ul_isiot_defconfig
deleted file mode 100644
index 1377022c30..0000000000
--- a/configs/engicam_imx6ul_isiot_defconfig
+++ /dev/null
@@ -1,33 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam Is.IoT eMMC Starter Kit"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/isiot/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-isiot-emmc"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_isiot_emmc"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
