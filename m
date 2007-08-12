From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 17:14:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: coreutils
	findutils gawk sed tar
Message-ID: <20070812001459.B0EC2A65B5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 17:14:58 -0700 (Sat, 11 Aug 2007)
New Revision: 19453

Log:
Avoid building packages requiring WCHAR, when not enabled

Modified:
   trunk/buildroot/package/coreutils/Config.in
   trunk/buildroot/package/findutils/Config.in
   trunk/buildroot/package/gawk/Config.in
   trunk/buildroot/package/sed/Config.in
   trunk/buildroot/package/tar/Config.in


Changeset:
Modified: trunk/buildroot/package/coreutils/Config.in
===================================================================
--- trunk/buildroot/package/coreutils/Config.in	2007-08-12 00:03:23 UTC (rev 19452)
+++ trunk/buildroot/package/coreutils/Config.in	2007-08-12 00:14:58 UTC (rev 19453)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
 	default n
+	depends on BR2_USE_WCHAR
 	help
 	  All of the basic file/text/shell utilities.  These are the 
 	  core utilities which are expected to exist on every system.  

Modified: trunk/buildroot/package/findutils/Config.in
===================================================================
--- trunk/buildroot/package/findutils/Config.in	2007-08-12 00:03:23 UTC (rev 19452)
+++ trunk/buildroot/package/findutils/Config.in	2007-08-12 00:14:58 UTC (rev 19453)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
 	default n
+	depends on BR2_USE_WCHAR
 	help
 	  Basic directory searching utilities.  Provides the 
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.

Modified: trunk/buildroot/package/gawk/Config.in
===================================================================
--- trunk/buildroot/package/gawk/Config.in	2007-08-12 00:03:23 UTC (rev 19452)
+++ trunk/buildroot/package/gawk/Config.in	2007-08-12 00:14:58 UTC (rev 19453)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GAWK
 	bool "gawk"
 	default n
+	depends on BR2_USE_WCHAR
 	help
 	  A special-purpose programming language which is data driven 
 	  rather than procedural.  Allows for simple data-reformatting jobs 

Modified: trunk/buildroot/package/sed/Config.in
===================================================================
--- trunk/buildroot/package/sed/Config.in	2007-08-12 00:03:23 UTC (rev 19452)
+++ trunk/buildroot/package/sed/Config.in	2007-08-12 00:14:58 UTC (rev 19453)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SED
 	bool "sed"
 	default n
+	depends on BR2_USE_WCHAR
 	help
 	  Super-useful stream editor.
 

Modified: trunk/buildroot/package/tar/Config.in
===================================================================
--- trunk/buildroot/package/tar/Config.in	2007-08-12 00:03:23 UTC (rev 19452)
+++ trunk/buildroot/package/tar/Config.in	2007-08-12 00:14:58 UTC (rev 19453)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
 	default n
+	depends on BR2_USE_WCHAR
 	help
 	  A program that saves many files together into a single tape or disk 
 	  archive, and can restore individual files from the archive.
