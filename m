From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-pctv: new
	package
Message-ID: <20150808105651.1C1E58190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8776003db833ad9d878277b529d1b1a7d5f1c843
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                       |    1 +
 package/kodi-pvr-pctv/Config.in        |    8 ++++++++
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk |   13 +++++++++++++
 package/kodi/Config.in                 |    1 +
 4 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 05ac32a..9046650 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -120,6 +120,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_MYTHTV
 	select BR2_PACKAGE_KODI_PVR_NEXTPVR
 	select BR2_PACKAGE_KODI_PVR_NJOY
+	select BR2_PACKAGE_KODI_PVR_PCTV
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
new file mode 100644
index 0000000..255cd4a
--- /dev/null
+++ b/package/kodi-pvr-pctv/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PVR_PCTV
+	bool "kodi-pvr-pctv"
+	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  PCTV PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
new file mode 100644
index 0000000..4f3994a
--- /dev/null
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-pctv
+#
+################################################################################
+
+KODI_PVR_PCTV_VERSION = d23160c043b0cd0a86463f6a3590a8126ff8af9d
+KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
+KODI_PVR_PCTV_LICENSE = GPLv2+
+KODI_PVR_PCTV_LICENSE_FILES = src/client.h
+KODI_PVR_PCTV_DEPENDENCIES = jsoncpp kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 268e496..7c9709e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -268,6 +268,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-mythtv/Config.in"
 	source "package/kodi-pvr-nextpvr/Config.in"
 	source "package/kodi-pvr-njoy/Config.in"
+	source "package/kodi-pvr-pctv/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
