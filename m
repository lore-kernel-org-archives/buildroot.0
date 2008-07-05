From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 23:46:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/webif
Message-ID: <20080705064644.75DA43C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 23:46:43 -0700 (Fri, 04 Jul 2008)
New Revision: 22643

Log:
Fix bug 003934, remove a dir tree instead of the dir node

Modified:
   trunk/buildroot/package/webif/webif.mk


Changeset:
Modified: trunk/buildroot/package/webif/webif.mk
===================================================================
--- trunk/buildroot/package/webif/webif.mk	2008-07-05 06:37:17 UTC (rev 22642)
+++ trunk/buildroot/package/webif/webif.mk	2008-07-05 06:46:43 UTC (rev 22643)
@@ -52,7 +52,7 @@
 webif: busybox $(TARGET_DIR)/www/webif.css
 
 webif-clean:
-	rm -f $(TARGET_DIR)/www/cgi-bin/webif* $(TARGET_DIR)/www/webif.*
+	rm -rf $(TARGET_DIR)/www/cgi-bin/webif* $(TARGET_DIR)/www/webif.*
 	rm -rf $(TARGET_DIR)/usr/lib/webif
 	rm -f $(TARGET_DIR)/usr/bin/bstrip $(TARGET_DIR)/usr/bin/webif-page
 	rm -r $(WEBIF_DIR)/bstrip $(WEBIF_DIR)/webif-page
