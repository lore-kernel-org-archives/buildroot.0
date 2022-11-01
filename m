Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135A4C43217
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B2881B70;
	Tue,  1 Nov 2022 22:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B2881B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIYxsJaL0RXt; Tue,  1 Nov 2022 22:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F44981B60;
	Tue,  1 Nov 2022 22:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F44981B60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB5301BF5DE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A934F80C2E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A934F80C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdUiWfbe_D8N for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D805480C0D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D805480C0D
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:03:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id DC3EBC0003;
 Tue,  1 Nov 2022 22:03:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:03:33 +0100
Message-Id: <20221101220354.403933-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667340237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVhsuXNDAW/RiKHan1DK5DOKvMiFJFsq+y4iE0hehh8=;
 b=pb0h9FVZXtZTw4rEj0bvy1fdwt1vrIv8N+nCXCTdOqVoH64eFue60IeZocd6T7P5uhImT6
 MKq+OdZtEIUGPC5JzQASFMrxjaZ5syGj/+yAzPRorrlup+9NSC/f43MnvSxTQjewR9rYkX
 XReo9+WeYFELOUAbkfkBN87v7zJ3iYCAVWhQ6jF2Mw3dofeUHslvi0ZzRQ6oihxLfDUl4l
 PlRr8zh1TbDLUJToKDLnr5teF+NfJysB92eLyal1B1u4duxpbyfrnlifAKifCExwaARsIg
 mFZ8LAJgqY2ZCpCl8feReA32OI5wKvzXxGlrO6ERyMGt7GytCoztMZ3UNj3KKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pb0h9FVZ
Subject: [Buildroot] [PATCH 01/21] configs/amarula_a64_relic: remove
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234498966

Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 -
 board/amarula/a64-relic/extlinux.conf         |  4 -
 board/amarula/a64-relic/genimage.cfg          | 11 ---
 board/amarula/a64-relic/post-build.sh         |  4 -
 board/amarula/a64-relic/readme.txt            | 90 -------------------
 .../lib/firmware/brcm/brcmfmac4330-sdio.txt   | 83 -----------------
 configs/amarula_a64_relic_defconfig           | 63 -------------
 7 files changed, 256 deletions(-)
 delete mode 100644 board/amarula/a64-relic/extlinux.conf
 delete mode 100644 board/amarula/a64-relic/genimage.cfg
 delete mode 100755 board/amarula/a64-relic/post-build.sh
 delete mode 100644 board/amarula/a64-relic/readme.txt
 delete mode 100644 board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
 delete mode 100644 configs/amarula_a64_relic_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e1e919ce4f..15aa440c72 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1323,7 +1323,6 @@ F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
