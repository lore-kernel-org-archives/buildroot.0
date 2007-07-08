From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 13:14:51 +0200 (CEST)
Subject: [Buildroot] busybox package configuration
Message-ID: <0707081257070.8395@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I mended the Config.in file:

Index: Config.in
===================================================================
--- Config.in	(revision 19026)
+++ Config.in	(working copy)
@@ -100,6 +100,7 @@
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_0
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
+	default "package/busybox/busybox-1.6.1.config" if BR2_BUSYBOX_VERSION_1_6_1
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.

created a busybox-1.6.1.config file in package/busybox, did a 'make
menuconfig' in topdir and expected to see the
package/busybox/busybox-1.6.1.config preselected.  But no joy :(  I still
needed to manually enter the config file path into the field.

I can also see that the BR2_PACKAGE_BUSYBOX_CONFIG variable in busybox.mk
is empty when making a busybox-<something> target.  There's some make
magic I do not possess :(  Any ideas?


-- 
Cristian
