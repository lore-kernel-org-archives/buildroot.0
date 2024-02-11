Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C204AC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E48F84F7C;
	Sun, 11 Feb 2024 22:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DrlcZWGGNynJ; Sun, 11 Feb 2024 22:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0E584F83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C0E584F83;
	Sun, 11 Feb 2024 22:13:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41FBF1BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B31040B02
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PBmB-mjyiZ1 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E68FF408D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E68FF408D7
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:13:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62A188783E; Sun, 11 Feb 2024 22:13:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 23:13:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbe0f4de67aef0f4695073c2047ba65cc420c83a
X-Git-Newrev: fe8f95a61ec9c4d2a1416d3f1dd327ad063beb4e
X-Patchwork-Hint: ignore
Message-Id: <20240211221335.62A188783E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mangopi_mq1rdw1_defconfig: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fe8f95a61ec9c4d2a1416d3f1dd327ad063beb4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for MangoPi MQ1RDW2:
https://mangopi.org/mqr

An Allwinner T113-S3(2xCortex-A7+128MB DDR3-1600 embedded) based SBC
with:
* USB-OTG Type-C socket
* USB-HOST Type-C socket
* 2x 18 pin GPIO headers
* TF card slot
* RTL8723DS WiFi module with ext. antenna connector
* 40 pin RGB FPC connector
* 6 pin CTP FPC connector
* 24 pin DVP FPC connector
* onboard mic
* onboard audio amplifier
* FEL,reset button

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/mangopi/mq1rdw2/genimage.cfg                 | 16 ++++++++
 board/mangopi/mq1rdw2/readme.txt                   | 46 ++++++++++++++++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 ++
 .../mq1rdw2/rootfs_overlay/etc/network/interfaces  |  6 +++
 .../mq1rdw2/rootfs_overlay/etc/wpa_supplicant.conf |  8 ++++
 configs/mangopi_mq1rdw2_defconfig                  | 40 +++++++++++++++++++
 7 files changed, 122 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26868f74fe..0d12c3abcb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1211,6 +1211,7 @@ N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	board/bananapi/bananapi-m2-ultra/
 F:	board/freescale/imx6ullevk/
 F:	board/freescale/imxrt1050evk/
+F:	board/mangopi/mq1rdw2/
 F:	board/olimex/a*
 F:	board/pine64/rockpro64
 F:	configs/amarula_vyasa_rk3288_defconfig
@@ -1220,6 +1221,7 @@ F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
 F:	configs/imxrt1050-evk_defconfig
+F:	configs/mangopi_mq1rdw2_defconfig
 F:	configs/olimex_a*
 F:	configs/rockpro64_defconfig
 F:	package/at/
diff --git a/board/mangopi/mq1rdw2/genimage.cfg b/board/mangopi/mq1rdw2/genimage.cfg
new file mode 100644
index 0000000000..92c8677545
--- /dev/null
+++ b/board/mangopi/mq1rdw2/genimage.cfg
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
diff --git a/board/mangopi/mq1rdw2/readme.txt b/board/mangopi/mq1rdw2/readme.txt
new file mode 100644
index 0000000000..fd37f63154
--- /dev/null
+++ b/board/mangopi/mq1rdw2/readme.txt
@@ -0,0 +1,46 @@
+MangoPi MQ1RDW2
+===============
+
+MangoPi MQ1RDW2 is a tiny ARM Cortex-A7 based single board computer.
+It's built around Allwinner T113-S3 dual core 1GHz CPU with integrated
+128MB DDR3-1600 RAM.
+Board features:
+- USB-OTG Type-C socket
+- USB-HOST Type-C socket
+- 2x 18 pin GPIO headers
+- TF card slot
+- RTL8723DS WiFi module with ext. antenna connector
+- 40 pin RGB FPC connector
+- 6 pin CTP FPC connector
+- 24 pin DVP FPC connector
+- onboard mic
+- onboard audio amplifier
+- FEL,reset button
+
+How to build
+============
+
+$ make mangopi_mq1rdw2_defconfig
+$ make
+
+Wifi
+==========
+
+Edit board/mangopi/mq1rdw2/overlay/etc/wpa_supplicant.conf or
+/etc/wpa_supplicant.conf once connected to the board:
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
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
+
+Connect a TTL UART to the UART3 on P8 header (unpopulated), insert the microSD card and
+plug in a USB-C cable to the OTG or HOST connector to boot the system.
diff --git a/board/mangopi/mq1rdw2/rootfs_overlay/boot/extlinux/extlinux.conf b/board/mangopi/mq1rdw2/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..c190ff7659
--- /dev/null
+++ b/board/mangopi/mq1rdw2/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label MANGOPI-MQ1RDW2
+    kernel /boot/zImage
+    devicetree /boot/sun8i-t113s-mangopi-mq-r-t113.dtb
+    append console=ttyS3,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/board/mangopi/mq1rdw2/rootfs_overlay/etc/network/interfaces b/board/mangopi/mq1rdw2/rootfs_overlay/etc/network/interfaces
new file mode 100644
index 0000000000..89e7d74aff
--- /dev/null
+++ b/board/mangopi/mq1rdw2/rootfs_overlay/etc/network/interfaces
@@ -0,0 +1,6 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/mangopi/mq1rdw2/rootfs_overlay/etc/wpa_supplicant.conf b/board/mangopi/mq1rdw2/rootfs_overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/mangopi/mq1rdw2/rootfs_overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/configs/mangopi_mq1rdw2_defconfig b/configs/mangopi_mq1rdw2_defconfig
new file mode 100644
index 0000000000..a2f8a1299b
--- /dev/null
+++ b/configs/mangopi_mq1rdw2_defconfig
@@ -0,0 +1,40 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TARGET_GENERIC_HOSTNAME="mangopi-mq1rdw2"
+BR2_TARGET_GENERIC_ISSUE="Welcome to MangoPI MQ1RDW2"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS3"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/mangopi/mq1rdw2/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/mangopi/mq1rdw2/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.5"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-t113s-mangopi-mq-r-t113"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_RTL8723DS=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01-rc4"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mangopi_mq_r"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
