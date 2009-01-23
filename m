From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 23 Jan 2009 17:48:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libsexy
Message-ID: <20090123174850.A9B52769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-23 17:48:49 +0000 (Fri, 23 Jan 2009)
New Revision: 24982

Log:
Disable libsexy (with comment) if X is not available

Modified:
   trunk/buildroot/package/libsexy/Config.in


Changeset:
Modified: trunk/buildroot/package/libsexy/Config.in
===================================================================
--- trunk/buildroot/package/libsexy/Config.in	2009-01-23 13:12:57 UTC (rev 24981)
+++ trunk/buildroot/package/libsexy/Config.in	2009-01-23 17:48:49 UTC (rev 24982)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on !BR2_PACKAGE_XSERVER_none
 	help
 	  libsexy is a collection of GTK+ widgets that extend the
 	  functionality of such standard widgets as GtkEntry and
@@ -8,3 +9,7 @@
 	  limitations of the widgets.
 
 	  http://www.chipx86.com/wiki/Libsexy
+
+comment "libsexy       - disabled (requires X-Windows)"
+	depends on BR2_PACKAGE_XSERVER_none
+
