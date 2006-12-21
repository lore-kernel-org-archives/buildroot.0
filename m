From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Dec 2006 03:57:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lvm2
Message-ID: <20061221115736.8460B4858B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-21 03:57:35 -0800 (Thu, 21 Dec 2006)
New Revision: 17026

Log:
- use DESTDIR for install. Thanks to Stuart Longland. Closes #926


Modified:
   trunk/buildroot/package/lvm2/lvm2.mk


Changeset:
Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2006-12-21 10:36:40 UTC (rev 17025)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2006-12-21 11:57:35 UTC (rev 17026)
@@ -56,7 +56,7 @@
 
 $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) install prefix=$(STAGING_DIR) exec_prefix=$(STAGING_DIR)
+	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
 	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
 
 lvm2: uclibc dm $(LVM2_TARGET_SBINS)
