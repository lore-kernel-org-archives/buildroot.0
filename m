From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit branch/next]
	package/kodi-pvr-mediaportal-tvserver: new package
Message-ID: <20150808105650.F027B8190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a571287d77e7afeb2b4d0e87e908e21f6185560f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - change <pkg>_LICENSE_FILES to a file that actually exists.
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    1 +
 package/kodi-pvr-mediaportal-tvserver/Config.in    |    7 +++++++
 .../kodi-pvr-mediaportal-tvserver.mk               |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index df50632..3f03ca0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -116,6 +116,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_FILMON
 	select BR2_PACKAGE_KODI_PVR_HTS
 	select BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
+	select BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
new file mode 100644
index 0000000..733ca88
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
+	bool "kodi-pvr-mediaportal-tvserver"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  MediaPortal TVServer PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.mediaportal.tvserver
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
new file mode 100644
index 0000000..bff00c7
--- /dev/null
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-mediaportal-tvserver
+#
+################################################################################
+
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 29809d10010a21b08b9e652e36bc51dac2171690
+KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPLv2+
+KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = src/client.h
+KODI_PVR_MEDIAPORTAL_TVSERVER_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8184b87..fc01b5b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -264,6 +264,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-filmon/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
+	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
