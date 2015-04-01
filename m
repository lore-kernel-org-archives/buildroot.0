From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Apr 2015 20:35:59 +0200
Subject: [Buildroot] [PATCH/RFC 06/27] package/kodi-pvr-argustv: new package
In-Reply-To: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427913380-14808-7-git-send-email-bernd.kuhls@t-online.de>
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
index 0000000..e5e9e5b
--- /dev/null
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-pvr-argustv
+#
+################################################################################
+
+KODI_PVR_ARGUSTV_VERSION = e04d5623c3dfaa12960c4239439a2706510113db
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
index eee6d81..274c413 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -267,6 +267,7 @@ if BR2_PACKAGE_KODI_PVR_ADDONS
 
 comment "Kodi PVR addons"
 
+source "package/kodi-pvr-argustv/Config.in"
 source "package/kodi-addon-xvdr/Config.in"
 
 endif # BR2_PACKAGE_KODI_PVR_ADDONS
-- 
1.7.10.4
