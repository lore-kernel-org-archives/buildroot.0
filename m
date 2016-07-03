From: Georges Savoundararadj <savoundg@gmail.com>
Date: Sun,  3 Jul 2016 16:28:52 -0700
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: add option to enable Wi-Fi
	Display
Message-ID: <20160703232852.8222-1-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY depends on
BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT because CONFIG_WIFI_DISPLAY needs
CONFIG_P2P.

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
---
 package/wpa_supplicant/Config.in         | 6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 1920774..85520b6 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -38,6 +38,12 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	  making it bigger but dispensing the need for a separate hostapd
 	  binary in some applications hence being smaller overall.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
+	bool "Enable Wi-Fi Display"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	help
+	  Enable support for Wi-Fi Display
+
 config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
 	bool "Enable autoscan"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index d1d59f7..d46328e 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -68,6 +68,10 @@ WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_P2P
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WIFI_DISPLAY
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AUTOSCAN_EXPONENTIAL \
-- 
2.9.0
