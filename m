From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:46:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/blackbox
Message-ID: <20080826204658.E14733C84B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:46:58 -0700 (Tue, 26 Aug 2008)
New Revision: 23215

Log:
blackbox: cleanup redundant configure args

Modified:
   trunk/buildroot/package/blackbox/blackbox.mk


Changeset:
Modified: trunk/buildroot/package/blackbox/blackbox.mk
===================================================================
--- trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:46:55 UTC (rev 23214)
+++ trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:46:58 UTC (rev 23215)
@@ -12,12 +12,9 @@
 BLACKBOX_INSTALL_TARGET = YES
 BLACKBOX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
-BLACKBOX_CONF_OPT =	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--sysconfdir=/etc --x-includes=$(STAGING_DIR)/usr/include/X11 \
+BLACKBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 
-
 BLACKBOX_DEPENDENCIES = uclibc $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,blackbox))
