From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-stalker: new package
Message-ID: <20150730132258.BC0837FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70cf949fb096ae1d77f88416dda9dd9161dbc10b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-stalker/Config.in           |    7 +++++++
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk |   13 +++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9046650..718bf66 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -121,6 +121,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_NEXTPVR
 	select BR2_PACKAGE_KODI_PVR_NJOY
 	select BR2_PACKAGE_KODI_PVR_PCTV
+	select BR2_PACKAGE_KODI_PVR_STALKER
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
new file mode 100644
index 0000000..b327fd8
--- /dev/null
+++ b/package/kodi-pvr-stalker/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_STALKER
+	bool "kodi-pvr-stalker"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  A PVR Client that connects Kodi to Stalker Middleware
+
+	  https://github.com/kodi-pvr/pvr.stalker
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
new file mode 100644
index 0000000..589cf7d
--- /dev/null
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-stalker
+#
+################################################################################
+
+KODI_PVR_STALKER_VERSION = 5f6eb1992ffd45a075ebb7bc4253c4a88bf65c80
+KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
+KODI_PVR_STALKER_LICENSE = GPLv2+
+KODI_PVR_STALKER_LICENSE_FILES = src/client.h
+KODI_PVR_STALKER_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 7c9709e..93c1423 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -269,6 +269,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-nextpvr/Config.in"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
+	source "package/kodi-pvr-stalker/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
