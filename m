From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 27 Jun 2007 14:07:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070627210710.8578FA608D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-27 14:07:09 -0700 (Wed, 27 Jun 2007)
New Revision: 18954

Log:
- use BR2_INET_IPV6


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-06-27 21:03:42 UTC (rev 18953)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-06-27 21:07:09 UTC (rev 18954)
@@ -74,6 +74,11 @@
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=n/;" $(BUSYBOX_DIR)/.config
 	$(SED) "s/^.*FDISK_SUPPORT_LARGE_DISKS.*/FDISK_SUPPORT_LARGE_DISKS=n/;" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_INET_IPV6),y)
+	$(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=y/;" $(BUSYBOX_DIR)/.config
+else
+	$(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=n/;" $(BUSYBOX_DIR)/.config
+endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
 	# force mdev on
 	$(SED) "s/^.*CONFIG_MDEV.*/CONFIG_MDEV=y/" $(BUSYBOX_DIR)/.config
