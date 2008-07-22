From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 06:59:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
Message-ID: <20080722135939.DF0A73C784@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 06:59:39 -0700 (Tue, 22 Jul 2008)
New Revision: 22914

Log:
which: strip target binary

Modified:
   trunk/buildroot/package/which/which.mk


Changeset:
Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2008-07-22 13:59:35 UTC (rev 22913)
+++ trunk/buildroot/package/which/which.mk	2008-07-22 13:59:39 UTC (rev 22914)
@@ -37,7 +37,8 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(WHICH_DIR)
 
 $(TARGET_DIR)/$(WHICH_TARGET_BINARY): $(WHICH_DIR)/$(WHICH_BINARY)
-	install -D $(WHICH_DIR)/$(WHICH_BINARY) $(TARGET_DIR)/$(WHICH_TARGET_BINARY)
+	install -D $^ $@
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
 which: uclibc $(TARGET_DIR)/$(WHICH_TARGET_BINARY)
 
