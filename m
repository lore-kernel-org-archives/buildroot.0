From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 07:21:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/gnuconfig
Message-ID: <20070821142100.13029A463F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 07:20:59 -0700 (Tue, 21 Aug 2007)
New Revision: 19616

Log:
- add BR2_HAVE_MANPAGE and BR2_HAVE_INFOPAGE. Selecting these will keep the
  respective documentation on your target filesystem.


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/gnuconfig/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-08-21 13:23:13 UTC (rev 19615)
+++ trunk/buildroot/Config.in	2007-08-21 14:20:59 UTC (rev 19616)
@@ -586,8 +586,6 @@
 
 menu "Build options"
 
-source package/gnuconfig/Config.in
-
 config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd"
@@ -756,6 +754,24 @@
 
 	  WARNING: This is highly experimental at the moment.
 
+config BR2_HAVE_MANPAGES
+	bool "manpages on the target"
+	default n
+	help
+	  Leave the manpages on the target.
+	  If you say n here, your target will not contain any
+	  manpage.
+
+config BR2_HAVE_INFOPAGES
+	bool "infopages on the target"
+	default n
+	help
+	  Leave the infopages on the target.
+	  If you say n here, your target will not contain any
+	  infopage.
+
+source package/gnuconfig/Config.in
+
 endmenu
 
 source "toolchain/Config.in"

Modified: trunk/buildroot/package/gnuconfig/Config.in
===================================================================
--- trunk/buildroot/package/gnuconfig/Config.in	2007-08-21 13:23:13 UTC (rev 19615)
+++ trunk/buildroot/package/gnuconfig/Config.in	2007-08-21 14:20:59 UTC (rev 19616)
@@ -1,6 +1,6 @@
 config BR2_UPDATE_CONFIG
 	bool "update config.sub and config.guess"
-	default n
+	default y
 	help
 		This just exists to easily update the config.sub / config.guess
 		files in packages to the latest version (since many bundled ones
