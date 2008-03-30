From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 13:48:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080330204814.48E3F3C45E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-30 13:48:13 -0700 (Sun, 30 Mar 2008)
New Revision: 21587

Log:
Makefile: fix typo (.empty files, not dirs)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-30 20:45:42 UTC (rev 21586)
+++ trunk/buildroot/Makefile	2008-03-30 20:48:13 UTC (rev 21587)
@@ -330,7 +330,7 @@
 	fi
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
-	-find $(TARGET_DIR) -type d -name .empty | xargs rm -rf	
+	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf	
 	touch $@
 
 $(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
