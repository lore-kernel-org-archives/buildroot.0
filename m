From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sat, 26 Jan 2008 07:49:13 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzma
Message-ID: <20080126154913.16B0212C577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-01-26 07:49:12 -0800 (Sat, 26 Jan 2008)
New Revision: 20905

Log:
Upped version, no need for patch. (This is still based on lzma SDK 4.32, 
alas, should be just bugfixes.)


Removed:
   trunk/buildroot/package/lzma/lzma.100-futimesat.patch

Modified:
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Deleted: trunk/buildroot/package/lzma/lzma.100-futimesat.patch
===================================================================
--- trunk/buildroot/package/lzma/lzma.100-futimesat.patch	2008-01-26 07:55:58 UTC (rev 20904)
+++ trunk/buildroot/package/lzma/lzma.100-futimesat.patch	2008-01-26 15:49:12 UTC (rev 20905)
@@ -1,14 +0,0 @@
---- lzma-4.32.0beta3.orig/src/lzma/lzmp.cpp	2006-07-06 23:58:46.000000000 +0200
-+++ lzma-4.32.0beta3/src/lzma/lzmp.cpp	2006-08-29 20:21:22.000000000 +0200
-@@ -47,7 +47,11 @@ typedef vector<string> stringVector;
- 
- // For Solaris
- #ifndef HAVE_FUTIMES
-+#ifdef HAVE_FUTIMESAT
- #define futimes(fd, tv) futimesat(fd, NULL, tv)
-+#else
-+#define futimes(fd, tv) 0 /* utimes(fd, NULL, tv)*/
-+#endif
- #endif
- 
- #if defined(_WIN32) || defined(OS2) || defined(MSDOS)

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2008-01-26 07:55:58 UTC (rev 20904)
+++ trunk/buildroot/package/lzma/lzma.mk	2008-01-26 15:49:12 UTC (rev 20905)
@@ -3,7 +3,7 @@
 # lzma
 #
 #############################################################
-LZMA_VERSION:=4.32.0beta3
+LZMA_VERSION:=4.32.4
 LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
 LZMA_CAT:=$(ZCAT)
 LZMA_SITE:=http://tukaani.org/lzma/
