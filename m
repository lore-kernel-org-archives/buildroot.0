From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:51 +0200
Subject: [Buildroot] [PATCH 08/23] package/kodi-pvr-filmon: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.filmon/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-filmon/Config.in          | 1 +
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-filmon/Config.in b/package/kodi-pvr-filmon/Config.in
index 0b662df176..c0200182a4 100644
--- a/package/kodi-pvr-filmon/Config.in
+++ b/package/kodi-pvr-filmon/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_KODI_PVR_FILMON
 	bool "kodi-pvr-filmon"
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Filmon PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 078eae176a..c6bd683c54 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -8,6 +8,6 @@ KODI_PVR_FILMON_VERSION = 2.4.6-Leia
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = debian/copyright
-KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi-platform
+KODI_PVR_FILMON_DEPENDENCIES = jsoncpp kodi kodi-platform libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
