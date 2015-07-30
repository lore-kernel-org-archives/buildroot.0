From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-dvbviewer: new package
Message-ID: <20150730132258.67E8C7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6894c6c74e2b834884121ea3198627426e5ab03a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                 |    1 +
 package/kodi-pvr-dvbviewer/Config.in             |    7 +++++++
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk |   13 +++++++++++++
 package/kodi/Config.in                           |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b66f9b5..4118bbe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -112,6 +112,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_PVR_ARGUSTV
 	select BR2_PACKAGE_KODI_PVR_DVBLINK
+	select BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-dvbviewer/Config.in b/package/kodi-pvr-dvbviewer/Config.in
new file mode 100644
index 0000000..e7dd7b3
--- /dev/null
+++ b/package/kodi-pvr-dvbviewer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_DVBVIEWER
+	bool "kodi-pvr-dvbviewer"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's DVBViewer client addon
+
+	  https://github.com/kodi-pvr/pvr.dvbviewer
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
new file mode 100644
index 0000000..49fc5fc
--- /dev/null
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-dvbviewer
+#
+################################################################################
+
+KODI_PVR_DVBVIEWER_VERSION = cbfd4552a4381d289bcfb8eda33699ecfd156bd7
+KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
+KODI_PVR_DVBVIEWER_LICENSE = GPLv2+
+KODI_PVR_DVBVIEWER_LICENSE_FILES = src/client.h
+KODI_PVR_DVBVIEWER_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index cd9f3f1..b918563 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -260,6 +260,7 @@ menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
+	source "package/kodi-pvr-dvbviewer/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
