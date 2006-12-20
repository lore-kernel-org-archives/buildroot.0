From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 06:41:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20061220144105.036A4485BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 06:41:04 -0800 (Wed, 20 Dec 2006)
New Revision: 17014

Log:
- remove obsoleted dep on host-fakeroot


Modified:
   trunk/buildroot/package/kexec/kexec.mk


Changeset:
Modified: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2006-12-20 04:30:25 UTC (rev 17013)
+++ trunk/buildroot/package/kexec/kexec.mk	2006-12-20 14:41:04 UTC (rev 17014)
@@ -38,7 +38,6 @@
 	(cd $(KEXEC_DIR) && $(KEXEC_CAT) $(DL_DIR)/$(KEXEC_PATCH) | patch -p1)
 	toolchain/patch-kernel.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches \*.patch
 endif
-
 	touch $(KEXEC_DIR)/.unpacked
 
 $(KEXEC_DIR)/.configured: $(KEXEC_DIR)/.unpacked
@@ -61,7 +60,7 @@
 		$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/kdump \
 		$(TARGET_DIR)/sbin/
 
-kexec: uclibc host-fakeroot $(TARGET_DIR)/$(KEXEC_TARGET_BINARY)
+kexec: uclibc $(TARGET_DIR)/$(KEXEC_TARGET_BINARY)
 
 kexec-clean:
 	-$(MAKE) -C $(KEXEC_DIR) clean
