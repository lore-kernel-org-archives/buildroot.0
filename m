From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:55:49 +0100
Subject: [Buildroot] [git commit branch/next] wpa_supplicant: add mesh
	support (IEEE 80211s)
Message-ID: <20161107215622.DDB3B7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=100ed2c05a47b239b383a2f83f1ffc8bb70b86f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/Config.in         | 7 +++++++
 package/wpa_supplicant/wpa_supplicant.mk | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 454541f..9250a3b 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -45,6 +45,13 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
 	help
 	  Enable support for Wi-Fi Display
 
+config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING
+	bool "Enable mesh networking"
+	depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	help
+	  Enable support for open and secured mesh networking
+	  (IEEE 802.11s)
+
 config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
 	bool "Enable autoscan"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 3c3317b..9c8414b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -73,6 +73,11 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WIFI_DISPLAY
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
+WPA_SUPPLICANT_CONFIG_SET += CONFIG_MESH
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_IEEE80211W
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_AUTOSCAN_EXPONENTIAL \
