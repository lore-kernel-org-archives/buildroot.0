From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 09:56:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070625165614.07BD5A45A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 09:56:11 -0700 (Mon, 25 Jun 2007)
New Revision: 18933

Log:
- account for now optional archive


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-06-25 16:35:23 UTC (rev 18932)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-06-25 16:56:11 UTC (rev 18933)
@@ -83,7 +83,7 @@
 	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(NCURSES_DIR) \
 		libs panel menu form headers
 
-$(STAGING_DIR)/usr/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VER)
+$(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VER): $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VER)
 	$(MAKE1) \
 	    prefix=$(STAGING_DIR)/usr/ \
 	    exec_prefix=$(STAGING_DIR) \
@@ -103,7 +103,7 @@
 	chmod a-x $(NCURSES_DIR)/lib/libncurses.so*
 	touch -c $@
 
-$(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER): $(STAGING_DIR)/usr/lib/libncurses.a
+$(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VER)
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
 	-cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
