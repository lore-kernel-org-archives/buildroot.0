From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 05:10:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070708121024.5E71AA6805@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 05:10:21 -0700 (Sun, 08 Jul 2007)
New Revision: 19032

Log:
- CONFIG_FDISK_SUPPORT_LARGE_DISKS depends on LFS


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-07-08 12:05:03 UTC (rev 19031)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-07-08 12:10:21 UTC (rev 19032)
@@ -70,9 +70,10 @@
 endif
 ifeq ($(BR2_LARGEFILE),y)
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=y/;" $(BUSYBOX_DIR)/.config
+	$(SED) "s/^.*CONFIG_FDISK_SUPPORT_LARGE_DISKS.*/CONFIG_FDISK_SUPPORT_LARGE_DISKS=y/;" $(BUSYBOX_DIR)/.config
 else
 	$(SED) "s/^.*CONFIG_LFS.*/CONFIG_LFS=n/;" $(BUSYBOX_DIR)/.config
-	$(SED) "s/^.*FDISK_SUPPORT_LARGE_DISKS.*/FDISK_SUPPORT_LARGE_DISKS=n/;" $(BUSYBOX_DIR)/.config
+	$(SED) "s/^.*FDISK_SUPPORT_LARGE_DISKS.*/CONFIG_FDISK_SUPPORT_LARGE_DISKS=n/;" $(BUSYBOX_DIR)/.config
 endif
 ifeq ($(BR2_INET_IPV6),y)
 	$(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=y/;" $(BUSYBOX_DIR)/.config
