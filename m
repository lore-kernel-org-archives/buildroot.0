From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 May 2017 13:32:04 +0200
Subject: [Buildroot] [PATCH 2/3] package/kodi-peripheral-steamcontroller:
	new package
In-Reply-To: <20170507113205.1861-1-bernd.kuhls@t-online.de>
References: <20170507113205.1861-1-bernd.kuhls@t-online.de>
Message-ID: <20170507113205.1861-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-peripheral-steamcontroller/Config.in           |  8 ++++++++
 .../kodi-peripheral-steamcontroller.hash                    |  2 ++
 .../kodi-peripheral-steamcontroller.mk                      | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 24 insertions(+)
 create mode 100644 package/kodi-peripheral-steamcontroller/Config.in
 create mode 100644 package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
 create mode 100644 package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk

diff --git a/package/kodi-peripheral-steamcontroller/Config.in b/package/kodi-peripheral-steamcontroller/Config.in
new file mode 100644
index 0000000000..a994f4c9fb
--- /dev/null
+++ b/package/kodi-peripheral-steamcontroller/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_PERIPHERAL_STEAMCONTROLLER
+	bool "kodi-peripheral-steamcontroller"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Steam controller driver for Kodi
+
+	  https://github.com/kodi-game/peripheral.steamcontroller
diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
new file mode 100644
index 0000000000..c0b3bf6e22
--- /dev/null
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d5547b78ba84c9743c884a9377c398b540bfcf23e467e1edf8be2625d400c205  kodi-peripheral-steamcontroller-ef527cd81cfcd6c8342691f5c764e5c51df1fca2.tar.gz
diff --git a/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
new file mode 100644
index 0000000000..98cccc8520
--- /dev/null
+++ b/package/kodi-peripheral-steamcontroller/kodi-peripheral-steamcontroller.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-peripheral-steamcontroller
+#
+################################################################################
+
+KODI_PERIPHERAL_STEAMCONTROLLER_VERSION = ef527cd81cfcd6c8342691f5c764e5c51df1fca2
+KODI_PERIPHERAL_STEAMCONTROLLER_SITE = $(call github,kodi-game,peripheral.steamcontroller,$(KODI_PERIPHERAL_STEAMCONTROLLER_VERSION))
+KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE = GPL-2.0+
+KODI_PERIPHERAL_STEAMCONTROLLER_LICENSE_FILES = src/addon.cpp
+KODI_PERIPHERAL_STEAMCONTROLLER_DEPENDENCIES = kodi-platform libusb
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 3f0cac684d..aac4b4463d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -301,6 +301,7 @@ endmenu
 
 menu "Peripheral addons"
 	source "package/kodi-peripheral-joystick/Config.in"
+	source "package/kodi-peripheral-steamcontroller/Config.in"
 endmenu
 
 menu "PVR addons"
-- 
2.11.0
