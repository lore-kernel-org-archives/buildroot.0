From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 12:09:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20080701190953.0C51D3C678@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 12:09:50 -0700 (Tue, 01 Jul 2008)
New Revision: 22596

Log:
valgrind: don't remove TARGET_DIR/usr/lib/pkgconfig

There's no need for removing the pkgconfig files in valgrind.mk
as that is now handled by the generic BR2_HAVE_DEVFILES.

Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2008-07-01 16:09:07 UTC (rev 22595)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2008-07-01 19:09:50 UTC (rev 22596)
@@ -64,11 +64,6 @@
 	cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind
 	chmod a+x $(TARGET_DIR)/usr/bin/valgrind
 	rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
-	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig
-	#mkdir -p $(TARGET_DIR)/etc/default
-	#cp $(VALGRIND_DIR)/valgrind.default $(TARGET_DIR)/etc/default/valgrind
-	#mkdir -p $(TARGET_DIR)/usr/lib/valgrind
-	#cp $(VALGRIND_DIR)/woody.supp $(TARGET_DIR)/usr/lib/valgrind/
 	touch -c $@
 
 valgrind: $(TARGET_DIR)/usr/bin/valgrind
