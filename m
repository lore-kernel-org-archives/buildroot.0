From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 01:11:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libtool
Message-ID: <20080922081102.7FD763C2BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-22 01:11:02 -0700 (Mon, 22 Sep 2008)
New Revision: 23451

Log:
libtool: don't error on missing directories in clean targets

Modified:
   trunk/buildroot/package/libtool/libtool.mk


Changeset:
Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2008-09-21 15:29:29 UTC (rev 23450)
+++ trunk/buildroot/package/libtool/libtool.mk	2008-09-22 08:11:02 UTC (rev 23451)
@@ -90,7 +90,7 @@
 libtool: uclibc $(TARGET_DIR)/$(LIBTOOL_TARGET_BINARY)
 
 libtool-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBTOOL_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBTOOL_DIR) uninstall
 	-$(MAKE) -C $(LIBTOOL_DIR) clean
 
 libtool-cross: uclibc $(LIBTOOL_DIR)/$(LIBTOOL_BINARY)
@@ -138,7 +138,7 @@
 host-libtool: $(LIBTOOL)
 
 host-libtool-clean:
-	$(MAKE) -C $(LIBTOOL_HOST_DIR) uninstall
+	-$(MAKE) -C $(LIBTOOL_HOST_DIR) uninstall
 	-$(MAKE) -C $(LIBTOOL_HOST_DIR) clean
 
 host-libtool-dirclean:
