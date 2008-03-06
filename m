From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:22:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rsync
Message-ID: <20080306182248.9EBC412026A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:22:48 -0800 (Thu, 06 Mar 2008)
New Revision: 21223

Log:
cleanup rsync makefile

Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2008-03-06 18:22:31 UTC (rev 21222)
+++ trunk/buildroot/package/rsync/rsync.mk	2008-03-06 18:22:48 UTC (rev 21223)
@@ -20,7 +20,7 @@
 	$(RSYNC_CAT) $(DL_DIR)/$(RSYNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(RSYNC_DIR) package/rsync/ rsync\*.patch
 	$(CONFIG_UPDATE) $(RSYNC_DIR)
-	touch $(RSYNC_DIR)/.unpacked
+	touch $@
 
 $(RSYNC_DIR)/.configured: $(RSYNC_DIR)/.unpacked
 	(cd $(RSYNC_DIR); rm -rf config.cache; \
@@ -33,7 +33,7 @@
 		--prefix=/usr \
 		--with-included-popt \
 	)
-	touch $(RSYNC_DIR)/.configured
+	touch $@
 
 $(RSYNC_DIR)/$(RSYNC_BINARY): $(RSYNC_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(RSYNC_DIR)
