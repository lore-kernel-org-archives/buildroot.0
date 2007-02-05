From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon,  5 Feb 2007 11:24:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070205192430.D9AB248687@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-05 11:24:29 -0800 (Mon, 05 Feb 2007)
New Revision: 17781

Log:
Make certain the sqlite libs are actually installed in the target


Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-02-05 16:16:51 UTC (rev 17780)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-02-05 19:24:29 UTC (rev 17781)
@@ -58,7 +58,7 @@
 
 $(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
 	cp -a $(STAGING_DIR)/usr/bin/sqlite3 $(TARGET_DIR)/usr/bin
-	cp -a $(STAGING_DIR)/lib/libsqlite3.so* $(TARGET_DIR)/lib/
+	cp -a $(STAGING_DIR)/lib/libsqlite3*.so* $(TARGET_DIR)/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libsqlite3.so*
 
 sqlite:	uclibc readline-target ncurses $(TARGET_DIR)/usr/bin/sqlite3
