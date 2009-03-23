From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 12:50:11 +0000 (UTC)
Subject: [Buildroot] svn commit: [25794] trunk/buildroot/package
Message-ID: <20090323125011.4EC127656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 12:50:10 +0000 (Mon, 23 Mar 2009)
New Revision: 25794

Log:
xorg: needs LARGEFILE support

For mesa3d/libpciaccess

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-03-23 12:50:05 UTC (rev 25793)
+++ trunk/buildroot/package/Config.in	2009-03-23 12:50:10 UTC (rev 25794)
@@ -327,15 +327,15 @@
 	bool "none"
 config BR2_PACKAGE_XSERVER_xorg
 	bool "modular xorg"
-	depends on BR2_USE_WCHAR # && BR2_ENABLE_LOCALE
+	depends on BR2_USE_WCHAR && BR2_LARGEFILE # && BR2_ENABLE_LOCALE
 # depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
 	depends on BR2_USE_WCHAR
 endchoice
 
-comment "xorg requires a toolchain with LOCALE and WCHAR support"
-	depends on !(BR2_USE_WCHAR && BR2_ENABLE_LOCALE)
+comment "xorg requires a toolchain with LOCALE, LARGEFILE and WCHAR support"
+	depends on !(BR2_USE_WCHAR && BR2_LARGEFILE && BR2_ENABLE_LOCALE)
 comment "tinyx requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
