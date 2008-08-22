From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 07:42:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/openchrome
Message-ID: <20080822144201.11F893C724@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-22 07:42:00 -0700 (Fri, 22 Aug 2008)
New Revision: 23182

Log:
openchrome: fix install

Closes #4674.

Modified:
   trunk/buildroot/package/x11r7/openchrome/openchrome.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/openchrome/openchrome.mk
===================================================================
--- trunk/buildroot/package/x11r7/openchrome/openchrome.mk	2008-08-22 14:24:53 UTC (rev 23181)
+++ trunk/buildroot/package/x11r7/openchrome/openchrome.mk	2008-08-22 14:42:00 UTC (rev 23182)
@@ -9,6 +9,8 @@
 
 OPENCHROME_DEPENDENCIES = xserver_xorg-server libdrm xlib_libX11 xlib_libXvMC xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
+OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
 OPENCHROME_AUTORECONF = YES
 OPENCHROME_CONF_OPT = --enable-shared --disable-static
 
