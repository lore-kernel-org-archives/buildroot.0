From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 15:46:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
Message-ID: <20070828224654.E977BA5D2D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 15:46:54 -0700 (Tue, 28 Aug 2007)
New Revision: 19726

Log:
Remove some more file during pppd-clean

Modified:
   trunk/buildroot/package/pppd/pppd.mk


Changeset:
Modified: trunk/buildroot/package/pppd/pppd.mk
===================================================================
--- trunk/buildroot/package/pppd/pppd.mk	2007-08-28 22:23:08 UTC (rev 19725)
+++ trunk/buildroot/package/pppd/pppd.mk	2007-08-28 22:46:54 UTC (rev 19726)
@@ -64,6 +64,8 @@
 pppd-clean:
 	rm -f $(TARGET_DIR)/usr/sbin/pppd
 	rm -f $(TARGET_DIR)/usr/sbin/chat
+	rm -f $(TARGET_DIR)/usr/sbin/pppstatus
+	rm -f $(TARGET_DIR)/usr/sbin/pppdump
 	rm -rf $(TARGET_DIR)/etc/ppp
 	-$(MAKE) -C $(PPPD_DIR) clean
 
