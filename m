From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 05:09:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbset
Message-ID: <20070923120956.C34CFA688A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 05:09:54 -0700 (Sun, 23 Sep 2007)
New Revision: 19965

Log:
Send correct args to fbset

Modified:
   trunk/buildroot/package/fbset/fbset.mk


Changeset:
Modified: trunk/buildroot/package/fbset/fbset.mk
===================================================================
--- trunk/buildroot/package/fbset/fbset.mk	2007-09-23 10:57:15 UTC (rev 19964)
+++ trunk/buildroot/package/fbset/fbset.mk	2007-09-23 12:09:54 UTC (rev 19965)
@@ -20,10 +20,7 @@
 	touch $@
 
 $(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.unpacked
-	($(TARGET_CONFIGURE_OPTS) \
-	 $(TARGET_CONFIGURE_ARGS) \
-		$(MAKE) -C $(FBSET_DIR) CC=$(TARGET_CC) \
-	)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FBSET_DIR)
 	touch -c $@
 
 $(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
