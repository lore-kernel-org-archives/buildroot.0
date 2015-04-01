From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:04 +0200
Subject: [Buildroot] [PATCH/RFC 11/27] package/kodi-pvr-iptvsimple: new
	package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-iptvsimple/Config.in              |    7 +++++++
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |   17 +++++++++++++++++
 package/kodi/Config.in                             |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-iptvsimple/Config.in
 create mode 100644 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk

diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
new file mode 100644
index 0000000..b596749
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
+	bool "kodi-pvr-iptvsimple"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  IPTV Live TV and Radio PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.iptvsimple
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
new file mode 100644
index 0000000..952cd15
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-iptvsimple
+#
+################################################################################
+
+KODI_PVR_IPTVSIMPLE_VERSION = 38a72e5d94696bfd31daa9075d827319f73223c7
+KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
+KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
+KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
+
+KODI_PVR_IPTVSIMPLE_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 90dfa46..701f03a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -272,6 +272,7 @@ source "package/kodi-pvr-dvblink/Config.in"
 source "package/kodi-pvr-dvbviewer/Config.in"
 source "package/kodi-pvr-filmon/Config.in"
 source "package/kodi-pvr-hts/Config.in"
+source "package/kodi-pvr-iptvsimple/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
