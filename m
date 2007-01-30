From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 30 Jan 2007 09:47:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070130174704.74D91485CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-30 09:47:03 -0800 (Tue, 30 Jan 2007)
New Revision: 17677

Log:
- explicitely pass the configured $(DISABLE_LFS) in. Also set --disable-big-core


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-01-30 17:45:30 UTC (rev 17676)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-01-30 17:47:03 UTC (rev 17677)
@@ -65,7 +65,8 @@
 		--with-terminfo-dirs=/usr/share/terminfo \
 		--with-default-terminfo-dir=/usr/share/terminfo \
 		--with-shared --without-cxx --without-cxx-binding \
-		--without-ada --without-progs $(DISABLE_NLS) \
+		--without-ada --without-progs --disable-big-core \
+		$(DISABLE_NLS) $(DISABLE_LARGEFILE) \
 		--without-profile --without-debug --disable-rpath \
 		--enable-echo --enable-const --enable-overwrite \
 		--enable-broken_linker \
@@ -114,7 +115,7 @@
 	touch -c $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER)
 
 $(TARGET_DIR)/usr/lib/libncurses.a: $(STAGING_DIR)/lib/libncurses.a
-	mkdir -p $(TARGET_DIR)/usr/include
+	-mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(NCURSES_DIR)/include/curses.h $(TARGET_DIR)/usr/include/ncurses.h
 	cp -dpf $(NCURSES_DIR)/include/term.h $(TARGET_DIR)/usr/include/
 	cp -dpf $(NCURSES_DIR)/include/unctrl.h $(TARGET_DIR)/usr/include/
