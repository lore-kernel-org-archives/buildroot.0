From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-vdr-vnsi: new
	package
Message-ID: <20150808105651.37ED981904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7457d487151ebea5ff53ecebe9ffc08447f199f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                               |    1 +
 package/kodi-pvr-vdr-vnsi/Config.in            |    7 +++++++
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk |   13 +++++++++++++
 package/kodi/Config.in                         |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7880287..397b3ab 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -123,6 +123,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_PCTV
 	select BR2_PACKAGE_KODI_PVR_STALKER
 	select BR2_PACKAGE_KODI_PVR_VBOX
+	select BR2_PACKAGE_KODI_PVR_VDR_VNSI
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-vdr-vnsi/Config.in b/package/kodi-pvr-vdr-vnsi/Config.in
new file mode 100644
index 0000000..768dec8
--- /dev/null
+++ b/package/kodi-pvr-vdr-vnsi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VDR_VNSI
+	bool "kodi-pvr-vdr-vnsi"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi PVR addon VNSI
+
+	  https://github.com/kodi-pvr/pvr.vdr.vnsi
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
new file mode 100644
index 0000000..bc482eb
--- /dev/null
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-vdr-vnsi
+#
+################################################################################
+
+KODI_PVR_VDR_VNSI_VERSION = 550a4a2e093b4418394cdbe6f72cd7c76f0327b7
+KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
+KODI_PVR_VDR_VNSI_LICENSE = GPLv2+
+KODI_PVR_VDR_VNSI_LICENSE_FILES = src/client.h
+KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0013870..951532d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -271,6 +271,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-pctv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
+	source "package/kodi-pvr-vdr-vnsi/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
