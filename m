From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 05:04:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080701120429.240FDF801C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 05:04:28 -0700 (Tue, 01 Jul 2008)
New Revision: 22587

Log:
Makefile: remove target pkgconfig files if BR2_HAVE_DEVFILES isn't enabled


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-01 12:04:18 UTC (rev 22586)
+++ trunk/buildroot/Makefile	2008-07-01 12:04:28 UTC (rev 22587)
@@ -332,7 +332,7 @@
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
-	rm -rf $(TARGET_DIR)/usr/include
+	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
 	find $(TARGET_DIR)/usr/lib -name '*.a' -delete 
 	find $(TARGET_DIR)/lib -name '*.a' -delete 
 	find $(TARGET_DIR)/usr/lib -name '*.la' -delete 
