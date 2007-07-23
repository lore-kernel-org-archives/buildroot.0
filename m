From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 04:34:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20070723113431.4A1F6A687C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 04:34:30 -0700 (Mon, 23 Jul 2007)
New Revision: 19218

Log:
- just use the TARGET_CC


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2007-07-23 11:32:09 UTC (rev 19217)
+++ trunk/buildroot/package/iptables/iptables.mk	2007-07-23 11:34:30 UTC (rev 19218)
@@ -25,12 +25,12 @@
 	touch $@
 
 $(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS)  -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
 		COPT_FLAGS="$(TARGET_CFLAGS)"
 
 $(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
 		COPT_FLAGS="$(TARGET_CFLAGS)" \
 		DESTDIR=$(TARGET_DIR) install