-F:	configs/amarula_a64_relic_defconfig
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m1_defconfig
diff --git a/board/amarula/a64-relic/extlinux.conf b/board/amarula/a64-relic/extlinux.conf
deleted file mode 100644
index 9f469846bc..0000000000
--- a/board/amarula/a64-relic/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux-4.17.0-rc3
-  kernel /Image
-  devicetree /sun50i-a64-amarula-relic.dtb
-  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk1p4 rootwait
diff --git a/board/amarula/a64-relic/genimage.cfg b/board/amarula/a64-relic/genimage.cfg
deleted file mode 100644
index 58b607f5fb..0000000000
--- a/board/amarula/a64-relic/genimage.cfg
+++ /dev/null
@@ -1,11 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-a64-amarula-relic.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 64M
-}
diff --git a/board/amarula/a64-relic/post-build.sh b/board/amarula/a64-relic/post-build.sh
deleted file mode 100755
index ec20fca7d9..0000000000
--- a/board/amarula/a64-relic/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/amarula/a64-relic/readme.txt b/board/amarula/a64-relic/readme.txt
deleted file mode 100644
index 77f79e3094..0000000000
--- a/board/amarula/a64-relic/readme.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-Amarula A64 Relic
-================
-
-Amarula A64-Relic is an Allwinner A64 based IoT device, which supports:
-- Allwinner A64 Cortex-A53
-- Mali-400MP2 GPU
-- AXP803 PMIC
-- 1GB DDR3 RAM
-- 8GB eMMC
-- AP6330 Wifi/BLE
-- MIPI-DSI
-- CSI: OV5640 sensor
-- USB OTG
-- 12V DC power supply
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Amarual+A64-Relic
-
-Build
-=====
-
-  $ make amarula_a64_relic_defconfig
-
-  $ make
-
-build files at output/images/:
-  - sunxi-spl.bin
-  - u-boot.itb
-  - Image
-  - sun50i-a64-amarula-relic.dtb
-  - boot.vfat
-  - rootfs.ext4
-
-Write eMMC
-=========
-
-The board comes with an operating system preloaded on the eMMC.
-To replace it with the Buildroot-built system, take the following
-steps
-
-1. Connect the board UART with host and open minicom(ttyUSBx/115200N8)
-
-2. Supply 12V DC for power-on the board.
-
-3. Interrupt U-Boot by pressing enter
-
-4. Create GPT partitions
-  => mmc dev 1
-  => gpt write mmc 1 $partitions
-
-5. Connect the board USB-OTG with USB slot on the host.
-
-6. Initiate fastboot
-  => fastboot 0
-
-7. Write images from host onto eMMC using fastboot
-  $ cd output/images
-  $ sudo fastboot -i 0x1f3a flash loader1 sunxi-spl.bin
-  $ sudo fastboot -i 0x1f3a flash loader2 u-boot.itb
-  $ sudo fastboot -i 0x1f3a flash esp boot.vfat
-  $ sudo fastboot -i 0x1f3a flash system rootfs.ext4
-
-Update eMMC during Development
-==============================
-
-During development, reflashing the entire filesystem image at every
-change is time consuming. A useful alternative is to directly access
-over USB the filesystem stored on the eMMC, using the USB Mass Storage
-capability of U-Boot. To achieve this:
-
-1. Build U-Boot by enabling UMS
-   $ make uboot-menuconfig
-   (select CONFIG_CMD_USB_MASS_STORAGE=y)
-
-2. Follow all 6 steps from 'Write eMMC' and mount eMMC on host
-    => mmc dev 1
-    => ums 0 mmc 1
-
-WiFi
-====
-
- # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
-   (type password and enter)
- # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
- # udhcpc -i wlan0
- # ping google.com
-
---
-Jagan Teki <jagan@amarulasolutions.com>
-29-Jun-2018
diff --git a/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
deleted file mode 100644
index d095f24c26..0000000000
--- a/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-#AP6330_NVRAM_V1.0_20121130
-#Sample variables file for BCM94330 SD FC AGB board
-manfid=0x2d0
-prodid=0x0547
-vendid=0x14e4
-devid=0x4360
-boardtype=0x05e1
-boardrev=0x1202
-boardflags=0x0080200
-nocrc=1
-xtalfreq=26000
-boardnum=22
-macaddr=00:90:4c:c5:12:38
-ag0=254
-aa2g=1
-ccode=ALL
-pa0itssit=0x20
-pa0b0=5587
-pa0b1=-633
-pa0b2=-158
-rssismf2g=0xa
-rssismc2g=0x3
-rssisav2g=0x7
-#rssi params for 5GHz
-rssismf5g=0x4
-rssismc5g=0x3
-rssisav5g=0x7
-#PA parameters for lower a-band
-pa1lob0=4748
-pa1lob1=-566
-pa1lob2=-180
-#PA parameters for midband
-pa1b0=4762
-pa1b1=-593
-pa1b2=-172
-#PA parameters for high band
-#pa1hib0=4596
-pa1hib0=4666
-pa1hib1=-619
-pa1hib2=-163
-rxpo5g=0
-maxp2ga0=74
-maxp5ga0=66
-maxp5gla0=66
-maxp5gha0=66
-# 2.4G Tx Power offsets
-cck2gpo=0x2222
-ofdm2gpo=0x44444444
-mcs2gpo0=0x6666
-mcs2gpo1=0x6666
-# 5G Tx Power offsets
-ofdm5gpo=0x44444444
-ofdm5glpo=0x44444444
-ofdm5ghpo=0x44444444
-mcs5gpo0=0x6666
-mcs5gpo1=0x6666
-mcs5glpo0=0x6666
-mcs5glpo1=0x6666
-mcs5ghpo0=0x6666
-mcs5ghpo1=0x6666
-sromrev=3
-il0macaddr=00:90:4c:c5:12:38
-wl0id=0x431b
-cckPwrOffset=4
-swctrlmap_2g=0x44844484,0x42824282,0x40804484,0x18282,0x1ff
-triso5g=0
-swctrlmap_5g=0x00100010,0x20202020,0x20202020,0x14202,0x0f0
-rfreg033=0x19
-rfreg033_cck=0x1f
-dacrate2g=160
-dacrate5g=160
-txalpfbyp2g=1
-bphyscale=17
-cckPwrIdxCorr=-15
-pacalidx2g=50
-#pacalidx5g=20
-noise_cal_ref_2g=53
-noise_cal_po_2g=0
-noise_cal_ref_5g=52
-noise_cal_po_5g=5,0,0
-# 4330 OOB parameter: High level trigger
-muxenab=0x10
-
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
deleted file mode 100644
index 304a3ef824..0000000000
--- a/configs/amarula_a64_relic_defconfig
+++ /dev/null
@@ -1,63 +0,0 @@
-BR2_aarch64=y
-BR2_cortex_a53=y
-BR2_ARM_FPU_VFPV4=y
-
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
-
-# Firmware
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amarula_a64_relic"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,amarula,linux-amarula,v1.0a)/linux-amarula_v1.0a.tar.gz"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-amarula-relic"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Amarula A64-Relic"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_ANDROID_TOOLS=y
-BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/a64-relic/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/a64-relic/post-build.sh"
-BR2_ROOTFS_OVERLAY="board/amarula/a64-relic/rootfs_overlay"
-
-# wireless firmware
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
-
-# wireless tools
-BR2_PACKAGE_IW=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
-BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
-BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
