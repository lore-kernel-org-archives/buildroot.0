From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Dec 2006 00:29:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20061206082940.6CEF7485A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-06 00:29:40 -0800 (Wed, 06 Dec 2006)
New Revision: 16787

Log:
- remove patch for "s3c2410_serial*" that doesn't apply anymore.


Removed:
   trunk/buildroot/package/udev/udev-fix-s3c2410-serial-perms.patch


Changeset:
Deleted: trunk/buildroot/package/udev/udev-fix-s3c2410-serial-perms.patch
===================================================================
--- trunk/buildroot/package/udev/udev-fix-s3c2410-serial-perms.patch	2006-12-06 01:55:59 UTC (rev 16786)
+++ trunk/buildroot/package/udev/udev-fix-s3c2410-serial-perms.patch	2006-12-06 08:29:40 UTC (rev 16787)
@@ -1,12 +0,0 @@
-diff -urp udev-058/etc/udev/frugalware/udev.rules udev-058/etc/udev/frugalware/udev.rules
---- udev-058/etc/udev/frugalware/udev.rules	2005-05-20 21:18:28.000000000 +0100
-+++ udev-058/etc/udev/frugalware/udev.rules	2005-10-26 02:26:25.000000000 +0100
-@@ -40,6 +40,8 @@ KERNEL="ttyUB[0-9]",    NAME="%k", OWNER
- KERNEL="ttyUSB0",       NAME="%k", OWNER="root", GROUP="uucp", MODE="0660"
- KERNEL="ttyUSB1",       NAME="%k", OWNER="root"  GROUP="uucp", MODE="0666"
- 
-+KERNEL="s3c2410_serial*" NAME="%k", OWNER="root", GROUP="uucp", MODE="0660"
-+
- # pty devices
- KERNEL="ptmx"           NAME="%k", OWNER="root", GROUP="tty",  MODE="0666"
- KERNEL="pty[p-za-e][0-9a-f]*" NAME="%k", OWNER="root", GROUP="tty",  MODE="0666"
