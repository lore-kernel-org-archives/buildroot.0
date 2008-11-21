From: Jared Holzman <j.holzman@genesysdesign.com.au>
Date: Fri, 21 Nov 2008 13:24:53 +1100
Subject: [Buildroot]  [PATCH 1/1] package: x11r7/xserver_xorg-server
Message-ID: <49261BF5.8060406@genesysdesign.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds evdev driver support to Xfbdev


Signed-off-by: Jared Holzman <j.holzman@genesysdesign.com.au>
---
Index: package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-Xfbdev-evdev.patch
===================================================================
--- package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-Xfbdev-evdev.patch	(revision 0)
+++ package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-Xfbdev-evdev.patch	(revision 0)
@@ -0,0 +1,16 @@
+diff -Nur xserver_xorg-server-1.4.2.old/hw/kdrive/fbdev/fbinit.c xserver_xorg-server-1.4.2/hw/kdrive/fbdev/fbinit.c
+--- xserver_xorg-server-1.4.2.old/hw/kdrive/fbdev/fbinit.c	2008-11-13 16:59:28.000000000 +1100
++++ xserver_xorg-server-1.4.2/hw/kdrive/fbdev/fbinit.c	2008-11-13 17:00:29.000000000 +1100
+@@ -44,11 +44,7 @@
+ {
+     KdKeyboardInfo *ki;
+ 
+-    KdAddKeyboardDriver (&LinuxKeyboardDriver);
+-    KdAddPointerDriver (&LinuxMouseDriver);
+-#ifdef TSLIB
+-    KdAddPointerDriver (&TsDriver);
+-#endif
++	KdOsAddInputDrivers();
+ 
+     ki = KdParseKeyboard ("keybd");
+     KdAddKeyboard(ki);

--- 

Regards,

Jared Holzman

------------------------------------------------------------------------

*Electronics Design Engineer*

*Genesys Electronics Design Pty Ltd*

Unit 5, 33 Ryde Rd Pymble

NSW, Australia 2073

Direct: +612 9496 8924

Phone: +612 9496 8900

Fax: +612 9496 8999


j.holzman at genesysdesign.com.au <mailto:j.holzman@genesysdesign.com.au>

www.genesysdesign.com.au <http://www.genesysdesign.com.au>

------------------------------------------------------------------------
