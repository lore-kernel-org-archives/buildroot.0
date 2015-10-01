From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Oct 2015 21:18:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-stalker: Needs jsoncpp
Message-ID: <1443727112-15603-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/56f/56fb98da27495f6a461bfdc7aa8c2de4d86dfdb8/
http://autobuild.buildroot.net/results/f98/f982b437935cf1f921559f5388fd4146eb9241bd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-stalker/Config.in           | 1 +
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-stalker/Config.in b/package/kodi-pvr-stalker/Config.in
index b327fd8..3ec530c 100644
--- a/package/kodi-pvr-stalker/Config.in
+++ b/package/kodi-pvr-stalker/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_STALKER
 	bool "kodi-pvr-stalker"
+	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  A PVR Client that connects Kodi to Stalker Middleware
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 589cf7d..c1baa8d 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -8,6 +8,6 @@ KODI_PVR_STALKER_VERSION = 5f6eb1992ffd45a075ebb7bc4253c4a88bf65c80
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPLv2+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
-KODI_PVR_STALKER_DEPENDENCIES = kodi-platform
+KODI_PVR_STALKER_DEPENDENCIES = jsoncpp kodi-platform
 
 $(eval $(cmake-package))
-- 
2.5.3
