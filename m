From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 07:11:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20070919141129.01D6A30069@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 07:11:28 -0700 (Wed, 19 Sep 2007)
New Revision: 19892

Log:
- need to mkdir etc/init.d. Closes #1465


Modified:
   trunk/buildroot/package/dropbear/dropbear.mk


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2007-09-19 14:02:53 UTC (rev 19891)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2007-09-19 14:11:28 UTC (rev 19892)
@@ -56,6 +56,7 @@
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dbclient
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearkey
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/dropbearconvert
+	mkdir -p $(TARGET_DIR)/etc/init.d
 	cp -dpf $(DROPBEAR_DIR)/S50dropbear $(TARGET_DIR)/etc/init.d/
 	chmod a+x $(TARGET_DIR)/etc/init.d/S50dropbear
 
