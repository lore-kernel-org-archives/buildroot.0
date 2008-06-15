From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 13:44:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080615204416.037823C93C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 13:44:15 -0700 (Sun, 15 Jun 2008)
New Revision: 22361

Log:
dnsmasq: touch target after make


Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-06-15 20:44:10 UTC (rev 22360)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-06-15 20:44:15 UTC (rev 22361)
@@ -45,6 +45,7 @@
 endif
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
 		COPTS='$(DNSMASQ_COPTS)' PREFIX=/usr -C $(DNSMASQ_DIR)
+	touch -c $@
 
 $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY): $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(DNSMASQ_DIR) install
@@ -55,6 +56,7 @@
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
+	touch -c $@
 
 dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 
