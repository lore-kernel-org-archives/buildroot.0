From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  2 Feb 2009 07:17:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts/test
Message-ID: <20090202071725.5DBD7764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-02-02 07:17:23 +0000 (Mon, 02 Feb 2009)
New Revision: 25213

Log:
Do not build target compiler during test

Modified:
   trunk/buildroot/scripts/test/Config.in.test.buildall


Changeset:
Modified: trunk/buildroot/scripts/test/Config.in.test.buildall
===================================================================
--- trunk/buildroot/scripts/test/Config.in.test.buildall	2009-02-02 00:39:14 UTC (rev 25212)
+++ trunk/buildroot/scripts/test/Config.in.test.buildall	2009-02-02 07:17:23 UTC (rev 25213)
@@ -18,7 +18,7 @@
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FLEX
 		select BR2_PACKAGE_FLEX_LIBFL
-	select BR2_PACKAGE_GCC_TARGET
+# BR2_PACKAGE_GCC_TARGET is not set
 	select BR2_PACKAGE_MAKE
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_AUTOMAKE
@@ -119,7 +119,6 @@
 		select BR2_PACKAGE_IPSEC_TOOLS_READLINE
 # BR2_PACKAGE_IPSEC_TOOLS_IPV6 is not set
 # BR2_PACKAGE_IPSEC_TOOLS_LIBS is not set
-
 	select BR2_PACKAGE_IPTABLES
 	select BR2_PACKAGE_KISMET
 	select BR2_PACKAGE_L2TP
