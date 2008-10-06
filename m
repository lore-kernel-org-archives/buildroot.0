From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 12:54:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
Message-ID: <20081006195458.F38063C7D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 12:54:58 -0700 (Mon, 06 Oct 2008)
New Revision: 23608

Log:
which.mk:
-Update to 2.20 which doesn't depend on readline

Config.in:
-Don't depend on readline any longer


Modified:
   trunk/buildroot/package/which/Config.in
   trunk/buildroot/package/which/which.mk


Changeset:
Modified: trunk/buildroot/package/which/Config.in
===================================================================
--- trunk/buildroot/package/which/Config.in	2008-10-06 19:53:29 UTC (rev 23607)
+++ trunk/buildroot/package/which/Config.in	2008-10-06 19:54:58 UTC (rev 23608)
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_WHICH
 	bool "which"
-	select BR2_READLINE
 	help
 	  The standard 'which' utility.
 

Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2008-10-06 19:53:29 UTC (rev 23607)
+++ trunk/buildroot/package/which/which.mk	2008-10-06 19:54:58 UTC (rev 23608)
@@ -3,7 +3,7 @@
 # which
 #
 #############################################################
-WHICH_VERSION:=2.19
+WHICH_VERSION:=2.20
 WHICH_SOURCE:=which-$(WHICH_VERSION).tar.gz
 WHICH_SITE:=http://www.xs4all.nl/~carlo17/which/
 WHICH_AUTORECONF:=NO
