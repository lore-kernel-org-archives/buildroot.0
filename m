From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-wmc: new
	package
Message-ID: <20150808105651.4870A81904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=967a4e9a20a849f411d5bde0ece0d47c57f67250
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                     |    1 +
 package/kodi-pvr-wmc/Config.in       |    7 +++++++
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk |   13 +++++++++++++
 package/kodi/Config.in               |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9fd211e..3b77b34 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -125,6 +125,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_VBOX
 	select BR2_PACKAGE_KODI_PVR_VDR_VNSI
 	select BR2_PACKAGE_KODI_PVR_VUPLUS
+	select BR2_PACKAGE_KODI_PVR_WMC
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-wmc/Config.in b/package/kodi-pvr-wmc/Config.in
new file mode 100644
index 0000000..2672c83
--- /dev/null
+++ b/package/kodi-pvr-wmc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_WMC
+	bool "kodi-pvr-wmc"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi's Windows Media Center client addon
+
+	  https://github.com/kodi-pvr/pvr.wmc
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
new file mode 100644
index 0000000..fc385f9
--- /dev/null
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-wmc
+#
+################################################################################
+
+KODI_PVR_WMC_VERSION = e19c3e99c87e81d406bac0bc4e8edeb47df66dcc
+KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
+KODI_PVR_WMC_LICENSE = GPLv2+
+KODI_PVR_WMC_LICENSE_FILES = src/client.h
+KODI_PVR_WMC_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 79e7e60..6b1b9f3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -273,6 +273,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
 	source "package/kodi-pvr-vuplus/Config.in"
+	source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
