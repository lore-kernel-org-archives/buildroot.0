From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 24 Mar 2007 05:09:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070324120918.56ED548020@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-24 05:08:57 -0700 (Sat, 24 Mar 2007)
New Revision: 18218

Log:
- strip quotes. Thanks to Heikki Lindholm for pointing this out.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-03-24 12:08:36 UTC (rev 18217)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-03-24 12:08:57 UTC (rev 18218)
@@ -11,8 +11,10 @@
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
-BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BR2_BUSYBOX_VERSION)
-BUSYBOX_SOURCE:=busybox-$(BR2_BUSYBOX_VERSION).tar.bz2
+BUSYBOX_VERSION=$(strip $(subst ",, $(BR2_BUSYBOX_VERSION)))
+#"))
+BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
+BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
@@ -38,7 +40,7 @@
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
 	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox.\*.patch
 else
-	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BR2_BUSYBOX_VERSION)-\*.patch
+	toolchain/patch-kernel.sh $(BUSYBOX_DIR) package/busybox busybox-$(BUSYBOX_VERSION)-\*.patch
 endif
 	touch $@
 
