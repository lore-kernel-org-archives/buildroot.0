From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 00:31:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdnsresponder
Message-ID: <20070815073112.CB94DA4711@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 00:31:12 -0700 (Wed, 15 Aug 2007)
New Revision: 19510

Log:
No parallel make of mdnsresponder

Modified:
   trunk/buildroot/package/mdnsresponder/mdnsresponder.mk


Changeset:
Modified: trunk/buildroot/package/mdnsresponder/mdnsresponder.mk
===================================================================
--- trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-14 16:55:01 UTC (rev 19509)
+++ trunk/buildroot/package/mdnsresponder/mdnsresponder.mk	2007-08-15 07:31:12 UTC (rev 19510)
@@ -26,7 +26,7 @@
 	touch $(MDNSRESPONDER_DIR)/.configured
 
 $(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
+	$(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
 	touch $(MDNSRESPONDER_DIR)/.built
 
 $(STAGING_DIR)/usr/lib/libdns_sd.so: $(MDNSRESPONDER_DIR)/.built
@@ -64,7 +64,7 @@
 
 mdnsresponder-clean:
 	rm -f $(MDNSRESPONDER_DIR)/.configured $(MDNSRESPONDER_DIR)/.built $(MDNSRESPONDER_DIR)/.staged
-	-$(MAKE) os=linux -C $(MDNSRESPONDER_DIR)/mDNSPosix clean
+	-$(MAKE1) os=linux -C $(MDNSRESPONDER_DIR)/mDNSPosix clean
 	rm -f $(TARGET_DIR)/usr/sbin/dnsextd
 	rm -f $(TARGET_DIR)/usr/sbin/mDNSResponderPosix
 	rm -f $(TARGET_DIR)/usr/sbin/mDNSNetMonitor
