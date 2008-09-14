From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 14 Sep 2008 12:19:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080915150245.09C1A3C6EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-14 12:19:10 -0700 (Sun, 14 Sep 2008)
New Revision: 23395

Log:
Makefile.autotools.in: fix DESTDIR= help text

DESTDIR per default points to TARGET_DIR / STAGING_DIR without /usr
appended.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-14 19:19:06 UTC (rev 23394)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-14 19:19:10 UTC (rev 23395)
@@ -43,16 +43,16 @@
 #	install the package to the staging directory
 # FOO_INSTALL_TARGET [YES/NO, default YES]
 #	install the package to the target directory
-# FOO_INSTALL_STAGING_OPT [default DESTDIR=$(STAGING_DIR)/usr install]
+# FOO_INSTALL_STAGING_OPT [default DESTDIR=$(STAGING_DIR) install]
 #	arguments passed to <make> while installing to the staging directory
-# FOO_INSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR)/usr install-exec]
+# FOO_INSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR) install-exec]
 #	arguments passed to <make> while installing to the target directory
 # FOO_CLEAN_OPT [default clean]
 #	arguments passed to <make> while installing to the staging directory
-# FOO_UNINSTALL_STAGING_OPT  [default DESTDIR=$(STAGING_DIR)/usr uninstall]
+# FOO_UNINSTALL_STAGING_OPT  [default DESTDIR=$(STAGING_DIR) uninstall]
 #	arguments passed to <make> while uninstalling from the staging
 #	directory
-# FOO_UNINSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR)/usr uninstall]
+# FOO_UNINSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR) uninstall]
 #	arguments passed to <make> while uninstalling from the target
 #	directory
 # FOO_SUBDIR [default empty]
