From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:15 +0200
Subject: [Buildroot] [PATCH v6 14/25] package/kodi-peripheral-joystick: bump
 version
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed dependency to kodi-platform
https://github.com/xbmc/peripheral.joystick/commit/a9489ea0f08bbf04affb798857439540478ff90d

Added dependency to tinyxml
https://github.com/xbmc/peripheral.joystick/commit/471aa27d6c8ff9c9d0ac50c1b32f1504840194b5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-peripheral-joystick/Config.in                | 2 +-
 .../kodi-peripheral-joystick.hash                         | 2 +-
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.mk  | 8 +++-----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/kodi-peripheral-joystick/Config.in b/package/kodi-peripheral-joystick/Config.in
index f257710a88..d93e71b607 100644
--- a/package/kodi-peripheral-joystick/Config.in
+++ b/package/kodi-peripheral-joystick/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KODI_PERIPHERAL_JOYSTICK
 	bool "kodi-peripheral-joystick"
 	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  Kodi joystick support (drivers and button maps)
 
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 5a7348d414..d863de0288 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9a183e1f92ff2c68816bfa0056c65585a3e1129d924326359d7a5dfbcba6c56a  kodi-peripheral-joystick-1.3.4.tar.gz
+sha256 45664b515c44d5fe5cc6cf5c7cb0f5ca239b5e68c9a88f047e236beb5cae0449  kodi-peripheral-joystick-7611722a4921b66674a41c3f5322ff0a54246b71.tar.gz
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 13c33fc0af..b8178b7ca9 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PERIPHERAL_JOYSTICK_VERSION = 1.3.4
-KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,v$(KODI_PERIPHERAL_JOYSTICK_VERSION))
+KODI_PERIPHERAL_JOYSTICK_VERSION = 7611722a4921b66674a41c3f5322ff0a54246b71
+KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = src/addon.cpp
-KODI_PERIPHERAL_JOYSTICK_DEPENDENCIES = kodi-platform udev
+KODI_PERIPHERAL_JOYSTICK_DEPENDENCIES = kodi tinyxml udev
 
 $(eval $(cmake-package))
-- 
2.20.1
