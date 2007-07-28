From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:09:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20070728150920.AA6D8A455D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:09:19 -0700 (Sat, 28 Jul 2007)
New Revision: 19286

Log:
Fix environment for iptables

Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2007-07-27 15:30:39 UTC (rev 19285)
+++ trunk/buildroot/package/iptables/iptables.mk	2007-07-28 15:09:19 UTC (rev 19286)
@@ -25,12 +25,12 @@
 	touch $@
 
 $(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS)  -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
 		COPT_FLAGS="$(TARGET_CFLAGS)"
 
 $(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
-	$(MAKE) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
 		COPT_FLAGS="$(TARGET_CFLAGS)" \
 		DESTDIR=$(TARGET_DIR) install
