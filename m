From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:38:05 +0200
Subject: [Buildroot] [PATCH 22/23] package/kodi-pvr-wmc: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.wmc/blob/Leia/CMakeLists.txt#L4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-wmc/Config.in       | 1 +
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-wmc/Config.in b/package/kodi-pvr-wmc/Config.in
index 2672c83434..b06bcf58f0 100644
--- a/package/kodi-pvr-wmc/Config.in
+++ b/package/kodi-pvr-wmc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_WMC
 	bool "kodi-pvr-wmc"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Kodi's Windows Media Center client addon
 
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index c280f89df4..37eb289da8 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -8,6 +8,6 @@ KODI_PVR_WMC_VERSION = 2.4.6-Leia
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = debian/copyright
-KODI_PVR_WMC_DEPENDENCIES = kodi-platform
+KODI_PVR_WMC_DEPENDENCIES = kodi kodi-platform libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
