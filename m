From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 06:44:05 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
Message-ID: <20090124064405.AC038769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-24 06:44:04 +0000 (Sat, 24 Jan 2009)
New Revision: 24995

Log:
Revert r24982 (Disable libsexy (with comment) if X is not available)

It's wrong, libsexy doesn't depend on an X server.

Modified:
   trunk/buildroot/package/libsexy/Config.in


Changeset:
Modified: trunk/buildroot/package/libsexy/Config.in
===================================================================
--- trunk/buildroot/package/libsexy/Config.in	2009-01-24 06:25:40 UTC (rev 24994)
+++ trunk/buildroot/package/libsexy/Config.in	2009-01-24 06:44:04 UTC (rev 24995)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_PACKAGE_XSERVER_none
 	help
 	  libsexy is a collection of GTK+ widgets that extend the
 	  functionality of such standard widgets as GtkEntry and
@@ -9,7 +8,3 @@
 	  limitations of the widgets.
 
 	  http://www.chipx86.com/wiki/Libsexy
-
-comment "libsexy       - disabled (requires X-Windows)"
-	depends on BR2_PACKAGE_XSERVER_none
-
