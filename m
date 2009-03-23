From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 21:45:52 +0000 (UTC)
Subject: [Buildroot] svn commit: [25798] trunk/buildroot: package/autoconf
	package/automake target etc...
Message-ID: <20090323214553.2505776A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 21:45:52 +0000 (Mon, 23 Mar 2009)
New Revision: 25798

Log:
package: auto* needs perl

Modified:
   trunk/buildroot/package/autoconf/Config.in
   trunk/buildroot/package/automake/Config.in
   trunk/buildroot/target/generic/Config.in


Changeset:
Modified: trunk/buildroot/package/autoconf/Config.in
===================================================================
--- trunk/buildroot/package/autoconf/Config.in	2009-03-23 13:32:11 UTC (rev 25797)
+++ trunk/buildroot/package/autoconf/Config.in	2009-03-23 21:45:52 UTC (rev 25798)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
+	select BR2_PACKAGE_MICROPERL
 	help
 	  Extensible program for developing configure scripts.  These
 	  scripts handle all the mundane system/feature detection.

Modified: trunk/buildroot/package/automake/Config.in
===================================================================
--- trunk/buildroot/package/automake/Config.in	2009-03-23 13:32:11 UTC (rev 25797)
+++ trunk/buildroot/package/automake/Config.in	2009-03-23 21:45:52 UTC (rev 25798)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
 	select BR2_PACKAGE_AUTOCONF
+	select BR2_PACKAGE_MICROPERL
 	help
 	  Tool for automatically generating Makefile's for input to
 	  configure scripts (made by autoconf).

Modified: trunk/buildroot/target/generic/Config.in
===================================================================
--- trunk/buildroot/target/generic/Config.in	2009-03-23 13:32:11 UTC (rev 25797)
+++ trunk/buildroot/target/generic/Config.in	2009-03-23 21:45:52 UTC (rev 25798)
@@ -37,6 +37,7 @@
 	select BR2_PACKAGE_PATCH
 	select BR2_PACKAGE_SED
 	select BR2_PACKAGE_TAR
+	select BR2_PACKAGE_MICROPERL
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_AUTOMAKE
 	select BR2_PACKAGE_DROPBEAR
