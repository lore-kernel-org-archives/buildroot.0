From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  7 Mar 2007 06:46:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070307144649.6BDC148564@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-07 06:46:47 -0800 (Wed, 07 Mar 2007)
New Revision: 18024

Log:
- copy ncurses_dll.h to the target. Fixes a compilation problem seen by Thomas Lundquist


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-03-07 14:32:22 UTC (rev 18023)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-03-07 14:46:47 UTC (rev 18024)
@@ -117,6 +117,7 @@
 $(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
 	-mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/ncurses.h
+	cp -dpf $(NCURSES_DIR)/include/ncurses_dll.h $(TARGET_DIR)/usr/include/ncurses_dll.h
 	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
