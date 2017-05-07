From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 May 2017 13:32:05 +0200
Subject: [Buildroot] [PATCH 3/3] package/kodi-peripheral-xarcade: new package
In-Reply-To: <20170507113205.1861-1-bernd.kuhls@t-online.de>
References: <20170507113205.1861-1-bernd.kuhls@t-online.de>
Message-ID: <20170507113205.1861-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-peripheral-xarcade/Config.in                   |  6 ++++++
 .../kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash    |  2 ++
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk  | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 22 insertions(+)
 create mode 100644 package/kodi-peripheral-xarcade/Config.in
 create mode 100644 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
 create mode 100644 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk

diff --git a/package/kodi-peripheral-xarcade/Config.in b/package/kodi-peripheral-xarcade/Config.in
new file mode 100644
index 0000000000..8d3c678523
--- /dev/null
+++ b/package/kodi-peripheral-xarcade/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_PERIPHERAL_XARCADE
+	bool "kodi-peripheral-xarcade"
+	help
+	  X-Arcade Tankstick support for Kodi
+
+	  https://github.com/kodi-game/peripheral.xarcade
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
new file mode 100644
index 0000000000..48dc5a0415
--- /dev/null
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 cd503e7f1413214693c28b59f19f3fffe0a54cff5c29d43b2eca9bb31c10edeb  kodi-peripheral-xarcade-f1875ba4b7aa6ce85ec40fedf48ed5501c79e5fd.tar.gz
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
new file mode 100644
index 0000000000..c4ddba3eb5
--- /dev/null
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-peripheral-xarcade
+#
+################################################################################
+
+KODI_PERIPHERAL_XARCADE_VERSION = f1875ba4b7aa6ce85ec40fedf48ed5501c79e5fd
+KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
+KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
+KODI_PERIPHERAL_XARCADE_LICENSE_FILES = src/addon.cpp
+KODI_PERIPHERAL_XARCADE_DEPENDENCIES = kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index aac4b4463d..79512170fb 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -302,6 +302,7 @@ endmenu
 menu "Peripheral addons"
 	source "package/kodi-peripheral-joystick/Config.in"
 	source "package/kodi-peripheral-steamcontroller/Config.in"
+	source "package/kodi-peripheral-xarcade/Config.in"
 endmenu
 
 menu "PVR addons"
-- 
2.11.0
