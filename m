From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:44 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-iptvsimple:
	new package
Message-ID: <20150808105650.E7B4F8190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c326ff83af1feabb84a2c50fdbe5c026d6e7664
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    1 +
 package/kodi-pvr-iptvsimple/Config.in              |    7 +++++++
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk |   13 +++++++++++++
 package/kodi/Config.in                             |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 96f7d7f..df50632 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -115,6 +115,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_DVBVIEWER
 	select BR2_PACKAGE_KODI_PVR_FILMON
 	select BR2_PACKAGE_KODI_PVR_HTS
+	select BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-iptvsimple/Config.in b/package/kodi-pvr-iptvsimple/Config.in
new file mode 100644
index 0000000..b596749
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_IPTVSIMPLE
+	bool "kodi-pvr-iptvsimple"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  IPTV Live TV and Radio PVR client addon for Kodi
+
+	  https://github.com/kodi-pvr/pvr.iptvsimple
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
new file mode 100644
index 0000000..4d5b9e9
--- /dev/null
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-iptvsimple
+#
+################################################################################
+
+KODI_PVR_IPTVSIMPLE_VERSION = 23defebace9a596d549a688c1d017900aeaf7761
+KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
+KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
+KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
+KODI_PVR_IPTVSIMPLE_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 251b723..8184b87 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -263,6 +263,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-dvbviewer/Config.in"
 	source "package/kodi-pvr-filmon/Config.in"
 	source "package/kodi-pvr-hts/Config.in"
+	source "package/kodi-pvr-iptvsimple/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
