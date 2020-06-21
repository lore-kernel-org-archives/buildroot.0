From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:49 +0200
Subject: [Buildroot] [PATCH 06/23] package/kodi-pvr-dvblink: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.dvblink/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-dvblink/Config.in           | 1 +
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-dvblink/Config.in b/package/kodi-pvr-dvblink/Config.in
index 57f11271ec..a2ee7bf107 100644
--- a/package/kodi-pvr-dvblink/Config.in
+++ b/package/kodi-pvr-dvblink/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_DVBLINK
 	bool "kodi-pvr-dvblink"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi's DVBLink client addon
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 95bc7bbb4b..6d03342866 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -8,6 +8,6 @@ KODI_PVR_DVBLINK_VERSION = 4.7.2-Leia
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = debian/copyright
-KODI_PVR_DVBLINK_DEPENDENCIES = kodi-platform tinyxml2
+KODI_PVR_DVBLINK_DEPENDENCIES = kodi kodi-platform libplatform tinyxml2
 
 $(eval $(cmake-package))
-- 
2.26.2
