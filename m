From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 13:24:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.3.2
Message-ID: <20090205132415.4C29C76454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 13:24:14 +0000 (Thu, 05 Feb 2009)
New Revision: 25249

Log:
toolchain/gcc/4.3.2: remove unused and unneeded fix for PR34205

We don't use the iwmmxt abi anymore.

Removed:
   trunk/buildroot/toolchain/gcc/4.3.2/995-short-enums.diff


Changeset:
Deleted: trunk/buildroot/toolchain/gcc/4.3.2/995-short-enums.diff
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/995-short-enums.diff	2009-02-05 13:24:11 UTC (rev 25248)
+++ trunk/buildroot/toolchain/gcc/4.3.2/995-short-enums.diff	2009-02-05 13:24:14 UTC (rev 25249)
@@ -1,42 +0,0 @@
-see gcc PR34205
-Index: gcc-4.3.0/gcc/tree.h
-===================================================================
---- gcc-4.3.0/gcc/tree.h	(revision 130511)
-+++ gcc-4.3.0/gcc/tree.h	(working copy)
-@@ -38,6 +38,7 @@
- 
-   LAST_AND_UNUSED_TREE_CODE	/* A convenient way to get a value for
- 				   NUM_TREE_CODES.  */
-+  ,__LAST_AND_UNUSED_TREE_CODE=32767 /* Force 16bit width.  */
- };
- 
- #undef DEFTREECODE
-Index: gcc-4.3.0/gcc/rtl.h
-===================================================================
---- gcc-4.3.0/gcc/rtl.h	(revision 130511)
-+++ gcc-4.3.0/gcc/rtl.h	(working copy)
-@@ -48,9 +48,11 @@
- #include "rtl.def"		/* rtl expressions are documented here */
- #undef DEF_RTL_EXPR
- 
--  LAST_AND_UNUSED_RTX_CODE};	/* A convenient way to get a value for
-+  LAST_AND_UNUSED_RTX_CODE	/* A convenient way to get a value for
- 				   NUM_RTX_CODE.
- 				   Assumes default enum value assignment.  */
-+  ,__LAST_AND_UNUSED_RTX_CODE=32767 /* Force 16bit width.  */
-+};
- 
- #define NUM_RTX_CODE ((int) LAST_AND_UNUSED_RTX_CODE)
- 				/* The cast here, saves many elsewhere.  */
-Index: gcc-4.3.0/gcc/c-common.h
-===================================================================
---- gcc-4.3.0/gcc/c-common.h	(revision 130511)
-+++ gcc-4.3.0/gcc/c-common.h	(working copy)
-@@ -125,6 +125,7 @@
-   RID_LAST_AT = RID_AT_IMPLEMENTATION,
-   RID_FIRST_PQ = RID_IN,
-   RID_LAST_PQ = RID_ONEWAY
-+  ,__LAST_AND_UNUSED_RID=32767 /* Force 16bit width.  */
- };
- 
- #define OBJC_IS_AT_KEYWORD(rid) \
