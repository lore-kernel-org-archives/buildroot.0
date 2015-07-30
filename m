From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-dvblink: new package
Message-ID: <20150730132258.5F0557FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a69eca43f4a08c6a7cff1e5f8455618d1a84f5d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-dvblink/Config.in           |    8 ++++++++
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk |   13 +++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 734a5b5..b66f9b5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -111,6 +111,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	bool "Kodi PVR addon was split"
 	select BR2_LEGACY
 	select BR2_PACKAGE_KODI_PVR_ARGUSTV
+	select BR2_PACKAGE_KODI_PVR_DVBLINK
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-dvblink/Config.in b/package/kodi-pvr-dvblink/Config.in
new file mode 100644
index 0000000..57f1127
--- /dev/null
+++ b/package/kodi-pvr-dvblink/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_DVBLINK
+	bool "kodi-pvr-dvblink"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML2
+	help
+	  Kodi's DVBLink client addon
+
+	  https://github.com/kodi-pvr/pvr.dvblink
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
new file mode 100644
index 0000000..902c7f3
--- /dev/null
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-dvblink
+#
+################################################################################
+
+KODI_PVR_DVBLINK_VERSION = cf756e9241c58d98c3b56dfcae89da9f35e4555f
+KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
+KODI_PVR_DVBLINK_LICENSE = GPLv2+
+KODI_PVR_DVBLINK_LICENSE_FILES = src/client.h
+KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 33926d8..cd9f3f1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -259,6 +259,7 @@ endmenu
 menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
 	source "package/kodi-pvr-argustv/Config.in"
+	source "package/kodi-pvr-dvblink/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
