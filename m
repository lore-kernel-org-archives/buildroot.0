From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 13:44:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20080615204411.C28F33C937@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 13:44:10 -0700 (Sun, 15 Jun 2008)
New Revision: 22360

Log:
valgrind: don't add pkgconfig files to target


Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:05 UTC (rev 22359)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 20:44:10 UTC (rev 22360)
@@ -64,6 +64,7 @@
 	cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind
 	chmod a+x $(TARGET_DIR)/usr/bin/valgrind
 	rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
+	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig
 	#mkdir -p $(TARGET_DIR)/etc/default
 	#cp $(VALGRIND_DIR)/valgrind.default $(TARGET_DIR)/etc/default/valgrind
 	#mkdir -p $(TARGET_DIR)/usr/lib/valgrind
