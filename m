From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 09:20:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib12
Message-ID: <20070121172039.B99E34858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 09:20:38 -0800 (Sun, 21 Jan 2007)
New Revision: 17436

Log:
- use more portable flags for cp


Modified:
   trunk/buildroot/package/libglib12/libglib12.mk


Changeset:
Modified: trunk/buildroot/package/libglib12/libglib12.mk
===================================================================
--- trunk/buildroot/package/libglib12/libglib12.mk	2007-01-21 16:08:27 UTC (rev 17435)
+++ trunk/buildroot/package/libglib12/libglib12.mk	2007-01-21 17:20:38 UTC (rev 17436)
@@ -72,12 +72,12 @@
 	    -C $(LIBGLIB12_DIR) install;
 
 $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10: $(STAGING_DIR)/lib/$(LIBGLIB12_BINARY)
-	cp -a $(STAGING_DIR)/lib/libglib.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libglib-1.2.so.0 $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libglib-1.2.so.0.0.10 $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgmodule.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgmodule-1.2.so.0 $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libgmodule-1.2.so.0.0.10 $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libglib.so $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libglib-1.2.so.0 $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libglib-1.2.so.0.0.10 $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgmodule.so $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgmodule-1.2.so.0 $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgmodule-1.2.so.0.0.10 $(TARGET_DIR)/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmodule-1.2.so.0.0.10
 
