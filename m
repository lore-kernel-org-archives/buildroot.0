From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 10 Jan 2007 10:39:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/m4
Message-ID: <20070110183910.5F6FB4856D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-10 10:39:08 -0800 (Wed, 10 Jan 2007)
New Revision: 17227

Log:
- bump version


Added:
   trunk/buildroot/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch

Modified:
   trunk/buildroot/package/m4/m4.mk


Changeset:
Added: trunk/buildroot/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch
===================================================================
--- trunk/buildroot/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch	                        (rev 0)
+++ trunk/buildroot/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch	2007-01-10 18:39:08 UTC (rev 17227)
@@ -0,0 +1,13 @@
+--- m4-1.4.8.orig/lib/regcomp.c	2006-09-24 06:28:37.000000000 +0200
++++ m4-1.4.8/lib/regcomp.c	2007-01-06 20:53:10.000000000 +0100
+@@ -871,6 +871,10 @@ init_dfa (re_dfa_t *dfa, size_t pat_len)
+   dfa->state_table = calloc (sizeof (struct re_state_table_entry), table_size);
+   dfa->state_hash_mask = table_size - 1;
+ 
++#ifndef MB_CUR_MAX
++#define MB_CUR_MAX (0)
++#endif
++
+   dfa->mb_cur_max = MB_CUR_MAX;
+ #ifdef _LIBC
+   if (dfa->mb_cur_max == 6

Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2007-01-10 17:46:19 UTC (rev 17226)
+++ trunk/buildroot/package/m4/m4.mk	2007-01-10 18:39:08 UTC (rev 17227)
@@ -3,7 +3,7 @@
 # m4
 #
 #############################################################
-M4_VER:=1.4.4
+M4_VER:=1.4.8
 M4_SOURCE:=m4-$(M4_VER).tar.bz2
 M4_CAT:=$(BZCAT)
 M4_SITE:=http://ftp.gnu.org/pub/gnu/m4
