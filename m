From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:34:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  x11vnc
Message-ID: <20080306183440.33855120250@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:34:39 -0800 (Thu, 06 Mar 2008)
New Revision: 21240

Log:
added x11vnc

Added:
   trunk/buildroot/package/x11vnc/
   trunk/buildroot/package/x11vnc/Config.in
   trunk/buildroot/package/x11vnc/x11vnc.mk


Changeset:
Added: trunk/buildroot/package/x11vnc/Config.in
===================================================================
--- trunk/buildroot/package/x11vnc/Config.in	                        (rev 0)
+++ trunk/buildroot/package/x11vnc/Config.in	2008-03-06 18:34:39 UTC (rev 21240)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_X11VNC
+	bool "x11vnc"
+	default n
+	help
+	  VNC server for X11 display

Added: trunk/buildroot/package/x11vnc/x11vnc.mk
===================================================================
--- trunk/buildroot/package/x11vnc/x11vnc.mk	                        (rev 0)
+++ trunk/buildroot/package/x11vnc/x11vnc.mk	2008-03-06 18:34:39 UTC (rev 21240)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# X11VNC
+#
+#############################################################
+X11VNC_VERSION = 0.9.3
+X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
+X11VNC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver
+X11VNC_INSTALL_STAGING = NO
+X11VNC_INSTALL_TARGET = YES
+#X11VNCINSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+X11VNC_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+        --build=$(GNU_HOST_NAME) --prefix=/usr \
+        --includedir=/usr/include \
+		--without-avahi
+
+X11VNC_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,x11vnc))
