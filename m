From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-vuplus: new
	package
Message-ID: <20150808105651.3FD1481904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaf250c17628ef7c4c52ca0f67a2a93f4d0d9d3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                           |    1 +
 package/kodi-pvr-vuplus/Config.in          |    7 +++++++
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk |   13 +++++++++++++
 package/kodi/Config.in                     |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 397b3ab..9fd211e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -124,6 +124,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_STALKER
 	select BR2_PACKAGE_KODI_PVR_VBOX
 	select BR2_PACKAGE_KODI_PVR_VDR_VNSI
+	select BR2_PACKAGE_KODI_PVR_VUPLUS
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
new file mode 100644
index 0000000..a56c4ed
--- /dev/null
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VUPLUS
+	bool "kodi-pvr-vuplus"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  VuPlus PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.vuplus
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
new file mode 100644
index 0000000..82569fd
--- /dev/null
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-vuplus
+#
+################################################################################
+
+KODI_PVR_VUPLUS_VERSION = 96115e9b8898ed6bde36874b43b2fba531cfef5c
+KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
+KODI_PVR_VUPLUS_LICENSE = GPLv2+
+KODI_PVR_VUPLUS_LICENSE_FILES = src/client.h
+KODI_PVR_VUPLUS_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 951532d..79e7e60 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -272,6 +272,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
+	source "package/kodi-pvr-vuplus/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
