From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 02:55:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_ttf
Message-ID: <20080717095523.CD3673C84C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 02:55:23 -0700 (Thu, 17 Jul 2008)
New Revision: 22855

Log:
sdl_ttf: fix sdl dependency

Patch by artemys - Closes #4164.

Modified:
   trunk/buildroot/package/sdl_ttf/Config.in
   trunk/buildroot/package/sdl_ttf/sdl_ttf.mk


Changeset:
Modified: trunk/buildroot/package/sdl_ttf/Config.in
===================================================================
--- trunk/buildroot/package/sdl_ttf/Config.in	2008-07-17 09:17:51 UTC (rev 22854)
+++ trunk/buildroot/package/sdl_ttf/Config.in	2008-07-17 09:55:23 UTC (rev 22855)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
+	depends on BR2_PACKAGE_SDL
 	default n
 	select BR2_PACKAGE_FREETYPE
 	help

Modified: trunk/buildroot/package/sdl_ttf/sdl_ttf.mk
===================================================================
--- trunk/buildroot/package/sdl_ttf/sdl_ttf.mk	2008-07-17 09:17:51 UTC (rev 22854)
+++ trunk/buildroot/package/sdl_ttf/sdl_ttf.mk	2008-07-17 09:55:23 UTC (rev 22855)
@@ -60,7 +60,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_ttf*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
-SDL sdl_ttf: uclibc $(TARGET_DIR)/usr/lib/libSDL_ttf.so
+sdl_ttf: uclibc sdl $(TARGET_DIR)/usr/lib/libSDL_ttf.so
 
 sdl_ttf-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(SDL_TTF_DIR) uninstall
