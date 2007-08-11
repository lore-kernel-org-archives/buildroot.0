From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:22:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/uemacs
Message-ID: <20070811232241.296F4A5D44@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:22:40 -0700 (Sat, 11 Aug 2007)
New Revision: 19447

Log:
Use ncurses instead of curses lib for uemacs

Modified:
   trunk/buildroot/package/uemacs/uemacs.mk


Changeset:
Modified: trunk/buildroot/package/uemacs/uemacs.mk
===================================================================
--- trunk/buildroot/package/uemacs/uemacs.mk	2007-08-11 23:09:34 UTC (rev 19446)
+++ trunk/buildroot/package/uemacs/uemacs.mk	2007-08-11 23:22:40 UTC (rev 19447)
@@ -23,13 +23,13 @@
 
 $(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
 	$(MAKE) -C $(UEMACS_DIR) \
-	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS=-lcurses
+	CC="$(TARGET_CC)" DEFINES="-DAUTOCONF -DPOSIX -DUSG" CFLAGS+="$(TARGET_CFLAGS) " LIBS=-lncurses
 	$(STRIP) $(UEMACS_DIR)/$(UEMACS_BINARY)
 
 $(TARGET_DIR)/$(UEMACS_TARGET_BINARY): $(UEMACS_DIR)/$(UEMACS_BINARY)
 	$(INSTALL) -m 0755 -D $(UEMACS_DIR)/$(UEMACS_BINARY) $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
 
-uemacs: uclibc $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
+uemacs: uclibc ncurses $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
 
 uemacs-clean:
 	rm -f $(TARGET_DIR)/$(UEMACS_TARGET_BINARY)
