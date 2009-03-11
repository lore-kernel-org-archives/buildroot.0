From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 15:01:56 +0000 (UTC)
Subject: [Buildroot] svn commit: [25607] trunk/buildroot/package/directfb
Message-ID: <20090311150156.D7C027645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 15:01:56 +0000 (Wed, 11 Mar 2009)
New Revision: 25607

Log:
directfb: add option for linuxinput input driver

Modified:
   trunk/buildroot/package/directfb/Config.in
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2009-03-11 14:40:00 UTC (rev 25606)
+++ trunk/buildroot/package/directfb/Config.in	2009-03-11 15:01:56 UTC (rev 25607)
@@ -45,6 +45,11 @@
 	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_DIRECTFB_LINUXINPUT
+	bool "compile /dev/input/eventX input driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
+
 config BR2_PACKAGE_DIRECTFB_KEYBOARD
 	bool "compile keyboard input driver"
 	default y

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2009-03-11 14:40:00 UTC (rev 25606)
+++ trunk/buildroot/package/directfb/directfb.mk	2009-03-11 15:01:56 UTC (rev 25607)
@@ -56,6 +56,9 @@
 endif
 
 DIRECTFB_INPUT:=
+ifeq ($(BR2_PACKAGE_DIRECTFB_LINUXINPUT),y)
+DIRECTFB_INPUT+= linuxinput
+endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
 DIRECTFB_INPUT+= keyboard
 endif
