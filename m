From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:46:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/blackbox
Message-ID: <20080826204655.6AF1A3C82A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:46:55 -0700 (Tue, 26 Aug 2008)
New Revision: 23214

Log:
blackbox: use install-strip for target install

Modified:
   trunk/buildroot/package/blackbox/blackbox.mk


Changeset:
Modified: trunk/buildroot/package/blackbox/blackbox.mk
===================================================================
--- trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:46:51 UTC (rev 23213)
+++ trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:46:55 UTC (rev 23214)
@@ -10,7 +10,7 @@
 BLACKBOX_AUTORECONF = NO
 BLACKBOX_INSTALL_STAGING = NO
 BLACKBOX_INSTALL_TARGET = YES
-BLACKBOX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+BLACKBOX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 BLACKBOX_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) --prefix=/usr \
