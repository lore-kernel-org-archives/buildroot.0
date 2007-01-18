From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 18 Jan 2007 08:23:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070118162354.CBA484856C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-18 08:23:53 -0800 (Thu, 18 Jan 2007)
New Revision: 17366

Log:
sqlite installs into /usr/bin

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-01-18 15:42:00 UTC (rev 17365)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-01-18 16:23:53 UTC (rev 17366)
@@ -53,11 +53,11 @@
 $(SQLITE_DIR)/sqlite3: $(SQLITE_DIR)/.configured
 	$(MAKE) -C $(SQLITE_DIR)
 
-$(STAGING_DIR)/bin/sqlite3: $(SQLITE_DIR)/sqlite3
+$(STAGING_DIR)/usr/bin/sqlite3: $(SQLITE_DIR)/sqlite3
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SQLITE_DIR) install
 
-$(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/bin/sqlite3
-	cp -a $(STAGING_DIR)/bin/sqlite3 $(TARGET_DIR)/usr/bin
+$(TARGET_DIR)/usr/bin/sqlite3: $(STAGING_DIR)/usr/bin/sqlite3
+	cp -a $(STAGING_DIR)/usr/bin/sqlite3 $(TARGET_DIR)/usr/bin
 	cp -a $(STAGING_DIR)/lib/libsqlite3.so* $(TARGET_DIR)/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libsqlite3.so*
 
