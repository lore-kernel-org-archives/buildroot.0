From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 09:18:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090213091810.4B55C76449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-13 09:18:08 +0000 (Fri, 13 Feb 2009)
New Revision: 25316

Log:
package: work around kconfig crash issue with comments in choice entries

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-02-13 08:34:08 UTC (rev 25315)
+++ trunk/buildroot/package/Config.in	2009-02-13 09:18:08 UTC (rev 25316)
@@ -327,14 +327,15 @@
 	bool "modular xorg"
 	depends on BR2_USE_WCHAR # && BR2_ENABLE_LOCALE
 # depending on BR2_ENABLE_LOCALE gives a recursion error with dbus
-comment "xorg requires a toolchain with LOCALE and WCHAR support"
-	depends on !(BR2_USE_WCHAR && BR2_ENABLE_LOCALE)
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
 	depends on BR2_USE_WCHAR
+endchoice
+
+comment "xorg requires a toolchain with LOCALE and WCHAR support"
+	depends on !(BR2_USE_WCHAR && BR2_ENABLE_LOCALE)
 comment "tinyx requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
-endchoice
 
 config BR2_X11_PREFIX
 	string
