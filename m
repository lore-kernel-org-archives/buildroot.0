From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:37:53 +0200
Subject: [Buildroot] [PATCH 10/23] package/kodi-pvr-hts: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.hts/blob/Leia/CMakeLists.txt#L4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/Config.in       | 1 +
 package/kodi-pvr-hts/kodi-pvr-hts.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-hts/Config.in b/package/kodi-pvr-hts/Config.in
index c4c4497bd3..9cd3a2bfbb 100644
--- a/package/kodi-pvr-hts/Config.in
+++ b/package/kodi-pvr-hts/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_HTS
 	bool "kodi-pvr-hts"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Tvheadend HTSP PVR client addon for Kodi
 
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 6a25cda003..982f0e3de2 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -8,6 +8,6 @@ KODI_PVR_HTS_VERSION = 4.4.21-Leia
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = debian/copyright
-KODI_PVR_HTS_DEPENDENCIES = kodi-platform
+KODI_PVR_HTS_DEPENDENCIES = kodi kodi-platform libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
