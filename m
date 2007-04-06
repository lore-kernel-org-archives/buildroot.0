From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 08:05:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltrace
Message-ID: <20070406150506.2AF3448603@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 08:05:05 -0700 (Fri, 06 Apr 2007)
New Revision: 18351

Log:
- doesn't compile if LFS is off


Modified:
   trunk/buildroot/package/ltrace/Config.in


Changeset:
Modified: trunk/buildroot/package/ltrace/Config.in
===================================================================
--- trunk/buildroot/package/ltrace/Config.in	2007-04-06 15:01:32 UTC (rev 18350)
+++ trunk/buildroot/package/ltrace/Config.in	2007-04-06 15:05:05 UTC (rev 18351)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	default n
+	depends on BR2_LARGEFILE
 	depends on BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
