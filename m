From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:16 +0100
Subject: [Buildroot] [PATCH/next 11/31] package/kodi: Remove dependency for
	BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 from sub packages
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi itself already depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7, there is
no need to duplicate this as reverse dependencies in sub options which
depend on Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/Config.in | 4 ----
 package/kodi-pvr-filmon/Config.in  | 4 ----
 package/kodi-pvr-pctv/Config.in    | 4 ----
 package/kodi-pvr-stalker/Config.in | 4 ----
 4 files changed, 16 deletions(-)

diff --git a/package/kodi-pvr-argustv/Config.in b/package/kodi-pvr-argustv/Config.in
index 247d83c..216000a 100644
--- a/package/kodi-pvr-argustv/Config.in
+++ b/package/kodi-pvr-argustv/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_ARGUSTV
 	bool "kodi-pvr-argustv"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Kodi's ARGUS TV client addon
 
 	  https://github.com/kodi-pvr/pvr.argustv
-
-comment "kodi-pvr-argustv needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
index 3d87ec8..0b662df 100644
--- a/package/kodi-pvr-filmon/Config.in
+++ b/package/kodi-pvr-filmon/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_FILMON
 	bool "kodi-pvr-filmon"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  Filmon PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.filmon
-
-comment "kodi-pvr-filmon needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-pctv/Config.in b/package/kodi-pvr-pctv/Config.in
index 1bef551..255cd4a 100644
--- a/package/kodi-pvr-pctv/Config.in
+++ b/package/kodi-pvr-pctv/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_PCTV
 	bool "kodi-pvr-pctv"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  PCTV PVR client addon for Kodi
 
 	  https://github.com/kodi-pvr/pvr.vdr.vnsi
-
-comment "kodi-pvr-pctv needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
index 26a8c3f..3ec530c 100644
--- a/package/kodi-pvr-stalker/Config.in
+++ b/package/kodi-pvr-stalker/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_KODI_PVR_STALKER
 	bool "kodi-pvr-stalker"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  A PVR Client that connects Kodi to Stalker Middleware
 
 	  https://github.com/kodi-pvr/pvr.stalker
-
-comment "kodi-pvr-stalker needs a toolchain w/ gcc >= 4.7"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.7.0
