From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 May 2008 14:37:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbset
Message-ID: <20080522213725.C2D3D3C61C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-22 14:37:24 -0700 (Thu, 22 May 2008)
New Revision: 22056

Log:
Build fbset using a single process

Modified:
   trunk/buildroot/package/fbset/fbset.mk


Changeset:
Modified: trunk/buildroot/package/fbset/fbset.mk
===================================================================
--- trunk/buildroot/package/fbset/fbset.mk	2008-05-22 21:35:16 UTC (rev 22055)
+++ trunk/buildroot/package/fbset/fbset.mk	2008-05-22 21:37:24 UTC (rev 22056)
@@ -22,7 +22,7 @@
 	touch $@
 
 $(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FBSET_DIR)
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(FBSET_DIR)
 	touch -c $@
 
 $(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
