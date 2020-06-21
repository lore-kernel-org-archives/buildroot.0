From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:56 +0200
Subject: [Buildroot] [PATCH 13/23] package/kodi-pvr-mythtv: fix dependencies
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream updated dependencies:
https://github.com/janbar/pvr.mythtv/commit/ff2c90b027a98db57ccc051a11faf5c5536a8b5c

Please note that the previous dependency to kodi-platform was wrong
anyway, before the forementioned commit this package needed libplatform
which is a dependency of kodi-platform.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-mythtv/Config.in          | 1 -
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/Config.in b/package/kodi-pvr-mythtv/Config.in
index 798ff3e911..ebdbc00487 100644
--- a/package/kodi-pvr-mythtv/Config.in
+++ b/package/kodi-pvr-mythtv/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KODI_PVR_MYTHTV
 	bool "kodi-pvr-mythtv"
-	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  MythTV PVR for Kodi
 
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index ca1d533a57..44e5fd2a76 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -8,6 +8,6 @@ KODI_PVR_MYTHTV_VERSION = 5.10.16-Leia
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = debian/copyright
-KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
+KODI_PVR_MYTHTV_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.26.2
