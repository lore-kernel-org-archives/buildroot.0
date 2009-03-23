From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 11:40:10 +0000 (UTC)
Subject: [Buildroot] svn commit: [25792]
	trunk/buildroot/package/x11r7/xlib_libpciaccess
Message-ID: <20090323114010.D1D9E7656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 11:40:10 +0000 (Mon, 23 Mar 2009)
New Revision: 25792

Log:
libpciaccess: needs large file support

Modified:
   trunk/buildroot/package/x11r7/xlib_libpciaccess/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/xlib_libpciaccess/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xlib_libpciaccess/Config.in	2009-03-23 09:44:13 UTC (rev 25791)
+++ trunk/buildroot/package/x11r7/xlib_libpciaccess/Config.in	2009-03-23 11:40:10 UTC (rev 25792)
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "libpciaccess"
+	depends on BR2_LARGEFILE
 	help
 	  libpciaccess 0.10.3
 	  X.Org libpciaccess
+
+comment "libpciaccess requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
