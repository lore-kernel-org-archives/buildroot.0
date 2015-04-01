From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:09 +0200
Subject: [Buildroot] [PATCH/RFC 16/27] package/kodi-pvr-pctv: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-17-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-pctv/Config.in        |    8 ++++++++
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk |   17 +++++++++++++++++
 package/kodi/Config.in                 |    1 +
 3 files changed, 26 insertions(+)
 create mode 100644 package/kodi-pvr-pctv/Config.in
 create mode 100644 package/kodi-pvr-pctv/kodi-pvr-pctv.mk

diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
new file mode 100644
index 0000000..255cd4a
--- /dev/null
+++ b/package/kodi-pvr-pctv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_PCTV
+	bool "kodi-pvr-pctv"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  PCTV PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
new file mode 100644
index 0000000..c955a1a
--- /dev/null
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-pctv
+#
+################################################################################
+
+KODI_PVR_PCTV_VERSION = 0a0924eb292296ce8617a5d78c881cbb26318f97
+KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
+KODI_PVR_PCTV_LICENSE = GPLv2+
+KODI_PVR_PCTV_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
+
+KODI_PVR_PCTV_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8f0ab1d..44a433e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -277,6 +277,7 @@ source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 source "package/kodi-pvr-mythtv/Config.in"
 source "package/kodi-pvr-nextpvr/Config.in"
 source "package/kodi-pvr-njoy/Config.in"
+source "package/kodi-pvr-pctv/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
