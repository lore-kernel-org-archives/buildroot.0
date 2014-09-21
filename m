From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:49:27 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for TI
	wl18xx firmware
Message-ID: <20140921175639.B32179D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=781c5952810409509ab38e0667763bd8d56cd9d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wl18xx are a familly of WLAN + BT chipsets.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    9 +++++++--
 package/linux-firmware/linux-firmware.mk |   12 ++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f1670e8..975445a 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -132,15 +132,20 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 	  Realtek rtl8821ae
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
-	bool "TI wl127X"
+	bool "TI wl127x"
 	help
 	  Firmware files for WLAN and Bluetooth modules wl1271 and wl1273
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
-	bool "TI wl128X"
+	bool "TI wl128x"
 	help
 	  Firmware files for WLAN and Bluetooth modules wl128x
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
+	bool "TI wl18xx"
+	help
+	  Firmware files for WLAN and Bluetooth modules wl18xx
+
 endmenu
 
 menu "Ethernet firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c0641b9..87738a1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -140,6 +140,18 @@ LINUX_FIRMWARE_FILES += ti-connectivity/wl127x-nvs.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+# wl18xx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
+LINUX_FIRMWARE_FILES += \
+	ti-connectivity/wl18xx-fw.bin \
+	ti-connectivity/wl18xx-conf.bin \
+	ti-connectivity/wl18xx-fw-2.bin \
+	ti-connectivity/wl18xx-fw-3.bin \
+	ti-connectivity/wl18xx-fw-4.bin \
+	ti-connectivity/TIInit_7.2.31.bts
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
 LINUX_FIRMWARE_FILES += iwlwifi-3160-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160_7260_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
