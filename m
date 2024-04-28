Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0F9C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B69116069E;
	Sun, 28 Apr 2024 18:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rheUxbxdRPgs; Sun, 28 Apr 2024 18:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A0B606EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A0B606EC;
	Sun, 28 Apr 2024 18:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06CDF1BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0092560666
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVU1zuXm5F00 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFDE460633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFDE460633
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0BB6861F4; Sun, 28 Apr 2024 18:27:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 20:07:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 544684291a6174130575ac6e7ecc978aacb78a92
X-Git-Newrev: 108175922b9d1c412e6fa71d1a1e96fd4fdca62d
X-Patchwork-Hint: ignore
Message-Id: <20240428182741.A0BB6861F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/warpboard: remove defconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=108175922b9d1c412e6fa71d1a1e96fd4fdca62d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Fabio in [1], this commit removes the defconfig and all
other associated files.

The U-Boot support for the Warpboard has been removed upstream in
commit [2], first included in version 2022.10.

For reference, at the time of this commit, the latest Kernel is 6.8.6
and still has support for this board. See [3].

The reason of this removal is because this defconfig fail to build with
recent toolchains. See [4].

Fixes: [4]

[1] https://lists.buildroot.org/pipermail/buildroot/2024-April/689596.html
[2] https://source.denx.de/u-boot/u-boot/-/commit/c50ff4a933d5617415221bbb85b0bfa5247b697a
[3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts?h=v6.8.6
[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466749

Suggested-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  2 -
 board/freescale/warpboard/README                   | 77 ----------------------
 board/freescale/warpboard/linux.fragment           |  1 -
 .../lib/firmware/brcm/brcmfmac4330-sdio.txt        | 40 -----------
 configs/warpboard_defconfig                        | 58 ----------------
 5 files changed, 178 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff..4d10e3dbac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -942,7 +942,6 @@ F:	package/openbox/
 F:	package/supertuxkart/
 
 N:	Fabio Estevam <festevam@gmail.com>
-F:	board/freescale/warpboard/
 F:	board/warp7/
 F:	configs/freescale_imx*
 F:	configs/imx23evk_defconfig
@@ -963,7 +962,6 @@ F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
 F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
-F:	configs/warpboard_defconfig
 F:	package/atest/
 F:	package/crucible/
 F:	package/kmscube/
diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
deleted file mode 100644
index 67d4e044e9..0000000000
--- a/board/freescale/warpboard/README
+++ /dev/null
@@ -1,77 +0,0 @@
-Build
-=====
-
-First, configure Buildroot for your WarpBoard.
-  make warpboard_defconfig
-
-Build all components:
-  make
-
-You will find in ./output/images/ the following files:
-  - imx6sl-warp.dtb
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - u-boot.imx
-  - zImage
-
-Update uboot
-============
-
-- Put warpboard in USB download mode by closing the j2 jumper on the
-  daugther board
-
-- Load u-boot.imx in the WarpBoard by using the imx-usb-loader host utility:
-
-  $ ./output/host/bin/imx_usb -c output/host/etc/imx-loader.d/ output/images/u-boot.imx
-
-- U-Boot will appear in minicom
-
-- Reset the U-Boot environment to its default:
- => env default -f -a
- => saveenv
-
-- Run the DFU command in U-Boot:
- => dfu 0 mmc 0
-
-- Transfer U-Boot into flash by running this command in host side:
-
- $ sudo ./output/host/bin/dfu-util -D output/images/u-boot.imx -a boot
-
-- remove power and put the WarpBoard back into normal boot mode by
-  opening the j2 jumper.
-
-Update linux & rootfs
-=====================
-
-Run the 'ums' command from the U-Boot prompt to mount the eMMC as USB mass
-storage:
-
-=> ums 0 mmc 0
-
-And then flash the sdcard.img into the eMMC:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-
-*** WARNING! This will destroy all the eMMC content. Use it with care! ***
-
-Using bluetooth
-================
-
-Enable the bluez_utils or bluez5_utils package, and then run:
-
-$ hciattach /dev/ttymxc4 any
-$ hciconfig hci0 up
-
-Using Wifi
-==========
-
-# modprobe brcmfmac
-# iwconfig wlan0 essid ACCESSPOINTNAME
-# wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
-(enter the wifi password and press enter)
-# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
-# udhcpc -i wlan0
-# ping buildroot.org
-
-Enjoy!
diff --git a/board/freescale/warpboard/linux.fragment b/board/freescale/warpboard/linux.fragment
deleted file mode 100644
index 892d0cb7b9..0000000000
--- a/board/freescale/warpboard/linux.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_CFG80211_WEXT=y
diff --git a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
deleted file mode 100644
index 9546246b91..0000000000
--- a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-# bcm94330wlsdgb.txt
-manfid=0x2d0
-prodid=0x0552
-vendid=0x14e4
-devid=0x4360
-boardtype=0x0552
-boardrev=0x11
-# this design has 2.4GHz SP3T switch
-boardflags=0x00080200
-nocrc=1
-xtalfreq=37400
-boardnum=22
-macaddr=00:90:4c:c5:12:38
-ag0=255
-aa2g=1
-ccode=CN
-pa0b0=0x14d0
-pa0b1=0xfd98
-pa0b2=0xff78
-rssismf2g=0xa
-rssismc2g=0x3
-rssisav2g=0x7
-maxp2ga0=0x50
-sromrev=3
-il0macaddr=00:90:4c:c5:12:38
-wl0id=0x431b
-cckPwrOffset=5
-ofdm2gpo=0x66666666
-mcs2gpo0=0x6666
-mcs2gpo1=0x6666
-swctrlmap_2g=0x04040404,0x02020202,0x02020404,0x10202,0x1ff
-swctrlmap_5g=0x00100010,0x00280020,0x00200010,0x14202,0x2f8
-rfreg033=0x19
-rfreg033_cck=0x1f
-dacrate2g=160
-txalpfbyp2g=1
-bphyscale=17
-cckPwrIdxCorr=-15
-pacalidx2g=45
-txgaintbl=1
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
deleted file mode 100644
index 1655381aa6..0000000000
--- a/configs/warpboard_defconfig
+++ /dev/null
@@ -1,58 +0,0 @@
-# architecture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-
-# system
-BR2_TARGET_GENERIC_HOSTNAME="warpboard"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# rootfs overlay
-BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/warpboard/linux.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
-
-# wifi firmware for brcm4330
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
-
-# For automatic firmware loading
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-
-# wireless packages
-BR2_PACKAGE_WIRELESS_TOOLS=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
-
-# uboot
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="warp"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-
-# host utility
-BR2_PACKAGE_HOST_DFU_UTIL=y
-BR2_PACKAGE_HOST_IMX_USB_LOADER=y
-
-# Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-
-# required tools to create the eMMC image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
