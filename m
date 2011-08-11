From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 11 Aug 2011 15:19:58 +0000
Subject: [Buildroot] [PATCH] Don't run target-generic-getty* if none selected
Message-ID: <F9C551623D2CBB4C9488801D14F864C605023C@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the string text is "" for the default getty, don't run that target.

Signed-off-by: Andy Kennedy <Andy.Kennedy@Adtran.com>
---
diff -Naur -x output a/target/generic/Makefile.in b/target/generic/Makefile.in
--- a/target/generic/Makefile.in	2011-07-29 06:38:49.000000000 -0500
+++ b/target/generic/Makefile.in	2011-08-11 10:13:23.000000000 -0500
@@ -40,11 +40,13 @@
 endif

 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
+ifneq ($(BR2_TARGET_GENERIC_GETTY_PORT),"")
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
 else
 TARGETS += target-generic-getty-busybox
 endif
+endif
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 TARGETS += target-generic-do-remount-rw
 else
