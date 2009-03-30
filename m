From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 11:53:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25895] trunk/buildroot/package/ntfs-3g
Message-ID: <20090330115348.F32A4775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 11:53:48 +0000 (Mon, 30 Mar 2009)
New Revision: 25895

Log:
ntfs-3g: needs wchar support in toolchain

Closes #187.

Modified:
   trunk/buildroot/package/ntfs-3g/Config.in


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	2009-03-30 11:53:45 UTC (rev 25894)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2009-03-30 11:53:48 UTC (rev 25895)
@@ -5,6 +5,7 @@
 	bool "ntfs-3g"
 	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_LARGEFILE
+	depends on BR2_WCHAR
 	help
 	  The NTFS-3G driver is an open source, freely available
 	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
@@ -15,5 +16,5 @@
 
 	  http://www.ntfs-3g.org/
 
-comment "ntfs-3g requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "ntfs-3g requires a toolchain with LARGEFILE and WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_WCHAR)
