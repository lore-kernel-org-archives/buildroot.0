From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:36:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20070812233658.3CE8BA685C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:36:57 -0700 (Sun, 12 Aug 2007)
New Revision: 19479

Log:
grep depends on gettext

Modified:
   trunk/buildroot/package/grep/Config.in


Changeset:
Modified: trunk/buildroot/package/grep/Config.in
===================================================================
--- trunk/buildroot/package/grep/Config.in	2007-08-12 23:36:27 UTC (rev 19478)
+++ trunk/buildroot/package/grep/Config.in	2007-08-12 23:36:57 UTC (rev 19479)
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
 	default n
+	select BR2_PACKAGE_GETTEXT
+	select BR2_PACKAGE_LIBINTL
 	help
 	  The GNU regular expression matcher.
-
+	  Needs gettext
 	  http://www.gnu.org/software/grep/grep.html
