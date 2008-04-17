From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu, 17 Apr 2008 06:40:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sfdisk
Message-ID: <20080417134046.AB4F13C465@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-17 06:40:46 -0700 (Thu, 17 Apr 2008)
New Revision: 21757

Log:
* Reverted index/rindex fix


Removed:
   trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch


Changeset:
Deleted: trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch
===================================================================
--- trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch	2008-04-17 13:28:46 UTC (rev 21756)
+++ trunk/buildroot/package/sfdisk/sfdisk.010.index-rindex-fix.patch	2008-04-17 13:40:46 UTC (rev 21757)
@@ -1,21 +0,0 @@
-diff -ru sfdisk_llseek-fix/sfdisk.c sfdisk_index-rindex-fix/sfdisk.c
---- sfdisk_llseek-fix/sfdisk.c	2008-04-17 08:42:35.000000000 +0000
-+++ sfdisk_index-rindex-fix/sfdisk.c	2008-04-17 09:50:17.000000000 +0000
-@@ -58,6 +58,17 @@
- 
- #define SIZE(a)	(sizeof(a)/sizeof(a[0]))
- 
-+/* 
-+ * Why these wouldn't be defined in string.h, I don't know, there is a block
-+ * testing for BSD, and no other mention of these functions ... NK
-+ */
-+#if !defined(index)
-+#  define index(s,c) strchr((s), (c))
-+#endif
-+#if !defined(rindex)
-+#  define rindex(s,c) strrchr((s), (c))
-+#endif
-+
- /*
-  * Table of contents:
-  *  A. About seeking
