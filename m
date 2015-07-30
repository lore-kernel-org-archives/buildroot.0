From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: new package
Message-ID: <20150730132258.941907FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afb2f155a1ff77b68736ba2eb23d8f89898a01fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                           |    1 +
 package/kodi-pvr-mythtv/Config.in          |    7 +++++++
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk |   13 +++++++++++++
 package/kodi/Config.in                     |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3f03ca0..28aaf7d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -117,6 +117,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_HTS
 	select BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	select BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
+	select BR2_PACKAGE_KODI_PVR_MYTHTV
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-mythtv/Config.in b/package/kodi-pvr-mythtv/Config.in
new file mode 100644
index 0000000..798ff3e
--- /dev/null
+++ b/package/kodi-pvr-mythtv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_MYTHTV
+	bool "kodi-pvr-mythtv"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  MythTV PVR for Kodi
+
+	  https://github.com/kodi-pvr/pvr.mythtv
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
new file mode 100644
index 0000000..c26224a
--- /dev/null
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-mythtv
+#
+################################################################################
+
+KODI_PVR_MYTHTV_VERSION = 75fee97e2e690b0ee6d2b1540218b61586683e20
+KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
+KODI_PVR_MYTHTV_LICENSE = GPLv2+
+KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
+KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fc01b5b..e9fd2b7 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -265,6 +265,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-hts/Config.in"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
+	source "package/kodi-pvr-mythtv/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
