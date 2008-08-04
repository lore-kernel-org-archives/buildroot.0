From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20080804190739.406FD3C88D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:38 -0700 (Mon, 04 Aug 2008)
New Revision: 23024

Log:
strace: also remove from target-utils on clean

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-08-04 19:07:36 UTC (rev 23023)
+++ trunk/buildroot/package/strace/strace.mk	2008-08-04 19:07:38 UTC (rev 23024)
@@ -64,7 +64,8 @@
 strace: uclibc $(TARGET_DIR)/usr/bin/strace
 
 strace-clean:
-	rm -f $(TARGET_DIR)/usr/bin/strace
+	rm -f $(TARGET_DIR)/usr/bin/strace \
+	      $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/strace
 	-$(MAKE) -C $(STRACE_DIR) clean
 
 strace-dirclean:
