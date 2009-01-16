From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 10:27:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot:  target/device
Message-ID: <20090116102740.18CD5768D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 10:27:39 +0000 (Fri, 16 Jan 2009)
New Revision: 24867

Log:
BR2_PRIMARY_SITE: move to Mirrors and Download locations menu

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/target/device/Config.in.mirrors


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-01-16 10:27:27 UTC (rev 24866)
+++ trunk/buildroot/Config.in	2009-01-16 10:27:39 UTC (rev 24867)
@@ -15,15 +15,6 @@
 
 menu "Build options"
 
-config BR2_PRIMARY_SITE
-	string "Primary download site"
-	default ""
-	help
-	  Primary site to download from. If this option is set then buildroot
-	  will try to download package source first from this site and try the
-	  default if the file is not found.
-	  NOTE: This only works for packages using the Makefile.autotools.in
-
 config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd"

Modified: trunk/buildroot/target/device/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Config.in.mirrors	2009-01-16 10:27:27 UTC (rev 24866)
+++ trunk/buildroot/target/device/Config.in.mirrors	2009-01-16 10:27:39 UTC (rev 24867)
@@ -1,5 +1,14 @@
 menu "Mirrors and Download locations"
 
+config BR2_PRIMARY_SITE
+	string "Primary download site"
+	default ""
+	help
+	  Primary site to download from. If this option is set then buildroot
+	  will try to download package source first from this site and try the
+	  default if the file is not found.
+	  NOTE: This only works for packages using the Makefile.autotools.in
+
 config BR2_SOURCEFORGE_MIRROR
 	string "Sourceforge mirror site"
 	default "easynews"
