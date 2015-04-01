From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:03 +0200
Subject: [Buildroot] [PATCH/RFC 10/27] package/kodi-pvr-hts: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-11-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..1017779
--- /dev/null
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-hts
+#
+################################################################################
+
+KODI_PVR_HTS_VERSION = 4bf1a97af1e5d9f748afda30d92914bc4b1f7621
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
index ad8cab4..90dfa46 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -271,6 +271,7 @@ source "package/kodi-pvr-argustv/Config.in"
 source "package/kodi-pvr-dvblink/Config.in"
 source "package/kodi-pvr-dvbviewer/Config.in"
 source "package/kodi-pvr-filmon/Config.in"
+source "package/kodi-pvr-hts/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
