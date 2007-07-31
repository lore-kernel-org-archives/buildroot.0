From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 15:40:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cvs libxml2
Message-ID: <20070731224014.3B6B7A4659@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 15:40:13 -0700 (Tue, 31 Jul 2007)
New Revision: 19369

Log:
Only build cvs and libxml2 if WCHAR is enabled

Modified:
   trunk/buildroot/package/cvs/Config.in
   trunk/buildroot/package/libxml2/Config.in


Changeset:
Modified: trunk/buildroot/package/cvs/Config.in
===================================================================
--- trunk/buildroot/package/cvs/Config.in	2007-07-31 22:38:52 UTC (rev 19368)
+++ trunk/buildroot/package/cvs/Config.in	2007-07-31 22:40:13 UTC (rev 19369)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CVS
 	bool "cvs"
 	default n
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Concurrent Versions System - source code revision control tools.

Modified: trunk/buildroot/package/libxml2/Config.in
===================================================================
--- trunk/buildroot/package/libxml2/Config.in	2007-07-31 22:38:52 UTC (rev 19368)
+++ trunk/buildroot/package/libxml2/Config.in	2007-07-31 22:40:13 UTC (rev 19369)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBXML2
 	bool "libxml2"
 	default n
+	depends on BR2_USE_WCHAR
 	help
 	  XML C Parser
 	  Requires WCHAR
