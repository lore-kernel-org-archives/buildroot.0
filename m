From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2020 16:32:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-vuplus: remove tinyxml
 dependency
Message-ID: <20200614143232.2773755-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package kodi-platform depends on kodi
https://github.com/xbmc/kodi-platform/blob/master/CMakeLists.txt#L8

which in turn depends on tinyxml
https://github.com/xbmc/xbmc/blob/Leia/CMakeLists.txt#L136

so we do not need to explicitly depend on tinyxml here.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/Config.in          | 1 -
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index b6a03e843f..4989b1c77c 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_KODI_PVR_VUPLUS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_KODI_PLATFORM
-	select BR2_PACKAGE_TINYXML
 	help
 	  VuPlus PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index bf1de1178d..32b6d939af 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -8,6 +8,6 @@ KODI_PVR_VUPLUS_VERSION = 3.28.9-Leia
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = debian/copyright
-KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform tinyxml
+KODI_PVR_VUPLUS_DEPENDENCIES = json-for-modern-cpp kodi-platform
 
 $(eval $(cmake-package))
-- 
2.26.2
