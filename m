From: Daniel Laird <danieljlaird@hotmail.com>
Date: Tue, 27 Jan 2009 15:29:20 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
In-Reply-To: <20090127150231.1A65F7709E@busybox.osuosl.org>
References: <20090127150231.1A65F7709E@busybox.osuosl.org>
Message-ID: <COL102-DS10B32A6F03C4C2B946F2DBDCCB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My only concern with all these changes is currently external toolchain has
no support for setting
BR2_ENABLE_LOCALE or BR2_USE_WCHAR.  However I can build these packages.

SO,
do we make these options top level external-toolchain options? (best option)
automagically set these if using an external toolchain? (hack option)

It would seem a shame to break external toolchain support at this late
hour....

Am willing to try out suggested fixes!
Cheers
Dan
-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of jacmet at uclibc.org
Sent: 2009 Jan 27 15:03
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu

Author: jacmet
Date: 2009-01-27 15:02:29 +0000 (Tue, 27 Jan 2009)
New Revision: 25078

Log:
icu: needs wchar support in toolchain as well

Modified:
   trunk/buildroot/package/icu/Config.in


Changeset:
Modified: trunk/buildroot/package/icu/Config.in
===================================================================
--- trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:25 UTC (rev
25077)
+++ trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:29 UTC (rev
25078)
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  International Components for Unicode.
 
 	  http://icu-project.org/
 
-comment "icu requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "icu requires a toolchain with C++ support and WCHAR enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
