From: Ormund Williams <ormundw@panix.com>
Date: Wed, 23 Sep 2009 01:06:59 -0400
Subject: [Buildroot] Enable i830 graphics driver for DirectFB
Message-ID: <1253682420.451.64.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm still learning to use git, so if anyone can turn these diffs into a
real patch I would appreciate it.


--- Config.in.old 2009-09-22 17:26:45.000000000 -0400
+++ Config.in     2009-09-22 14:37:28.000000000 -0400
@@ -61,6 +61,12 @@
 	depends on BR2_PACKAGE_DIRECTFB
 	depends on BR2_i386 || BR2_x86_64
 
+config BR2_PACKAGE_DIRECTFB_I830
+	bool "compile i830 graphics driver"
+	default y
+	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_i386 || BR2_x86_64
+
 config BR2_PACKAGE_DIRECTFB_LINUXINPUT
 	bool "compile /dev/input/eventX input driver"
 	default y


--- directfb.mk.old 2009-09-22 17:27:16.000000000 -0400
+++ directfb.mk	2009-09-22 14:40:47.000000000 -0400
@@ -63,6 +63,9 @@
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNICHROME),y)
 DIRECTFB_GFX+= unichrome
 endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_I830),y)
+DIRECTFB_GFX+= i830
+endif
 ifeq ($(DIRECTFB_GFX),)
 DIRECTFB_GFX:=none
 else

-- 
Ormund Williams
OrmLab LLC
