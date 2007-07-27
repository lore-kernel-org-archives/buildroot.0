From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 27 Jul 2007 00:35:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tn5250
Message-ID: <20070727073550.155FCA4756@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-27 00:35:49 -0700 (Fri, 27 Jul 2007)
New Revision: 19268

Log:
Make sure tn5250 uses the correct include path

Modified:
   trunk/buildroot/package/tn5250/tn5250.mk


Changeset:
Modified: trunk/buildroot/package/tn5250/tn5250.mk
===================================================================
--- trunk/buildroot/package/tn5250/tn5250.mk	2007-07-27 07:34:44 UTC (rev 19267)
+++ trunk/buildroot/package/tn5250/tn5250.mk	2007-07-27 07:35:49 UTC (rev 19268)
@@ -37,7 +37,7 @@
 	touch $(TN5250_DIR)/.configured
 
 $(TN5250_DIR)/src/tn5250: $(TN5250_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(TN5250_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(TN5250_DIR)
 
 $(TARGET_DIR)/usr/bin/tn5250: $(TN5250_DIR)/src/tn5250
 	install -c $(TN5250_DIR)/src/tn5250 $(TARGET_DIR)/usr/bin/tn5250
