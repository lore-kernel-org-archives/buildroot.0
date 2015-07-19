From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:24 +0200
Subject: [Buildroot] [PATCH/RFC v3 19/50] package/kodi-pvr-hts: new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/Config.in       |    7 +++++++
 package/kodi-pvr-hts/kodi-pvr-hts.mk |   17 +++++++++++++++++
 package/kodi/Config.in               |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-hts/Config.in
 create mode 100644 package/kodi-pvr-hts/kodi-pvr-hts.mk

diff --git a/package/kodi-pvr-hts/Config.in b/package/kodi-pvr-hts/Config.in
new file mode 100644
index 0000000..c4c4497
--- /dev/null
+++ b/package/kodi-pvr-hts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_HTS
+	bool "kodi-pvr-hts"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Tvheadend HTSP PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.hts
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
new file mode 100644
index 0000000..abd8b6b
--- /dev/null
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-hts
+#
+################################################################################
+
+KODI_PVR_HTS_VERSION = 5c2244044a00ecd3320fc6ce15dd208c16578588
+KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
+KODI_PVR_HTS_LICENSE = GPLv2+
+KODI_PVR_HTS_LICENSE_FILES = src/Tvheadend.cpp
+
+KODI_PVR_HTS_DEPENDENCIES = kodi-platform
+
+KODI_PVR_HTS_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 12d299c..9a20d83 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -257,6 +257,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
+	source "package/kodi-pvr-hts/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
