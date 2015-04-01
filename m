From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:36:10 +0200
Subject: [Buildroot] [PATCH/RFC 17/27] package/kodi-pvr-vdr: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vdr/Config.in       |    7 +++++++
 package/kodi-pvr-vdr/kodi-pvr-vdr.mk |   17 +++++++++++++++++
 package/kodi/Config.in               |    1 +
 3 files changed, 25 insertions(+)
 create mode 100644 package/kodi-pvr-vdr/Config.in
 create mode 100644 package/kodi-pvr-vdr/kodi-pvr-vdr.mk

diff --git a/package/kodi-pvr-vdr/Config.in b/package/kodi-pvr-vdr/Config.in
new file mode 100644
index 0000000..767c870
--- /dev/null
+++ b/package/kodi-pvr-vdr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VDR
+	bool "kodi-pvr-vdr"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi PVR addon VNSI
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-vdr/kodi-pvr-vdr.mk b/package/kodi-pvr-vdr/kodi-pvr-vdr.mk
new file mode 100644
index 0000000..d62d66b
--- /dev/null
+++ b/package/kodi-pvr-vdr/kodi-pvr-vdr.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-vdr
+#
+################################################################################
+
+KODI_PVR_VDR_VERSION = 3a28e39a59eefbca8ad3ff932c8373eede954416
+KODI_PVR_VDR_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VERSION))
+KODI_PVR_VDR_LICENSE = GPLv2+
+KODI_PVR_VDR_LICENSE_FILES = src/VNSIAdmin.cpp
+
+KODI_PVR_VDR_DEPENDENCIES = kodi-platform
+
+KODI_PVR_VDR_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 44a433e..5cf41f1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -278,6 +278,7 @@ source "package/kodi-pvr-mythtv/Config.in"
 source "package/kodi-pvr-nextpvr/Config.in"
 source "package/kodi-pvr-njoy/Config.in"
 source "package/kodi-pvr-pctv/Config.in"
+source "package/kodi-pvr-vdr/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
