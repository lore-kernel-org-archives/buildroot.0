From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 05:20:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: busybox gnuconfig
Message-ID: <20070925122039.655443006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 05:20:37 -0700 (Tue, 25 Sep 2007)
New Revision: 20015

Log:
- add dummy -source targets.


Modified:
   trunk/buildroot/package/busybox/initramfs.mk
   trunk/buildroot/package/gnuconfig/gnuconfig.mk


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2007-09-25 12:16:39 UTC (rev 20014)
+++ trunk/buildroot/package/busybox/initramfs.mk	2007-09-25 12:20:37 UTC (rev 20015)
@@ -124,6 +124,7 @@
 					$(BB_INITRAMFS_TARGET)
 	touch $@
 
+busybox-initramfs-source:
 busybox-initramfs: uclibc $(PROJECT_BUILD_DIR)/.initramfs_done
 
 busybox-initramfs-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_INITRAMFS_DIR)/.configured

Modified: trunk/buildroot/package/gnuconfig/gnuconfig.mk
===================================================================
--- trunk/buildroot/package/gnuconfig/gnuconfig.mk	2007-09-25 12:16:39 UTC (rev 20014)
+++ trunk/buildroot/package/gnuconfig/gnuconfig.mk	2007-09-25 12:20:37 UTC (rev 20015)
@@ -1,3 +1,3 @@
 # See README.buildroot
-
+gnuconfig-source:
 CONFIG_UPDATE = cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
