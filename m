From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu, 10 Apr 2008 01:17:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20080410081715.0C14D3C53C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-10 01:17:14 -0700 (Thu, 10 Apr 2008)
New Revision: 21690

Log:
* Fixed additional ncurses library install path


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2008-04-10 05:14:53 UTC (rev 21689)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2008-04-10 08:17:14 UTC (rev 21690)
@@ -105,13 +105,13 @@
 $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
 	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
 ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_PANEL)),y)
-	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/usr/lib/
 endif
 ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_FORM)),y)
-	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/usr/lib/
 endif
 ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_MENU)),y)
-	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/lib/
+	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/usr/lib/
 endif
 	ln -sf /usr/share/terminfo $(TARGET_DIR)/usr/lib/terminfo
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
