From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-hts: new package
Message-ID: <20150730132258.795177FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6940d66abfb0c61d2ac787d0e46f6964543fb2f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use a shorter file as the license file, client.h
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                     |    1 +
 package/kodi-pvr-hts/Config.in       |    7 +++++++
 package/kodi-pvr-hts/kodi-pvr-hts.mk |   13 +++++++++++++
 package/kodi/Config.in               |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5af277d..96f7d7f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -114,6 +114,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_DVBLINK
 	select BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	select BR2_PACKAGE_KODI_PVR_FILMON
+	select BR2_PACKAGE_KODI_PVR_HTS
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-hts/Config.in b/package/kodi-pvr-hts/Config.in
new file mode 100644
index 0000000..c4c4497
--- /dev/null
+++ b/package/kodi-pvr-hts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_HTS
+	bool "kodi-pvr-hts"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Tvheadend HTSP PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.hts
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
new file mode 100644
index 0000000..05ce503
--- /dev/null
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-hts
+#
+################################################################################
+
+KODI_PVR_HTS_VERSION = 5c2244044a00ecd3320fc6ce15dd208c16578588
+KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
+KODI_PVR_HTS_LICENSE = GPLv2+
+KODI_PVR_HTS_LICENSE_FILES = src/client.h
+KODI_PVR_HTS_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index efdc2e4..251b723 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -262,6 +262,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvblink/Config.in"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
+	source "package/kodi-pvr-hts/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
