From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Mar 2009 20:20:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: coreutils tar
Message-ID: <20090301202017.4D4B1769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-01 20:20:15 +0000 (Sun, 01 Mar 2009)
New Revision: 25473

Log:
tar/coreutils: use depends rather than select for toolchain options

Modified:
   trunk/buildroot/package/coreutils/Config.in
   trunk/buildroot/package/tar/Config.in


Changeset:
Modified: trunk/buildroot/package/coreutils/Config.in
===================================================================
--- trunk/buildroot/package/coreutils/Config.in	2009-03-01 20:20:09 UTC (rev 25472)
+++ trunk/buildroot/package/coreutils/Config.in	2009-03-01 20:20:15 UTC (rev 25473)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
-	depends on BR2_USE_WCHAR
-	select BR2_UCLIBC_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
@@ -13,3 +12,6 @@
 	  - whoami, who, etc...
 
 	  http://www.gnu.org/software/coreutils/
+
+comment "coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
+	depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)

Modified: trunk/buildroot/package/tar/Config.in
===================================================================
--- trunk/buildroot/package/tar/Config.in	2009-03-01 20:20:09 UTC (rev 25472)
+++ trunk/buildroot/package/tar/Config.in	2009-03-01 20:20:15 UTC (rev 25473)
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
-	depends on BR2_USE_WCHAR
-	select BR2_UCLIBC_PROGRAM_INVOCATION
+	depends on BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
 
 	  http://www.gnu.org/software/tar/
+
+comment "tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
+	depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)
