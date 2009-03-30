From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 11:53:41 +0000 (UTC)
Subject: [Buildroot] svn commit: [25893] trunk/buildroot/package/ntfs-3g
Message-ID: <20090330115341.3E748775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 11:53:40 +0000 (Mon, 30 Mar 2009)
New Revision: 25893

Log:
ntfs-3g: needs libfuse which requires LARGEFILE, so update kconfig to match

Fixup tabs/spaces and trailing spaces mismatch while we're at it.

Modified:
   trunk/buildroot/package/ntfs-3g/Config.in


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	2009-03-30 11:53:37 UTC (rev 25892)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2009-03-30 11:53:40 UTC (rev 25893)
@@ -1,14 +1,19 @@
-comment "ntfs-3g has no inherent support for AVR32" 
+comment "ntfs-3g has no inherent support for AVR32"
 	depends on BR2_avr32 && BR2_PACKAGE_NTFS_3G
 
 config BR2_PACKAGE_NTFS-3G
-        bool "ntfs-3g"
-        help
+	bool "ntfs-3g"
+	select BR2_PACKAGE_LIBFUSE
+	depends on BR2_LARGEFILE
+	help
 	  The NTFS-3G driver is an open source, freely available
-          read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
-          and Haiku. It provides safe and fast handling of the Windows
-          XP, Windows Server 2003, Windows 2000 and Windows Vista file
-          systems. Most POSIX file system operations are supported, with
-          the exception of full file ownership and access right support.
+	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
+	  and Haiku. It provides safe and fast handling of the Windows
+	  XP, Windows Server 2003, Windows 2000 and Windows Vista file
+	  systems. Most POSIX file system operations are supported, with
+	  the exception of full file ownership and access right support.
 
 	  http://www.ntfs-3g.org/
+
+comment "ntfs-3g requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
