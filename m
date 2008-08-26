From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:47:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/blackbox
Message-ID: <20080826204706.C1E8D3C87E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:47:05 -0700 (Tue, 26 Aug 2008)
New Revision: 23217

Log:
blackbox: use := assignments

Modified:
   trunk/buildroot/package/blackbox/blackbox.mk


Changeset:
Modified: trunk/buildroot/package/blackbox/blackbox.mk
===================================================================
--- trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:47:01 UTC (rev 23216)
+++ trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:47:05 UTC (rev 23217)
@@ -4,17 +4,17 @@
 #
 #############################################################
 
-BLACKBOX_VERSION = 0.70.1
-BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
-BLACKBOX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
-BLACKBOX_AUTORECONF = NO
-BLACKBOX_INSTALL_STAGING = NO
-BLACKBOX_INSTALL_TARGET = YES
-BLACKBOX_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
+BLACKBOX_VERSION:=0.70.1
+BLACKBOX_SOURCE:=blackbox-$(BLACKBOX_VERSION).tar.bz2
+BLACKBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
+BLACKBOX_AUTORECONF:=NO
+BLACKBOX_INSTALL_STAGING:=NO
+BLACKBOX_INSTALL_TARGET:=YES
+BLACKBOX_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 
-BLACKBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 
-BLACKBOX_DEPENDENCIES = uclibc $(XSERVER)
+BLACKBOX_DEPENDENCIES:=uclibc $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,blackbox))
