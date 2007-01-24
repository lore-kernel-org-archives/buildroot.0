From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 11:11:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20070124191114.3B66448590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 11:11:13 -0800 (Wed, 24 Jan 2007)
New Revision: 17504

Log:
- correct typo


Modified:
   trunk/buildroot/package/kexec/kexec.mk


Changeset:
Modified: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2007-01-24 17:02:45 UTC (rev 17503)
+++ trunk/buildroot/package/kexec/kexec.mk	2007-01-24 19:11:13 UTC (rev 17504)
@@ -52,15 +52,15 @@
 	);
 	touch $@
 
-$(KEXEC_DIR)/$(KEXEC_BINARY): $(KEXEC_DIR)/.configured
+$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY): $(KEXEC_DIR)/.configured
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(KEXEC_DIR)
-	$(STRIP) -s $@
+	touch -c $@
 
-$(TARGET_DIR)/$(KEXEC_TARGET_BINARY): $(KEXEC_DIR)/$(KEXEC_BINARY)
+$(TARGET_DIR)/$(KEXEC_TARGET_BINARY): $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY)
 	cp -dpf $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY) \
 		$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/kdump \
 		$(TARGET_DIR)/sbin/
-	touch -c $@
+	$(STRIP) -s $(TARGET_DIR)/sbin/k{exec,dump}
 
 kexec: uclibc $(TARGET_DIR)/$(KEXEC_TARGET_BINARY)
 
