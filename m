From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 12:38:02 +0200
Subject: [Buildroot] [PATCH 19/23] package/kodi-pvr-vbox: add explicit
 dependencies to libplatform and kodi
In-Reply-To: <20200621103806.616133-1-bernd.kuhls@t-online.de>
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
Message-ID: <20200621103806.616133-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libplatform and kodi are built as hard-dependencies of kodi-platform
already. For the case that kodi-platform drops one of these dependencies
we need to make sure that this package still finds its dependencies:
https://github.com/kodi-pvr/pvr.vbox/blob/Leia/CMakeLists.txt#L6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vbox/Config.in        | 1 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
index c1c22c10d1..fba5ba04d4 100644
--- a/package/kodi-pvr-vbox/Config.in
+++ b/package/kodi-pvr-vbox/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_VBOX
 	bool "kodi-pvr-vbox"
 	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  Kodi PVR addon for interfacing with VBox Communications XTi TV
 	  Gateway
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index b10bfc5b85..f91020b7e5 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -8,6 +8,6 @@ KODI_PVR_VBOX_VERSION = 4.7.0-Leia
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = debian/copyright
-KODI_PVR_VBOX_DEPENDENCIES = kodi-platform
+KODI_PVR_VBOX_DEPENDENCIES = kodi kodi-platform libplatform
 
 $(eval $(cmake-package))
-- 
2.26.2
