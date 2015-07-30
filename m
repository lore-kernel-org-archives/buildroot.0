From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-argustv: new package
Message-ID: <20150730132258.5603E7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2579ec20e2ea9c77f24a497dc4febd8672bd1a7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - use a shorter file as the license file, client.h instead of client.cpp
 - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-argustv/Config.in           |    7 +++++++
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk |   13 +++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e52a813..734a5b5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -110,6 +110,7 @@ comment "Legacy options removed in 2015.08"
 config BR2_PACKAGE_KODI_PVR_ADDONS
 	bool "Kodi PVR addon was split"
 	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_PVR_ARGUSTV
 	help
 	  Kodi PVR addon was split into seperate modules
 
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
index 0000000..8fb5c89
--- /dev/null
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-argustv
+#
+################################################################################
+
+KODI_PVR_ARGUSTV_VERSION = 96c80267935d8edc4f6f92d16b540ef77cdcb1db
+KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
+KODI_PVR_ARGUSTV_LICENSE = GPLv2+
+KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
+KODI_PVR_ARGUSTV_DEPENDENCIES = jsoncpp kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e8a7608..33926d8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -258,6 +258,7 @@ endmenu
 
 menu "PVR addons"
 	source "package/kodi-addon-xvdr/Config.in"
+	source "package/kodi-pvr-argustv/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
