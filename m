Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA719C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815F58246F;
	Mon, 20 Feb 2023 23:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815F58246F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFEjNq5vtEw4; Mon, 20 Feb 2023 23:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 906E582EA1;
	Mon, 20 Feb 2023 23:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 906E582EA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86FE91BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 363B6612BD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363B6612BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9Rp6e5ls19p for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 108CF612D0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 108CF612D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE7E2828C8; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:53:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 286628bcc2d1931807c4648ef4359873bb3ee559
X-Git-Newrev: f9ad317507cf8564200b88dda2463406d0171122
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.EE7E2828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/lichee_rv_dock: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9ad317507cf8564200b88dda2463406d0171122
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Lichee RV Dock is a RISC-V Linux development kits with high integration,
small size and affordable price designed for opensource developer.

https://wiki.sipeed.com/hardware/en/lichee/RV/Dock.html

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 board/sipeed/lichee_rv_dock/genimage.cfg           | 19 +++++++++
 board/sipeed/lichee_rv_dock/linux.fragment         |  7 ++++
 .../lichee_rv_dock/overlay/etc/network/interfaces  |  6 +++
 .../lichee_rv_dock/overlay/etc/wpa_supplicant.conf |  8 ++++
 board/sipeed/lichee_rv_dock/readme.txt             | 45 ++++++++++++++++++++++
 configs/sipeed_lichee_rv_dock_defconfig            | 41 ++++++++++++++++++++
 7 files changed, 127 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f27ddb110..b0f10148b5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,6 +158,7 @@ F:	package/rauc/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
 F:	board/sipeed/lichee_rv/
+F:	board/sipeed/lichee_rv_dock/
 F:	configs/sipeed_lichee_rv*
 F:	package/apparmor/
 F:	package/corkscrew/
diff --git a/board/sipeed/lichee_rv_dock/genimage.cfg b/board/sipeed/lichee_rv_dock/genimage.cfg
new file mode 100644
index 0000000000..38078f0ae3
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/genimage.cfg
@@ -0,0 +1,19 @@
+# Minimal SD card image for the sipeed Lichee RV dock
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+		offset = 1M
+	}
+}
diff --git a/board/sipeed/lichee_rv_dock/linux.fragment b/board/sipeed/lichee_rv_dock/linux.fragment
new file mode 100644
index 0000000000..10016889ab
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/linux.fragment
@@ -0,0 +1,7 @@
+CONFIG_BT=y
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_SERDEV=y
+CONFIG_BT_HCIUART_3WIRE=y
+CONFIG_BT_HCIUART_RTL=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
new file mode 100644
index 0000000000..89e7d74aff
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
@@ -0,0 +1,6 @@
+auto lo
+iface lo inet loopback
+
+auto wlan0
+iface wlan0 inet dhcp
+wpa-conf /etc/wpa_supplicant.conf
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..b43292b0a7
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,8 @@
+ap_scan=1
+
+network={
+        ssid="YOURSSID"
+        scan_ssid=1
+        key_mgmt=WPA-PSK
+        psk="YOURPASSWD"
+}
diff --git a/board/sipeed/lichee_rv_dock/readme.txt b/board/sipeed/lichee_rv_dock/readme.txt
new file mode 100644
index 0000000000..048ba64d26
--- /dev/null
+++ b/board/sipeed/lichee_rv_dock/readme.txt
@@ -0,0 +1,45 @@
+Lichee RV dock
+===============
+
+Lichee RV Dock is a RISC-V Linux development kits with high integration, small
+size and affordable price designed for opensource developer. It's equipped with
+HDMI interface and it supports many screen by its screen convert board. It's
+also equipped with many peripherals, including a UAB-A port, 2.4G Wifi-BT module,
+an analog microphone and a speaker jack interface.
+
+How to build
+============
+
+$ make sipeed_lichee_rv_dock_defconfig
+$ make
+
+Wifi
+==========
+
+Edit board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf or
+/etc/wpa_supplicant.conf once connected to the board:
+
+* Replace YOURSSID with your AP ssid
+* Replace YOURPASSWD with your AP password
+
+Bluetooth
+==========
+
+To make the device discoverable and pairable, once connected to the board:
+
+* bluetoothctl power on
+* bluetoothctl discoverable yes
+* bluetoothctl pairable yes
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
+Connect a TTL UART to the debug connector, insert the microSD card and
+plug in a USB-C cable to the PWR connector to boot the system.
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_lichee_rv_dock_defconfig
new file mode 100644
index 0000000000..7c8c6788fa
--- /dev/null
+++ b/configs/sipeed_lichee_rv_dock_defconfig
@@ -0,0 +1,41 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/sipeed/lichee_rv/overlay board/sipeed/lichee_rv_dock/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/lichee_rv_dock/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="nezha"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-lichee-rv-dock"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/lichee_rv_dock/linux.fragment"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_RTL8723DS=y
+BR2_PACKAGE_RTL8723DS_BT=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="lichee_rv_dock"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
