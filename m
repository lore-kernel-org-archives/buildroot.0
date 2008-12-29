From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 15:22:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081229152213.76EA076C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-29 15:22:12 +0000 (Mon, 29 Dec 2008)
New Revision: 24604

Log:
xlib needs wchar support, so require it for tinyx as well

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-29 15:13:32 UTC (rev 24603)
+++ trunk/buildroot/package/Config.in	2008-12-29 15:22:12 UTC (rev 24604)
@@ -332,6 +332,9 @@
 	depends on !(BR2_USE_WCHAR && BR2_ENABLE_LOCALE)
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
+	depends on BR2_USE_WCHAR
+comment "tinyx requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
 endchoice
 
 config BR2_X11_PREFIX
