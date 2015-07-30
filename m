From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-nextpvr: new
	package
Message-ID: <20150808105651.0C6588190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0757c7d39db8b5d8a236251f98ab1f4bf16762f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                             |    1 +
 package/kodi-pvr-nextpvr/Config.in           |    7 +++++++
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk |   13 +++++++++++++
 package/kodi/Config.in                       |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 28aaf7d..56a82f9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -118,6 +118,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	select BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	select BR2_PACKAGE_KODI_PVR_MYTHTV
+	select BR2_PACKAGE_KODI_PVR_NEXTPVR
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-nextpvr/Config.in b/package/kodi-pvr-nextpvr/Config.in
new file mode 100644
index 0000000..e520426
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_NEXTPVR
+	bool "kodi-pvr-nextpvr"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's NextPVR client addon
+
+	  https://github.com/kodi-pvr/pvr.nextpvr
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
new file mode 100644
index 0000000..4ec0d80
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-nextpvr
+#
+################################################################################
+
+KODI_PVR_NEXTPVR_VERSION = 3a205e49b50baba605d3235f6613fdd36c1d3234
+KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
+KODI_PVR_NEXTPVR_LICENSE = GPLv2+
+KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
+KODI_PVR_NEXTPVR_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e9fd2b7..052f33f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -266,6 +266,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-iptvsimple/Config.in"
 	source "package/kodi-pvr-mediaportal-tvserver/Config.in"
 	source "package/kodi-pvr-mythtv/Config.in"
+	source "package/kodi-pvr-nextpvr/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
