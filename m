From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 02:55:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_mixer
Message-ID: <20080717095531.E3D263C867@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 02:55:27 -0700 (Thu, 17 Jul 2008)
New Revision: 22856

Log:
sdl_mixer: fix sdl dependency

Modified:
   trunk/buildroot/package/sdl_mixer/Config.in
   trunk/buildroot/package/sdl_mixer/sdl_mixer.mk


Changeset:
Modified: trunk/buildroot/package/sdl_mixer/Config.in
===================================================================
--- trunk/buildroot/package/sdl_mixer/Config.in	2008-07-17 09:55:23 UTC (rev 22855)
+++ trunk/buildroot/package/sdl_mixer/Config.in	2008-07-17 09:55:27 UTC (rev 22856)
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_SDL_MIXER
 	bool "SDL_mixer"
 	default n
+	depends on BR2_PACKAGE_SDL
 	help
-
 	  SDL_mixer is a sample multi-channel audio mixer library.
 	  It supports any number of simultaneously playing channels of
 	  16 bit stereo audio, plus a single channel of music, mixed

Modified: trunk/buildroot/package/sdl_mixer/sdl_mixer.mk
===================================================================
--- trunk/buildroot/package/sdl_mixer/sdl_mixer.mk	2008-07-17 09:55:23 UTC (rev 22855)
+++ trunk/buildroot/package/sdl_mixer/sdl_mixer.mk	2008-07-17 09:55:27 UTC (rev 22856)
@@ -48,7 +48,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
 
-sdl_mixer: uclibc $(TARGET_DIR)/usr/lib/libSDL_mixer.so
+sdl_mixer: sdl uclibc $(TARGET_DIR)/usr/lib/libSDL_mixer.so
 
 sdl_mixer-clean:
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_mixer*.so*
