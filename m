From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:07 +0200
Subject: [Buildroot] [PATCH/RFC 14/27] package/kodi-pvr-nextpvr: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/Config.in           |    7 +++++++
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk |   17 +++++++++++++++++
 package/kodi/Config.in                       |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-nextpvr/Config.in
 create mode 100644 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk

diff --git a/package/kodi-pvr-nextpvr/Config.in b/package/kodi-pvr-nextpvr/Config.in
new file mode 100644
index 0000000..e520426
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_NEXTPVR
+	bool "kodi-pvr-nextpvr"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's NextPVR client addon
+
+	  https://github.com/kodi-pvr/pvr.nextpvr
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
new file mode 100644
index 0000000..796062d
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-nextpvr
+#
+################################################################################
+
+KODI_PVR_NEXTPVR_VERSION = 1ecbf87c1e493bb22045632de0ccd2dad9739dae
+KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
+KODI_PVR_NEXTPVR_LICENSE = GPLv2+
+KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.cpp
+
+KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
+
+KODI_PVR_NEXTPVR_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 91ac27a..b1fcdd6 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -275,6 +275,7 @@ source "package/kodi-pvr-hts/Config.in"
 source "package/kodi-pvr-iptvsimple/Config.in"
 source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 source "package/kodi-pvr-mythtv/Config.in"
+source "package/kodi-pvr-nextpvr/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
