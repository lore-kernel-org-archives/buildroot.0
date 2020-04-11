From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2020 18:10:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-vuplus: needs gcc >= 4.9
Message-ID: <20200411161010.1926291-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vuplus/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi-pvr-vuplus/Config.in b/package/kodi-pvr-vuplus/Config.in
index 96320f6fcb..b6a03e843f 100644
--- a/package/kodi-pvr-vuplus/Config.in
+++ b/package/kodi-pvr-vuplus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_VUPLUS
 	bool "kodi-pvr-vuplus"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	select BR2_PACKAGE_TINYXML
@@ -7,3 +8,6 @@ config BR2_PACKAGE_KODI_PVR_VUPLUS
 	  VuPlus PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.vuplus
+
+comment "kodi-pvr-vuplus needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.25.0
