From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 14:17:59 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils
Message-ID: <20090120141759.6F12577108@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 14:17:58 +0000 (Tue, 20 Jan 2009)
New Revision: 24923

Log:
mtd/mtd-utils: sys/acl.h patch is needed for host-mkfs.jffs2 as well

The host stuff seems pretty broken though as we don't build a host version
of liblzo.

Added:
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch

Removed:
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch


Changeset:
Copied: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch (from rev 24922, trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch)
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch	                        (rev 0)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch	2009-01-20 14:17:58 UTC (rev 24923)
@@ -0,0 +1,48 @@
+Author:	Ulf Samuelsson
+Date:	2007-01-25
+
+Log:
+Patch adding "sys/acl.h" needed to compile mtd.
+
+Modified:
+	package/mtd/mtd_acl.patch
+
+Changeset
+	package/mtd/mtd_acl.patch
+
+diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
+--- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
++++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
+@@ -0,0 +1,32 @@
++/*
++  File: linux/posix_acl.h
++
++  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
++*/
++
++
++#ifndef __LINUX_POSIX_ACL_H
++#define __LINUX_POSIX_ACL_H
++
++#define ACL_UNDEFINED_ID	(-1)
++
++/* a_type field in acl_user_posix_entry_t */
++#define ACL_TYPE_ACCESS		(0x8000)
++#define ACL_TYPE_DEFAULT	(0x4000)
++
++/* e_tag entry in struct posix_acl_entry */
++#define ACL_USER_OBJ		(0x01)
++#define ACL_USER		(0x02)
++#define ACL_GROUP_OBJ		(0x04)
++#define ACL_GROUP		(0x08)
++#define ACL_MASK		(0x10)
++#define ACL_OTHER		(0x20)
++
++/* permissions in the e_perm field */
++#define ACL_READ		(0x04)
++#define ACL_WRITE		(0x02)
++#define ACL_EXECUTE		(0x01)
++//#define ACL_ADD		(0x08)
++//#define ACL_DELETE		(0x10)
++
++#endif  /* __LINUX_POSIX_ACL_H */

Deleted: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch	2009-01-20 09:29:50 UTC (rev 24922)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-acl.patch	2009-01-20 14:17:58 UTC (rev 24923)
@@ -1,48 +0,0 @@
-Author:	Ulf Samuelsson
-Date:	2007-01-25
-
-Log:
-Patch adding "sys/acl.h" needed to compile mtd.
-
-Modified:
-	package/mtd/mtd_acl.patch
-
-Changeset
-	package/mtd/mtd_acl.patch
-
-diff -urN mtd_orig-0rig/include/sys/acl.h mtd_orig/include/sys/acl.h
---- mtd_orig-0rig/include/sys/acl.h	1970-01-01 01:00:00.000000000 +0100
-+++ mtd_orig/include/sys/acl.h	2007-01-17 20:11:22.000000000 +0100
-@@ -0,0 +1,32 @@
-+/*
-+  File: linux/posix_acl.h
-+
-+  (C) 2002 Andreas Gruenbacher, <a.gruenbacher@computer.org>
-+*/
-+
-+
-+#ifndef __LINUX_POSIX_ACL_H
-+#define __LINUX_POSIX_ACL_H
-+
-+#define ACL_UNDEFINED_ID	(-1)
-+
-+/* a_type field in acl_user_posix_entry_t */
-+#define ACL_TYPE_ACCESS		(0x8000)
-+#define ACL_TYPE_DEFAULT	(0x4000)
-+
-+/* e_tag entry in struct posix_acl_entry */
-+#define ACL_USER_OBJ		(0x01)
-+#define ACL_USER		(0x02)
-+#define ACL_GROUP_OBJ		(0x04)
-+#define ACL_GROUP		(0x08)
-+#define ACL_MASK		(0x10)
-+#define ACL_OTHER		(0x20)
-+
-+/* permissions in the e_perm field */
-+#define ACL_READ		(0x04)
-+#define ACL_WRITE		(0x02)
-+#define ACL_EXECUTE		(0x01)
-+//#define ACL_ADD		(0x08)
-+//#define ACL_DELETE		(0x10)
-+
-+#endif  /* __LINUX_POSIX_ACL_H */
