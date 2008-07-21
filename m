From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 21 Jul 2008 01:53:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_mixer
Message-ID: <20080721085319.D347B3C8DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-21 01:53:18 -0700 (Mon, 21 Jul 2008)
New Revision: 22896

Log:
sdl_mixer: run CONFIG_UPDATE on correct directory

The Makefile tried to update config.guess and config.sub in the wrong
directories, this patch updates the correct scripts making it possible to
compile on new systems.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

Modified:
   trunk/buildroot/package/sdl_mixer/sdl_mixer.mk


Changeset:
Modified: trunk/buildroot/package/sdl_mixer/sdl_mixer.mk
===================================================================
--- trunk/buildroot/package/sdl_mixer/sdl_mixer.mk	2008-07-21 08:37:13 UTC (rev 22895)
+++ trunk/buildroot/package/sdl_mixer/sdl_mixer.mk	2008-07-21 08:53:18 UTC (rev 22896)
@@ -16,7 +16,7 @@
 
 $(SDL_MIXER_DIR)/.unpacked: $(DL_DIR)/$(SDL_MIXER_SOURCE)
 	$(SDL_MIXER_CAT) $(DL_DIR)/$(SDL_MIXER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SDL_MIXER_DIR)
+	$(CONFIG_UPDATE) $(SDL_MIXER_DIR)/build-scripts
 	touch $@
 
 $(SDL_MIXER_DIR)/.configured: $(SDL_MIXER_DIR)/.unpacked $(STAGING_DIR)/usr/lib/libSDL.so
