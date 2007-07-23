From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 12:04:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070723190427.1D9BFA6868@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 12:04:27 -0700 (Mon, 23 Jul 2007)
New Revision: 19238

Log:
Add configuration option allowing hiding packages needing WCHAR

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-23 18:49:16 UTC (rev 19237)
+++ trunk/buildroot/Config.in	2007-07-23 19:04:27 UTC (rev 19238)
@@ -687,6 +687,12 @@
 	help
 	  This option hides outdated/obsolete versions of packages.
 
+config BR2_USE_WCHAR
+	bool "Show packages that are require WCHAR support"
+	default y
+	help
+	  This option hides packages which cannot be built without WCHAR.
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	default n
