From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:38:03 +0200
Subject: [Buildroot] [PATCH 20/23] package/kodi-pvr-vdr-vnsi: fix
 dependencies
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed the dependency to kodi-platform:
https://github.com/kodi-pvr/pvr.vdr.vnsi/commit/7a19dc72df0a299887d08b27973de599dfc39f9e

Update dependencies according to
https://github.com/kodi-pvr/pvr.vdr.vnsi/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vdr-vnsi/Config.in            | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vdr-vnsi/Config.in b/package/kodi-pvr-vdr-vnsi/Config.in
index 768dec88fd..66c03109bd 100644
--- a/package/kodi-pvr-vdr-vnsi/Config.in
+++ b/package/kodi-pvr-vdr-vnsi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_VDR_VNSI
 	bool "kodi-pvr-vdr-vnsi"
-	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Kodi PVR addon VNSI
 
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index f467fa98f5..0084071fbf 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -8,6 +8,6 @@ KODI_PVR_VDR_VNSI_VERSION = 3.6.4-Leia
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = debian/copyright
-KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi-platform
+KODI_PVR_VDR_VNSI_DEPENDENCIES = kodi libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
