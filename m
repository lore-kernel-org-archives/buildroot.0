From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 20:31:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20090121203147.E949D768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-21 20:31:47 +0000 (Wed, 21 Jan 2009)
New Revision: 24943

Log:
openssl: fix build without largefile support

Added:
   trunk/buildroot/package/openssl/openssl-0.9.8g-dont-force-large-file.patch


Changeset:
Added: trunk/buildroot/package/openssl/openssl-0.9.8g-dont-force-large-file.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8g-dont-force-large-file.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8g-dont-force-large-file.patch	2009-01-21 20:31:47 UTC (rev 24943)
@@ -0,0 +1,19 @@
+[patch]: bss_file.c: don't force largefile mode
+---
+ crypto/bio/bss_file.c |    3 ---
+ 1 file changed, 3 deletions(-)
+
+Index: openssl-0.9.8g/crypto/bio/bss_file.c
+===================================================================
+--- openssl-0.9.8g.orig/crypto/bio/bss_file.c
++++ openssl-0.9.8g/crypto/bio/bss_file.c
+@@ -78,9 +78,6 @@
+  * sequential access of large files without extra "magic" comprise *BSD,
+  * Darwin, IRIX...
+  */
+-#ifndef _FILE_OFFSET_BITS
+-#define _FILE_OFFSET_BITS 64
+-#endif
+ #endif
+ 
+ #include <stdio.h>
