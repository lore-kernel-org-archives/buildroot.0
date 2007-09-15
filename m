From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 15 Sep 2007 11:14:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070915181454.A660BA5D3C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-15 11:14:53 -0700 (Sat, 15 Sep 2007)
New Revision: 19855

Log:
- depends on host-fakeroot


Modified:
   trunk/buildroot/package/busybox/initramfs.mk


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2007-09-15 13:28:30 UTC (rev 19854)
+++ trunk/buildroot/package/busybox/initramfs.mk	2007-09-15 18:14:53 UTC (rev 19855)
@@ -104,7 +104,7 @@
 	$(STRIP) $(STRIP_STRIP_ALL) $@
 
 
-$(BB_INITRAMFS_TARGET): $(BR2_INITRAMFS_DIR)/bin/busybox
+$(BB_INITRAMFS_TARGET): host-fakeroot $(BR2_INITRAMFS_DIR)/bin/busybox
 	ln -fs bin/busybox $(PROJECT_BUILD_DIR)/initramfs/init
 	mkdir -p $(PROJECT_BUILD_DIR)/initramfs/etc
 	cat target/generic/target_busybox_skeleton/etc/inittab > \
