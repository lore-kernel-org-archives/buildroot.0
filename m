From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:23:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rxvt
Message-ID: <20080306182339.E76AA1201F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:23:39 -0800 (Thu, 06 Mar 2008)
New Revision: 21225

Log:
cleanup rxvt makefile

Modified:
   trunk/buildroot/package/rxvt/rxvt.mk


Changeset:
Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2008-03-06 18:23:13 UTC (rev 21224)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2008-03-06 18:23:39 UTC (rev 21225)
@@ -36,7 +36,7 @@
 	$(RXVT_CAT) $(DL_DIR)/$(RXVT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(RXVT_DIR) package/rxvt/ \*.patch
 	$(CONFIG_UPDATE) $(RXVT_DIR)/autoconf
-	touch $(RXVT_DIR)/.unpacked
+	touch $@
 
 $(RXVT_DIR)/.configured: $(RXVT_DIR)/.unpacked
 	(cd $(RXVT_DIR); rm -rf config.cache; \
@@ -55,7 +55,7 @@
 		--disable-resources \
 		--disable-memset \
 	)
-	touch $(RXVT_DIR)/.configured
+	touch $@
 
 $(RXVT_BINARY): $(RXVT_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(RXVT_DIR)
