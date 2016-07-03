From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 18:09:18 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: Add optional
	autoscan support
Message-ID: <20160703160924.021407FBEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ccaec03557880f0ed6811e11661a6166c7c3a89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/Config.in         | 5 +++++
 package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index f4c4167..1920774 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -38,6 +38,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	  making it bigger but dispensing the need for a separate hostapd
 	  binary in some applications hence being smaller overall.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN
+	bool "Enable autoscan"
+	help
+	  Enable support for the autoscan feature (allow periodic scan)
+
 config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	bool "Enable EAP"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 21bbd3e..d1d59f7 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -68,6 +68,12 @@ WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_P2P
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_AUTOSCAN_EXPONENTIAL \
+	CONFIG_AUTOSCAN_PERIODIC
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
 endif
