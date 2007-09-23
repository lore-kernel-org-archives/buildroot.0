From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 02:53:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20070923095343.CEBA230077@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 02:53:43 -0700 (Sun, 23 Sep 2007)
New Revision: 19957

Log:
Use correct library path for SDL

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-09-23 09:53:12 UTC (rev 19956)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-09-23 09:53:43 UTC (rev 19957)
@@ -55,7 +55,7 @@
 $(SDL_DIR)/.compiled: $(SDL_DIR)/.configured $(STAGING_DIR)/include/directfb
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		INCLUDE="-I./include -I$(STAGING_DIR)/usr/include/directfb" \
-		LDFLAGS=-L$(STAGING_DIR)/usr \
+		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR)
 	touch $@
 
