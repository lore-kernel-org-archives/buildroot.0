From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sun, 11 Jan 2009 13:33:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20090111133317.5CD5E76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2009-01-11 13:33:13 +0000 (Sun, 11 Jan 2009)
New Revision: 24749

Log:
For some reason we ended up with a link-loop. This does not.


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2009-01-10 21:03:00 UTC (rev 24748)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2009-01-11 13:33:13 UTC (rev 24749)
@@ -132,7 +132,7 @@
 
 $(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
 	mkdir -p $(TARGET_DIR)/usr/include
-	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/ncurses.h
+	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/curses.h
 	cp -dpf $(NCURSES_DIR)/include/ncurses_dll.h $(TARGET_DIR)/usr/include/ncurses_dll.h
 	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
@@ -142,7 +142,7 @@
 	 ln -fs libncurses.a libcurses.a; \
 	 ln -fs libncurses.a libtermcap.a; \
 	)
-	(cd $(TARGET_DIR)/usr/include; ln -fs ncurses.h curses.h)
+	(cd $(TARGET_DIR)/usr/include; ln -fs curses.h ncurses.h)
 	rm -f $(TARGET_DIR)/lib/libncurses.so
 	(cd $(TARGET_DIR)/usr/lib; ln -fs ../../lib/libncurses.so.$(NCURSES_VERSION) libncurses.so)
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
