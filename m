From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 14:47:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20070811214751.1B202A606F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 14:47:51 -0700 (Sat, 11 Aug 2007)
New Revision: 19439

Log:
Run $\(CONFIG_UPDATE\) in the unpack rules for sdl, Use $\(MAKE1\)

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-08-11 21:47:28 UTC (rev 19438)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-08-11 21:47:51 UTC (rev 19439)
@@ -17,6 +17,7 @@
 $(SDL_DIR)/.unpacked: $(DL_DIR)/$(SDL_SOURCE)
 	$(SDL_CAT) $(DL_DIR)/$(SDL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SDL_DIR) package/sdl sdl\*.patch
+	$(CONFIG_UPDATE) $(SDL_DIR)/build-scripts
 	touch $@
 
 $(SDL_DIR)/.configured: $(SDL_DIR)/.unpacked
@@ -46,7 +47,7 @@
 	touch $@
 
 $(SDL_DIR)/.compiled: $(SDL_DIR)/.configured
-	$(MAKE) -C $(SDL_DIR) 
+	$(MAKE1) -C $(SDL_DIR) 
 	touch $@
 
 $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
