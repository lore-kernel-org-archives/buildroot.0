From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 16 Nov 2007 07:35:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20071116153514.E4EDB30040@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-16 07:35:14 -0800 (Fri, 16 Nov 2007)
New Revision: 20440

Log:
correct paths in sdl-config

Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-11-16 15:33:46 UTC (rev 20439)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-11-16 15:35:14 UTC (rev 20440)
@@ -94,6 +94,11 @@
 
 $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR) install
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
+		-e "s,-I/include/SDL,-I\'$(STAGING_DIR)/include/SDL\',g" \
+		$(STAGING_DIR)/usr/bin/sdl-config
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libSDL.so: $(STAGING_DIR)/usr/lib/libSDL.so
