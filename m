From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:13 +0200
Subject: [Buildroot] [PATCH/RFC v2 14/44] package/kodi-pvr-argustv: new
	package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/Config.in           |    7 +++++++
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-argustv/Config.in
 create mode 100644 package/kodi-pvr-argustv/kodi-pvr-argustv.mk

diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
new file mode 100644
index 0000000..698ff46
--- /dev/null
+++ b/package/kodi-pvr-argustv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_ARGUSTV
+	bool "kodi-pvr-argustv"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's ARGUS TV client addon
+
+	  https://github.com/kodi-pvr/pvr.argustv
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
new file mode 100644
index 0000000..c1f738e
--- /dev/null
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-argustv
+#
+################################################################################
+
+KODI_PVR_ARGUSTV_VERSION = cffc8b6bee2778e9da76b798d25685bc5e9b9fe0
+KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
+KODI_PVR_ARGUSTV_LICENSE = GPLv2+
+KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
+
+KODI_PVR_ARGUSTV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 454f839..bb9e3fc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_KODI_OPTICALDRIVE
 
 menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
+	source "package/kodi-pvr-argustv/Config.in"
 endmenu
 
 menu "Audio encoder addons"
-- 
1.7.10.4
