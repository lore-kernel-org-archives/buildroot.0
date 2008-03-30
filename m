From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 13:52:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080330205234.46CC33C54C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-30 13:52:33 -0700 (Sun, 30 Mar 2008)
New Revision: 21588

Log:
Makefile: merge CVS and .svn find invocation


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-30 20:48:13 UTC (rev 21587)
+++ trunk/buildroot/Makefile	2008-03-30 20:52:33 UTC (rev 21588)
@@ -328,8 +328,7 @@
 		fi; \
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
-	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
-	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
+	-find $(TARGET_DIR) -type d -name CVS -o -name .svn | xargs rm -rf
 	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf	
 	touch $@
 
