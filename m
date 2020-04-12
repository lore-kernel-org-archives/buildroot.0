From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Apr 2020 10:24:32 +0300
Subject: [Buildroot] [PATCH v2 2/2] package/linux-firmware: Add Wilocity
 6210 11ad firmware
In-Reply-To: <e8e22b2e19dcb0cd4182eb5f2c4032bbd6830758.1586676272.git.baruch@tkos.co.il>
References: <e8e22b2e19dcb0cd4182eb5f2c4032bbd6830758.1586676272.git.baruch@tkos.co.il>
Message-ID: <9eac30ede80fdcb49dcecef156962b154a43c2bc.1586676272.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Update vendor name in config symbol (Yann)
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index a2b41ccc5b10..eba58014b629 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -340,6 +340,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
 	help
 	  Firmware files for WLAN and Bluetooth modules wl18xx
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210
+	bool "Qualcomm Atheros wil6210"
+	help
+	  Firmware files for Qualcomm Atheros 11ad family of chips
+
 endmenu
 
 menu "Ethernet firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 530d5d665851..125e7ff73e5b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -365,6 +365,11 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210),y)
+LINUX_FIRMWARE_FILES += wil6210.*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
 LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
-- 
2.25.1
