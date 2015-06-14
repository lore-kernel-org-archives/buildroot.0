From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:24 +0200
Subject: [Buildroot] [PATCH/RFC v2 25/44] package/kodi-pvr-stalker: new
	package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-stalker/Config.in           |    7 +++++++
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-stalker/Config.in
 create mode 100644 package/kodi-pvr-stalker/kodi-pvr-stalker.mk

diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
new file mode 100644
index 0000000..b327fd8
--- /dev/null
+++ b/package/kodi-pvr-stalker/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_STALKER
+	bool "kodi-pvr-stalker"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  A PVR Client that connects Kodi to Stalker Middleware
+
+	  https://github.com/kodi-pvr/pvr.stalker
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
new file mode 100644
index 0000000..9dceae4
--- /dev/null
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-stalker
+#
+################################################################################
+
+KODI_PVR_STALKER_VERSION = a8c3e45e8416d2981e0ad2a9fc89bcaca60b6e3e
+KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
+KODI_PVR_STALKER_LICENSE = GPLv2+
+KODI_PVR_STALKER_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_STALKER_DEPENDENCIES = kodi-platform
+
+KODI_PVR_STALKER_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6aaf72f..3cbc9aa 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -264,6 +264,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-nextpvr/Config.in"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
+	source "package/kodi-pvr-stalker/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
