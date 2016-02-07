From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:03:06 +0100
Subject: [Buildroot] [PATCH 22/28] package/kodi-pvr-hdhomerun: new package
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hdhomerun/Config.in             | 13 +++++++++++++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk | 13 +++++++++++++
 package/kodi/Config.in                           |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 package/kodi-pvr-hdhomerun/Config.in
 create mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk

diff --git a/package/kodi-pvr-hdhomerun/Config.in b/package/kodi-pvr-hdhomerun/Config.in
new file mode 100644
index 0000000..c4e997c
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KODI_PVR_HOMERUN
+	bool "kodi-pvr-hdhomerun"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBHDHOMERUN
+	help
+	  Kodi's HDHomeRun client addon
+
+	  https://github.com/kodi-pvr/pvr.hdhomerun
+
+comment "kodi-pvr-hdhomerun needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
new file mode 100644
index 0000000..38e5b87
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-hdhomerun
+#
+################################################################################
+
+KODI_PVR_HDHOMERUN_VERSION = a1bf18ce9bbcb0272102d9a03df6de9dfd7c4021
+KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
+KODI_PVR_HDHOMERUN_LICENSE = GPLv2+
+KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
+KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 258a44d..216e730 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -248,6 +248,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
+	source "package/kodi-pvr-hdhomerun/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
-- 
2.7.0
