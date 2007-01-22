From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 22 Jan 2007 15:52:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070122235208.4D4824857B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-22 15:52:06 -0800 (Mon, 22 Jan 2007)
New Revision: 17483

Log:
fix symlink


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-01-22 23:39:08 UTC (rev 17482)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-01-22 23:52:06 UTC (rev 17483)
@@ -121,7 +121,7 @@
 	cp -dpf $(NCURSES_DIR)/include/termcap.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.a $(TARGET_DIR)/usr/lib/
 	rm -f $(TARGET_DIR)/usr/lib/terminfo
-	(cd $(TARGET_DIR)/usr/lib; ln -fs /usr/share/terminfo)
+	(cd $(TARGET_DIR)/usr/lib; ln -fs ../share/terminfo)
 	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.a libcurses.a)
 	(cd $(TARGET_DIR)/usr/lib; ln -fs libncurses.a libtermcap.a)
 	(cd $(TARGET_DIR)/usr/include; ln -fs ncurses.h curses.h)
