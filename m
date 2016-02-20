From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:30 +0100
Subject: [Buildroot] [PATCH/next 25/31] package/kodi-pvr-hdhomerun: new
	package
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-26-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hdhomerun/Config.in               |  9 +++++++++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash |  2 ++
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk   | 15 +++++++++++++++
 package/kodi/Config.in                             |  1 +
 4 files changed, 27 insertions(+)
 create mode 100644 package/kodi-pvr-hdhomerun/Config.in
 create mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
 create mode 100644 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk

diff --git a/package/kodi-pvr-hdhomerun/Config.in b/package/kodi-pvr-hdhomerun/Config.in
new file mode 100644
index 0000000..ed5b914
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_PVR_HDHOMERUN
+	bool "kodi-pvr-hdhomerun"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBHDHOMERUN
+	help
+	  Kodi's HDHomeRun client addon
+
+	  https://github.com/kodi-pvr/pvr.hdhomerun
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
new file mode 100644
index 0000000..e822ae2
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  356548f86616a421e0b1d7f2a91eb5159c74b666973faa9de626940eb89afc54  kodi-pvr-hdhomerun-8d7b8af10633ad995193fb045cbaac6094a8f98d.tar.gz
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
new file mode 100644
index 0000000..c35c38a
--- /dev/null
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# kodi-pvr-hdhomerun
+#
+################################################################################
+
+# This cset is on the branch 'Jarvis'
+# When Kodi is updated, then this should be updated to the corresponding branch
+KODI_PVR_HDHOMERUN_VERSION = 8d7b8af10633ad995193fb045cbaac6094a8f98d
+KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
+KODI_PVR_HDHOMERUN_LICENSE = GPLv2+
+KODI_PVR_HDHOMERUN_LICENSE_FILES = src/client.h
+KODI_PVR_HDHOMERUN_DEPENDENCIES = jsoncpp kodi-platform libhdhomerun
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 017d607..daed533 100644
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
