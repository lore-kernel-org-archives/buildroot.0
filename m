From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 12 Mar 2015 23:00:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: Enable support for
	log to debug file
Message-ID: <1426197654-8183-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables the '-f' option (log output to debug file instead of stdout) for
wpa_supplicant.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/wpa_supplicant/Config.in         | 5 +++++
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index f32a867..7c213a2 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -32,6 +32,11 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG
 	help
 	  Enable support for sending debug messages to syslog.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_FILE
+	bool "Enable log output to debug file"
+	help
+	  Enable support for log output to debug file instead of stdout.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 	bool "Enable WPS"
 	help
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 682cb4c..4f9dff0 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -107,6 +107,10 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_FILE
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 	WPA_SUPPLICANT_DEPENDENCIES += readline
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
-- 
2.3.2
