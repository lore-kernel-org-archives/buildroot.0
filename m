From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-njoy: new package
Message-ID: <20150730132258.A73C17FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=805e9c15398a5228502a377bae4ac09e8cb11ec2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                       |    1 +
 package/kodi-pvr-njoy/Config.in        |    7 +++++++
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk |   13 +++++++++++++
 package/kodi/Config.in                 |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 56a82f9..05ac32a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -119,6 +119,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	select BR2_PACKAGE_KODI_PVR_MYTHTV
 	select BR2_PACKAGE_KODI_PVR_NEXTPVR
+	select BR2_PACKAGE_KODI_PVR_NJOY
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-njoy/Config.in b/package/kodi-pvr-njoy/Config.in
new file mode 100644
index 0000000..33c493c
--- /dev/null
+++ b/package/kodi-pvr-njoy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_NJOY
+	bool "kodi-pvr-njoy"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's Njoy N7 client addon
+
+	  https://github.com/kodi-pvr/pvr.njoy
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
new file mode 100644
index 0000000..cbc04d5
--- /dev/null
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-njoy
+#
+################################################################################
+
+KODI_PVR_NJOY_VERSION = 4f88a097cb62b4604ffb0ac293a5dc8f40885e79
+KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
+KODI_PVR_NJOY_LICENSE = GPLv2+
+KODI_PVR_NJOY_LICENSE_FILES = src/client.h
+KODI_PVR_NJOY_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 052f33f..268e496 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -267,6 +267,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 	source "package/kodi-pvr-mythtv/Config.in"
 	source "package/kodi-pvr-nextpvr/Config.in"
+	source "package/kodi-pvr-njoy/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
