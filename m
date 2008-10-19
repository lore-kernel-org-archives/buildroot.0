From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 00:59:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/vim
Message-ID: <20081019075919.4DC193C7BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 00:59:19 -0700 (Sun, 19 Oct 2008)
New Revision: 23719

Log:
vim: use $(MAKE) instead of hardcoding make

Modified:
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2008-10-19 07:44:30 UTC (rev 23718)
+++ trunk/buildroot/package/editors/vim/vim.mk	2008-10-19 07:59:19 UTC (rev 23719)
@@ -70,13 +70,13 @@
 
 $(TARGET_DIR)/usr/bin/vim: $(VIM_DIR)/.build
 	(cd $(VIM_DIR)/src; \
-		make DESTDIR=$(TARGET_DIR) installvimbin; \
-		make DESTDIR=$(TARGET_DIR) installlinks; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) installlinks; \
 	)
 ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 	(cd $(VIM_DIR)/src; \
-		make DESTDIR=$(TARGET_DIR) installrtbase; \
-		make DESTDIR=$(TARGET_DIR) installmacros; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) installrtbase; \
+		$(MAKE) DESTDIR=$(TARGET_DIR) installmacros; \
 	)
 endif
 
