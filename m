From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-filmon: new
	package
Message-ID: <20150808105650.D758A81904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=313e45cd3b672db93fdba1cb654fb3c5dea8781a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                           |    1 +
 package/kodi-pvr-filmon/Config.in          |    8 ++++++++
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk |   13 +++++++++++++
 package/kodi/Config.in                     |    1 +
 4 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4118bbe..5af277d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -113,6 +113,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_ARGUSTV
 	select BR2_PACKAGE_KODI_PVR_DVBLINK
 	select BR2_PACKAGE_KODI_PVR_DVBVIEWER
+	select BR2_PACKAGE_KODI_PVR_FILMON
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
new file mode 100644
index 0000000..0b662df
--- /dev/null
+++ b/package/kodi-pvr-filmon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_FILMON
+	bool "kodi-pvr-filmon"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Filmon PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.filmon
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
new file mode 100644
index 0000000..76e4ca9
--- /dev/null
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-filmon
+#
+################################################################################
+
+KODI_PVR_FILMON_VERSION = 5c41f4e361c9bcdd6e53cffd541222c5aa131a27
+KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
+KODI_PVR_FILMON_LICENSE = GPLv2+
+KODI_PVR_FILMON_LICENSE_FILES = src/client.h
+KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b918563..efdc2e4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -261,6 +261,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
+	source "package/kodi-pvr-filmon/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
