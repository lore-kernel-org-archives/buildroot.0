From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 May 2008 14:39:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20080522213922.E5B6F3C616@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-22 14:39:22 -0700 (Thu, 22 May 2008)
New Revision: 22057

Log:
Build iptables using a single process

Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2008-05-22 21:37:24 UTC (rev 22056)
+++ trunk/buildroot/package/iptables/iptables.mk	2008-05-22 21:39:22 UTC (rev 22057)
@@ -25,7 +25,7 @@
 	touch $@
 
 $(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) \
 		COPT_FLAGS="$(TARGET_CFLAGS)" \
 		PREFIX=/usr \
