From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 15:38:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain
Message-ID: <20070731223852.1C43FA458C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 15:38:52 -0700 (Tue, 31 Jul 2007)
New Revision: 19368

Log:
Change def of BR2_USE_WCHAR to build uClibc w WCHAR support

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/toolchain/Config.in.2


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-31 18:40:17 UTC (rev 19367)
+++ trunk/buildroot/Config.in	2007-07-31 22:38:52 UTC (rev 19368)
@@ -651,12 +651,6 @@
 	help
 	  This option hides outdated/obsolete versions of packages.
 
-config BR2_USE_WCHAR
-	bool "Show packages that require WCHAR support"
-	default y
-	help
-	  This option hides packages which cannot be built without WCHAR.
-
 choice
 	prompt "strip"
 	default BR2_STRIP_strip

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-07-31 18:40:17 UTC (rev 19367)
+++ trunk/buildroot/toolchain/Config.in.2	2007-07-31 22:38:52 UTC (rev 19368)
@@ -41,6 +41,12 @@
 	help
 	    Enable RPC. RPC support is needed for nfs.
 
+config BR2_USE_WCHAR
+	bool "Enable WCHAR support"
+	default n
+	help
+	  Enable WCHAR. WCHAR support is needed for several packages
+
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	default n
