From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 23:49:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070905064957.C5DC4A682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 23:49:57 -0700 (Tue, 04 Sep 2007)
New Revision: 19787

Log:
Bump DirectFB version, and enable/disable X11

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-09-05 06:48:38 UTC (rev 19786)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-09-05 06:49:57 UTC (rev 19787)
@@ -5,7 +5,7 @@
 #############################################################
 #DIRECTFB_VERSION:=0.9.25.1
 #DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
-DIRECTFB_VERSION:=1.0.0
+DIRECTFB_VERSION:=1.0.1
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_CAT:=$(ZCAT)
@@ -18,6 +18,11 @@
 DIRECTFB_MULTI:=
 DIRECTFB_FUSION:=
 endif
+ifeq ($(BR2_PACKAGE_XSERVER_none),y)
+DIRECTFB_X:= --disable-x11
+else
+DIRECTFB_X:= --enable-x11
+endif
 
 $(DL_DIR)/$(DIRECTFB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DIRECTFB_SITE)/$(DIRECTFB_SOURCE)
@@ -55,6 +60,7 @@
 		--with-gfxdrivers=cle266,unichrome \
 		--enable-shared \
 		$(DIRECTFB_MULTI) \
+		$(DIRECTFB_X) \
 		--enable-jpeg \
 		--enable-png \
 		--enable-linux-input \
