Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885FEC4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 21:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1589B4387F;
	Fri, 15 Dec 2023 21:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1589B4387F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCIvGm1psqbV; Fri, 15 Dec 2023 21:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10DC641917;
	Fri, 15 Dec 2023 21:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10DC641917
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB83D1BF2F6
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 21:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 944A242248
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 21:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 944A242248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xHw7KhSU03K for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 21:30:25 +0000 (UTC)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB67742243
 for <buildroot@buildroot.org>; Fri, 15 Dec 2023 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB67742243
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EFlErCb1fERwlEFlErYrTi; Fri, 15 Dec 2023 22:30:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 15 Dec 2023 22:30:19 +0100
Message-Id: <20231215213019.32352-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGf6ss5BxhPmmGDPy37Ij5/soMtORY3+M8NmkUXBIzOxsLn0nx8SyeZXb8aoZA4dxShJji2qgkCzmw3oEtOljq1XTKOYy8469JOa7QqRUGWqfAq3V0Tn
 xIXdSGhgV0c6dFaGT7R2703d7nhsjHsaBZSoZN1wrhf6jfF3QYavpQK/zoEDQz4fqP+iTWafYgA735SNK5JmHZpH8eFIKfuDl66shJasv4QIZE7uRYFWp8kN
 CCn3Im0NhTBk+uqlD31Hmfo1Z+TAFiDNjMid4zEFr08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702675820; bh=w3UBu17tXNTpGQK+Q8ETrkUcvvlPXrN/ZETX+ayehsA=;
 h=From:To:Subject:Date:MIME-Version;
 b=dRxFbi5HJz5xXwBQxYXYjeJOvoMfAmeeRFYQH1LzQIgooBsyXv13SntKmcbd7GRgG
 dJzkEEIXvxpnDFDc8pHgj0EVeGXW45UXl2qS02yFcSgL41fDZ04ds/9U5rnDPeYw6m
 YVCNJBGKykSIQZ1uuCCDAkgGGC2aECFld3XiU5qsVcpDgqYhBEuMyoG0L0qpbqHzMM
 QwyeWm2s/ky3/wNy/fwv48Q5UWd5CZSyO8diMswY0NmxpGFNVij8zBfZXHqwB3C5dx
 6RKZzqxr362N26N2e6bqPaG4Ze7nMoDyYkHj4P6PC07iSF2KVk7zMiTbpaA0Ex9kBh
 oKPjvp4HnbTjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dRxFbi5H
Subject: [Buildroot] [PATCH] configs/mangopi_mq1rdw1_defconfig: new defconfig
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 DEVELOPERS                                    |  2 +
 board/mangopi/mq1rdw2/genimage.cfg            | 17 +++++++
 board/mangopi/mq1rdw2/readme.txt              | 46 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 ++
 .../rootfs_overlay/etc/network/interfaces     |  6 +++
 .../rootfs_overlay/etc/wpa_supplicant.conf    |  8 ++++
 configs/mangopi_mq1rdw2_defconfig             | 40 ++++++++++++++++
 7 files changed, 123 insertions(+)
 create mode 100644 board/mangopi/mq1rdw2/genimage.cfg
 create mode 100644 board/mangopi/mq1rdw2/readme.txt
 create mode 100644 board/mangopi/mq1rdw2/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/mangopi/mq1rdw2/rootfs_overlay/etc/network/interfaces
 create mode 100644 board/mangopi/mq1rdw2/rootfs_overlay/etc/wpa_supplicant.conf
 create mode 100644 configs/mangopi_mq1rdw2_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 83b970b591..12dd1fdcc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1213,6 +1213,7 @@ N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	board/bananapi/bananapi-m2-ultra/
 F:	board/freescale/imx6ullevk/
 F:	board/freescale/imxrt1050evk/
+F:	board/mangopi/mq1rdw2
 F:	board/olimex/a*
 F:	board/pine64/rockpro64
 F:	configs/amarula_vyasa_rk3288_defconfig
@@ -1222,6 +1223,7 @@ F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
 F:	configs/imxrt1050-evk_defconfig
+F:	configs/mangopi_mq1rdw2_defconfig
 F:	configs/olimex_a*
 F:	configs/rockpro64_defconfig
 F:	package/at/
diff --git a/board/mangopi/mq1rdw2/genimage.cfg b/board/mangopi/mq1rdw2/genimage.cfg
new file mode 100644
index 0000000000..b48e12a831
--- /dev/null
+++ b/board/mangopi/mq1rdw2/genimage.cfg
@@ -0,0 +1,17 @@
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
+		size = 512M
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
