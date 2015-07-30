From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:37:45 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-vbox: new
	package
Message-ID: <20150808105651.2E2C881904@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=610a3701357da182bac9ca5baecae3ffcb75d1b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
   - use a shorter file as the license file, client.h instead of client.cpp
   - do not pass -DCMAKE_MODULE_PATH, no longer needed.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                       |    1 +
 package/kodi-pvr-vbox/Config.in        |    7 +++++++
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk |   13 +++++++++++++
 package/kodi/Config.in                 |    1 +
 4 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 718bf66..7880287 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -122,6 +122,7 @@ config BR2_PACKAGE_KODI_PVR_ADDONS
 	select BR2_PACKAGE_KODI_PVR_NJOY
 	select BR2_PACKAGE_KODI_PVR_PCTV
 	select BR2_PACKAGE_KODI_PVR_STALKER
+	select BR2_PACKAGE_KODI_PVR_VBOX
 	help
 	  Kodi PVR addon was split into seperate modules
 
diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
new file mode 100644
index 0000000..3a5f8c4
--- /dev/null
+++ b/package/kodi-pvr-vbox/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_VBOX
+	bool "kodi-pvr-vbox"
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi PVR addon for interfacing with VBox Communications XTi TV Gateway
+
+	  https://github.com/kodi-pvr/pvr.vbox
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
new file mode 100644
index 0000000..338c29a
--- /dev/null
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-vbox
+#
+################################################################################
+
+KODI_PVR_VBOX_VERSION = 874eb8812db1dd1b2626ed6c9f8391790f0e6818
+KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
+KODI_PVR_VBOX_LICENSE = GPLv2+
+KODI_PVR_VBOX_LICENSE_FILES = src/client.h
+KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 93c1423..0013870 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -270,6 +270,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
+	source "package/kodi-pvr-vbox/Config.in"
 endmenu
 
 endif # BR2_PACKAGE_KODI
