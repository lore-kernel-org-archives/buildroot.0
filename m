From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed, 28 Jan 2009 13:14:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20090128131454.C73C9769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-28 13:14:51 +0000 (Wed, 28 Jan 2009)
New Revision: 25090

Log:
* Cleanup of prefix


Modified:
   trunk/buildroot/package/xfsprogs/xfsprogs.mk


Changeset:
Modified: trunk/buildroot/package/xfsprogs/xfsprogs.mk
===================================================================
--- trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-28 13:13:59 UTC (rev 25089)
+++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-28 13:14:51 UTC (rev 25090)
@@ -45,9 +45,7 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--libdir=/usr/lib \
+		--exec-prefix=/ \
 		$(XFSPROGS_CONFIG_SHARED) \
 	)
 	touch $(XFSPROGS_DIR)/.configured
@@ -75,7 +73,6 @@
 $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) \
 	    DIST_ROOT=$(TARGET_DIR) \
-	    prefix=/usr \
 	    exec-prefix=/ \
 	    -C $(XFSPROGS_DIR) install
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
