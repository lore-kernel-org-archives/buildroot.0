From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 07:31:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/java/concierge
Message-ID: <20080907143128.BE7033C360@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 07:31:28 -0700 (Sun, 07 Sep 2008)
New Revision: 23351

Log:
concierge: fix paths

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/java/concierge/concierge.mk


Changeset:
Modified: trunk/buildroot/package/java/concierge/concierge.mk
===================================================================
--- trunk/buildroot/package/java/concierge/concierge.mk	2008-09-06 22:39:58 UTC (rev 23350)
+++ trunk/buildroot/package/java/concierge/concierge.mk	2008-09-07 14:31:28 UTC (rev 23351)
@@ -20,11 +20,11 @@
 	mkdir -p $(TARGET_DIR)/usr/lib
 	mkdir -p $(TARGET_DIR)/usr/lib/concierge
 	cp -dpf $(DL_DIR)/concierge/* $(TARGET_DIR)/usr/lib/concierge/
-	cp -dpf package/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
+	cp -dpf package/java/concierge/files/init.xargs $(TARGET_DIR)/usr/lib/concierge/
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/concierge:
-	cp -dpf package/concierge/files/concierge $(TARGET_DIR)/usr/bin/
+	cp -dpf package/java/concierge/files/concierge $(TARGET_DIR)/usr/bin/
 	chmod +x $(TARGET_DIR)/usr/bin/concierge
 	touch -c $@
 
