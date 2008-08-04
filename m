From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ethtool
Message-ID: <20080804190826.EF0F13C8E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:26 -0700 (Mon, 04 Aug 2008)
New Revision: 23037

Log:
ethtool: don't specify STRIPPROG

The correct strip program gets picked up at configure time, so no need to
specify it at target install time.

Modified:
   trunk/buildroot/package/ethtool/ethtool.mk


Changeset:
Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2008-08-04 19:08:21 UTC (rev 23036)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2008-08-04 19:08:26 UTC (rev 23037)
@@ -10,7 +10,7 @@
 ETHTOOL_AUTORECONF:=no
 ETHTOOL_INSTALL_STAGING:=NO
 ETHTOOL_INSTALL_TARGET:=YES
-ETHTOOL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
+ETHTOOL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 ETHTOOL_UNINSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) uninstall
 
 ETHTOOL_DEPENDENCIES:=uclibc
