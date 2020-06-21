From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:45 +0200
Subject: [Buildroot] [PATCH 02/23] package/kodi-platform: add explicit
 dependency to tinyxml
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tinyxml is built as a hard-dependency of Kodi already. For the case that
Kodi drops this dependency we need to make sure that this package still
finds its dependencies:
https://github.com/xbmc/kodi-platform/blob/master/CMakeLists.txt#L9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-platform/Config.in        | 1 +
 package/kodi-platform/kodi-platform.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-platform/Config.in b/package/kodi-platform/Config.in
index cde1925c07..7b4226a10d 100644
--- a/package/kodi-platform/Config.in
+++ b/package/kodi-platform/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_PLATFORM
 	bool
 	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_TINYXML
 	help
 	  Kodi add-on platform support library
 
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index f1b97e3259..aab1d0dbf0 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -9,6 +9,6 @@ KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPL-2.0+
 KODI_PLATFORM_LICENSE_FILES = debian/copyright
 KODI_PLATFORM_INSTALL_STAGING = YES
-KODI_PLATFORM_DEPENDENCIES = libplatform kodi
+KODI_PLATFORM_DEPENDENCIES = kodi libplatform tinyxml
 
 $(eval $(cmake-package))
-- 
2.26.2
