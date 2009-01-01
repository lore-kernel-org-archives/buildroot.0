From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 19:30:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lvm2
Message-ID: <20090101193056.9386676C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 19:30:55 +0000 (Thu, 01 Jan 2009)
New Revision: 24639

Log:
* Running the make for lvm2 in parallel can cause build failures, revert to -j1


Modified:
   trunk/buildroot/package/lvm2/lvm2.mk


Changeset:
Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2009-01-01 17:52:09 UTC (rev 24638)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2009-01-01 19:30:55 UTC (rev 24639)
@@ -62,8 +62,8 @@
 	touch $(LVM2_DIR)/.configured
 
 $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
+	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
+	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
 	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
 
 lvm2: uclibc dm $(LVM2_TARGET_SBINS)
