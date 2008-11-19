From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 19 Nov 2008 02:44:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_ttf
Message-ID: <20081119104425.0044D3C838@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-19 02:44:24 -0800 (Wed, 19 Nov 2008)
New Revision: 24099

Log:
sdl_ttf: provide path to freetype includes

closes #6374.

Modified:
   trunk/buildroot/package/sdl_ttf/sdl_ttf.mk


Changeset:
Modified: trunk/buildroot/package/sdl_ttf/sdl_ttf.mk
===================================================================
--- trunk/buildroot/package/sdl_ttf/sdl_ttf.mk	2008-11-19 10:16:40 UTC (rev 24098)
+++ trunk/buildroot/package/sdl_ttf/sdl_ttf.mk	2008-11-19 10:44:24 UTC (rev 24099)
@@ -47,7 +47,7 @@
 
 $(SDL_TTF_DIR)/.compiled: $(SDL_TTF_DIR)/.configured
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
-		INCLUDE="-I$(STAGING_DIR)/usr/include/SDL" \
+		INCLUDES="-I$(STAGING_DIR)/usr/include/SDL -I$(STAGING_DIR)/usr/include/freetype2" \
 		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 		DESTDIR=$(STAGING_DIR)/usr -C $(SDL_TTF_DIR)
 	touch $@
