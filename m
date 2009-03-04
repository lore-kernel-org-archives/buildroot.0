From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 11:14:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic
Message-ID: <20090304111441.2308D7621E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 11:14:40 +0000 (Wed, 04 Mar 2009)
New Revision: 25521

Log:
target/generic: development system needs wchar + program invocation

Modified:
   trunk/buildroot/target/generic/Config.in


Changeset:
Modified: trunk/buildroot/target/generic/Config.in
===================================================================
--- trunk/buildroot/target/generic/Config.in	2009-03-04 09:56:23 UTC (rev 25520)
+++ trunk/buildroot/target/generic/Config.in	2009-03-04 11:14:40 UTC (rev 25521)
@@ -18,6 +18,7 @@
 
 config BR2_TARGET_GENERIC_DEV_SYSTEM
 	bool "Generic development system"
+	depends on BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION
 	select BR2_CCACHE
 	select BR2_PACKAGE_GDB
 	select BR2_PACKAGE_GDB_SERVER
@@ -56,3 +57,5 @@
 	help
 	  Board support for a generic development system.
 
+comment "Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
+	depends on !(BR2_USE_WCHAR && BR2_UCLIBC_PROGRAM_INVOCATION)
