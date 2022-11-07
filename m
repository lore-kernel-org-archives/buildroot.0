Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FADC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F76410E5;
	Mon, 20 Feb 2023 21:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F76410E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGJbwvC4YjyG; Mon, 20 Feb 2023 21:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B87E429D0;
	Mon, 20 Feb 2023 21:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B87E429D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4581BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 492F94015F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 492F94015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZ0g64XFiNrM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DA440C29
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4DA440C29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A18FA86495; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 22:17:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5f7a517f5c156666cef58dec429bfffd4ae41e81
X-Git-Newrev: d968cab0bd673311a87a8fc5187b1701200719de
X-Patchwork-Hint: ignore
Message-Id: <20230220205148.A18FA86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/friendlyarm_nanopi_neo_plus2: remove defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d968cab0bd673311a87a8fc5187b1701200719de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499055

Cc: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 -
 board/friendlyarm/nanopi-neo-plus2/extlinux.conf   |  4 --
 board/friendlyarm/nanopi-neo-plus2/genimage.cfg    | 40 --------------
 .../nanopi-neo-plus2/linux-extras.config           | 10 ----
 board/friendlyarm/nanopi-neo-plus2/post-build.sh   |  4 --
 board/friendlyarm/nanopi-neo-plus2/readme.txt      | 37 -------------
 ...fmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt | 53 ------------------
 configs/friendlyarm_nanopi_neo_plus2_defconfig     | 62 ----------------------
 8 files changed, 212 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 27482d095a..0c9f885808 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1780,8 +1780,6 @@ F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
 
 N:	Louis Aussedat <aussedat.louis@gmail.com>
-F:	board/friendlyarm/nanopi-neo-plus2/
-F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
 F:	package/mfoc
 F:	package/libpam-nfc
 F:	package/python-dnspython/
diff --git a/board/friendlyarm/nanopi-neo-plus2/extlinux.conf b/board/friendlyarm/nanopi-neo-plus2/extlinux.conf
deleted file mode 100644
index fcb6f632c1..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-  kernel /Image
-  devicetree /sun50i-h5-nanopi-neo-plus2.dtb
-  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
deleted file mode 100644
index 9000201399..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h5-nanopi-neo-plus2.dtb",
-			"extlinux"
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
-	partition spl {
-		in-partition-table = "no"
-		image = "sunxi-spl.bin"
-		offset = 8K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/friendlyarm/nanopi-neo-plus2/linux-extras.config b/board/friendlyarm/nanopi-neo-plus2/linux-extras.config
deleted file mode 100644
index 52b4b4b29e..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/linux-extras.config
+++ /dev/null
@@ -1,10 +0,0 @@
-# wireless core
-CONFIG_WIRELESS=y
-CONFIG_CFG80211=y
-CONFIG_MAC80211=y
-CONFIG_CFG80211_WEXT=y
-
-# wireless drivers
-CONFIG_WLAN=y
-CONFIG_WLAN_VENDOR_BROADCOM=y
-CONFIG_BRCMFMAC=m
diff --git a/board/friendlyarm/nanopi-neo-plus2/post-build.sh b/board/friendlyarm/nanopi-neo-plus2/post-build.sh
deleted file mode 100755
index ec20fca7d9..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-neo-plus2/readme.txt b/board/friendlyarm/nanopi-neo-plus2/readme.txt
deleted file mode 100644
index ae59952029..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Nanopi NEO Plus2. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Nanopi NEO2 link:
-http://nanopi.io/nanopi-neo-plus2.html
-
-Wiki link:
-http://wiki.friendlyarm.com/wiki/index.php/NanoPi_NEO_Plus2
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make friendlyarm_nanopi_neo_plus2_defconfig
-    $ make
-
-Note: you will need access to the internet to download the required
-sources.
-
-How to write the SD card
-========================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-  $ sudo sync
-
-Insert the micro SDcard in your Nanopi NEO Plus2 and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt b/board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt
deleted file mode 100644
index 740d172eb5..0000000000
--- a/board/friendlyarm/nanopi-neo-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.friendlyarm,nanopi-neo-plus2.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-#AP6212_NVRAM_V1.0.1_20160606
-# 2.4 GHz, 20 MHz BW mode
-# The following parameter values are just placeholders, need to be updated.
-manfid=0x2d0
-prodid=0x0726
-vendid=0x14e4
-devid=0x43e2
-boardtype=0x0726
-boardrev=0x1101
-boardnum=22
-macaddr=00:90:4c:c5:12:38
-sromrev=11
-boardflags=0x00404201
-xtalfreq=26000
-nocrc=1
-ag0=255
-aa2g=1
-ccode=ALL
-
-pa0itssit=0x20
-extpagain2g=0
-
-#PA parameters for 2.4GHz, measured at CHIP OUTPUT
-pa2ga0=-168,7161,-820
-AvVmid_c0=0x0,0xc8
-cckpwroffset0=5
-
-# PPR params
-maxp2ga0=90
-txpwrbckof=6
-cckbw202gpo=0x5555
-legofdmbw202gpo=0x77777777
-mcsbw202gpo=0xaaaaaaaa
-
-# OFDM IIR :
-ofdmdigfilttype=7
-# PAPD mode:
-papdmode=2
-
-il0macaddr=00:90:4c:c5:12:38
-wl0id=0x431b
-
-#OOB parameters
-hostwake=0x40
-hostrdy=0x41
-usbrdy=0x03
-usbrdydelay=100
-deadman_to=0xffffffff
-# muxenab: 0x1 for UART enable, 0x10 for Host awake
-muxenab=0x10
-# CLDO PWM voltage settings - 0x4 - 1.1 volt
-#cldo_pwm=0x4
-glitch_based_crsmin=1
diff --git a/configs/friendlyarm_nanopi_neo_plus2_defconfig b/configs/friendlyarm_nanopi_neo_plus2_defconfig
deleted file mode 100644
index 461e468cb6..0000000000
--- a/configs/friendlyarm_nanopi_neo_plus2_defconfig
+++ /dev/null
@@ -1,62 +0,0 @@
-BR2_aarch64=y
-BR2_cortex_a53=y
-BR2_ARM_FPU_VFPV4=y
-
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_ROOTFS_OVERLAY="board/friendlyarm/nanopi-neo-plus2/rootfs_overlay"
-
-# Firmware
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
-R2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo_plus2"
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
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo-plus2"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-neo-plus2/linux-extras.config"
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM Nanopi NEO Plus2"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo-plus2/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo-plus2/post-build.sh"
-
-# wireless firmware
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
-
-# wireless tools
-BR2_PACKAGE_IW=y
-BR2_PACKAGE_WIRELESS_TOOLS=y
-BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
-BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
