From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 04:32:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081020113223.0DE1A3C74E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 04:32:22 -0700 (Mon, 20 Oct 2008)
New Revision: 23740

Log:
Makefile.autotools.in: default to install-strip for non-debug target install

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-10-20 09:52:14 UTC (rev 23739)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-10-20 11:32:22 UTC (rev 23740)
@@ -47,7 +47,7 @@
 #	install the package to the target directory
 # FOO_INSTALL_STAGING_OPT [default DESTDIR=$(STAGING_DIR) install]
 #	arguments passed to <make> while installing to the staging directory
-# FOO_INSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR) install-exec]
+# FOO_INSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR) install-exec/install-strip]
 #	arguments passed to <make> while installing to the target directory
 # FOO_CLEAN_OPT [default clean]
 #	arguments passed to <make> while installing to the staging directory
@@ -308,7 +308,11 @@
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_TARGET		?= YES
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+ifeq ($(BR2_ENABLE_DEBUG),y)
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-exec
+else
+$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
+endif
 $(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
