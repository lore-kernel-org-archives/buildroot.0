From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 21 May 2014 09:25:41 +0200
Subject: [Buildroot] [PATCH] feh: bump to 2.12
Message-ID: <1400657141-13616-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

giblib is now part of feh, so drop giblib as dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/feh/Config.in | 2 +-
 package/feh/feh.mk    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/feh/Config.in b/package/feh/Config.in
index f85612e..19b4abe 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_FEH
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_IMLIB2_PNG
 	select BR2_PACKAGE_IMLIB2_JPEG
 	select BR2_PACKAGE_IMLIB2_X
-	select BR2_PACKAGE_GIBLIB
 	select BR2_PACKAGE_LIBCURL
 	help
 	  feh is an X11 image viewer aimed mostly at console users.
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index ddd4895..e63f89e 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FEH_VERSION = 2.10
+FEH_VERSION = 2.12
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
-FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
+FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
 
 define FEH_BUILD_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-- 
1.8.1.2
