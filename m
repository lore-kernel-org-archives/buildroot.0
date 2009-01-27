From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:02:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
Message-ID: <20090127150214.EC1FE7709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:02:13 +0000 (Tue, 27 Jan 2009)
New Revision: 25075

Log:
webkit: revert r24983 (Disable webkit (with comment) if X is not available)

Webkit doesn't need X.

Modified:
   trunk/buildroot/package/webkit/Config.in


Changeset:
Modified: trunk/buildroot/package/webkit/Config.in
===================================================================
--- trunk/buildroot/package/webkit/Config.in	2009-01-27 12:56:33 UTC (rev 25074)
+++ trunk/buildroot/package/webkit/Config.in	2009-01-27 15:02:13 UTC (rev 25075)
@@ -1,18 +1,13 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_CURL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_SQLITE
-	depends on !BR2_PACKAGE_XSERVER_none
 	help
 		WebKit is an open source, standards compliant web browser engine.
-		It runs on top of X-Windows
 
 		http://webkit.org/
 
-comment "webkit       - disabled (requires X-Windows)"
-	depends on BR2_PACKAGE_XSERVER_none
-
