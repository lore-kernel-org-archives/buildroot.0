From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 23 Jan 2009 23:02:17 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20090123230218.44A1376564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-23 23:02:15 +0000 (Fri, 23 Jan 2009)
New Revision: 24992

Log:
Fix static lib dep for ncurses

Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2009-01-23 21:06:05 UTC (rev 24991)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2009-01-23 23:02:15 UTC (rev 24992)
@@ -130,7 +130,9 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
+$(NCURSES_DIR)/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
+
+$(TARGET_DIR)/usr/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.a
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/curses.h
 	cp -dpf $(NCURSES_DIR)/include/ncurses_dll.h $(TARGET_DIR)/usr/include/ncurses_dll.h
