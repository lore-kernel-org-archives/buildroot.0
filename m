From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 23 Jan 2009 17:49:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
Message-ID: <20090123174908.81999769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-23 17:49:07 +0000 (Fri, 23 Jan 2009)
New Revision: 24983

Log:
Disable webkit (with comment) if X is not available

Modified:
   trunk/buildroot/package/webkit/Config.in


Changeset:
Modified: trunk/buildroot/package/webkit/Config.in
===================================================================
--- trunk/buildroot/package/webkit/Config.in	2009-01-23 17:48:49 UTC (rev 24982)
+++ trunk/buildroot/package/webkit/Config.in	2009-01-23 17:49:07 UTC (rev 24983)
@@ -1,13 +1,18 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
-	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_CURL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_SQLITE
+	depends on !BR2_PACKAGE_XSERVER_none
 	help
 		WebKit is an open source, standards compliant web browser engine.
+		It runs on top of X-Windows
 
 		http://webkit.org/
 
+comment "webkit       - disabled (requires X-Windows)"
+	depends on BR2_PACKAGE_XSERVER_none
+
