From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  9 May 2007 19:37:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070510023717.418F348007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-09 19:37:16 -0700 (Wed, 09 May 2007)
New Revision: 18600

Log:
Re-create patches for released 0.9.29 version.


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch	2007-05-09 22:58:59 UTC (rev 18599)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-conditional-sched_affinity.patch	2007-05-10 02:37:16 UTC (rev 18600)
@@ -1,7 +1,6 @@
-Index: uClibc/libc/sysdeps/linux/common/sched_getaffinity.c
-===================================================================
---- uClibc/libc/sysdeps/linux/common/sched_getaffinity.c	(revision 17880)
-+++ uClibc/libc/sysdeps/linux/common/sched_getaffinity.c	(working copy)
+diff -ur uClibc-0.9.29/libc/sysdeps/linux/common/sched_getaffinity.c uClibc-0.9.29-patched/libc/sysdeps/linux/common/sched_getaffinity.c
+--- uClibc-0.9.29/libc/sysdeps/linux/common/sched_getaffinity.c	2007-02-12 16:52:32.000000000 -0600
++++ uClibc-0.9.29-patched/libc/sysdeps/linux/common/sched_getaffinity.c	2007-05-09 18:05:09.397411811 -0500
 @@ -29,6 +29,7 @@
  #include <sys/param.h>
  #include <sys/types.h>
@@ -26,10 +25,9 @@
  #endif
 +
 +#endif
-Index: uClibc/libc/sysdeps/linux/common/sched_setaffinity.c
-===================================================================
---- uClibc/libc/sysdeps/linux/common/sched_setaffinity.c	(revision 17880)
-+++ uClibc/libc/sysdeps/linux/common/sched_setaffinity.c	(working copy)
+diff -ur uClibc-0.9.29/libc/sysdeps/linux/common/sched_setaffinity.c uClibc-0.9.29-patched/libc/sysdeps/linux/common/sched_setaffinity.c
+--- uClibc-0.9.29/libc/sysdeps/linux/common/sched_setaffinity.c	2007-02-12 16:52:32.000000000 -0600
++++ uClibc-0.9.29-patched/libc/sysdeps/linux/common/sched_setaffinity.c	2007-05-09 18:05:09.397411811 -0500
 @@ -31,6 +31,7 @@
  #include <sys/types.h>
  #include <alloca.h>
@@ -50,6 +48,6 @@
 +	return -1;
 +}
 +*/
++#endif
  #endif
  #endif
-+#endif

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff	2007-05-09 22:58:59 UTC (rev 18599)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff	2007-05-10 02:37:16 UTC (rev 18600)
@@ -1,8 +1,7 @@
-Index: uClibc_trunk/libc/inet/rpc/rcmd.c
-===================================================================
---- uClibc_trunk/libc/inet/rpc/rcmd.c	(revision 17397)
-+++ uClibc_trunk/libc/inet/rpc/rcmd.c	(working copy)
-@@ -126,7 +126,7 @@ libc_hidden_proto(accept)
+diff -ur uClibc-0.9.29/libc/inet/rpc/rcmd.c uClibc-0.9.29-patched/libc/inet/rpc/rcmd.c
+--- uClibc-0.9.29/libc/inet/rpc/rcmd.c	2007-01-10 11:46:19.000000000 -0600
++++ uClibc-0.9.29-patched/libc/inet/rpc/rcmd.c	2007-05-09 18:05:21.638421151 -0500
+@@ -126,7 +126,7 @@
  libc_hidden_proto(listen)
  libc_hidden_proto(sigsetmask)
  libc_hidden_proto(getc_unlocked)
@@ -11,11 +10,10 @@
  libc_hidden_proto(fopen)
  libc_hidden_proto(fclose)
  libc_hidden_proto(fprintf)
-Index: uClibc_trunk/libc/inet/rpc/ruserpass.c
-===================================================================
---- uClibc_trunk/libc/inet/rpc/ruserpass.c	(revision 17397)
-+++ uClibc_trunk/libc/inet/rpc/ruserpass.c	(working copy)
-@@ -63,7 +63,7 @@ libc_hidden_proto(fileno)
+diff -ur uClibc-0.9.29/libc/inet/rpc/ruserpass.c uClibc-0.9.29-patched/libc/inet/rpc/ruserpass.c
+--- uClibc-0.9.29/libc/inet/rpc/ruserpass.c	2006-03-23 05:14:16.000000000 -0600
++++ uClibc-0.9.29-patched/libc/inet/rpc/ruserpass.c	2007-05-09 18:05:21.638421151 -0500
+@@ -63,7 +63,7 @@
  libc_hidden_proto(fopen)
  libc_hidden_proto(fclose)
  libc_hidden_proto(getc_unlocked)
@@ -24,11 +22,45 @@
  
  #define _(X)  (X)
  /* #include "ftp_var.h" */
-Index: uClibc_trunk/libc/pwd_grp/pwd_grp.c
-===================================================================
---- uClibc_trunk/libc/pwd_grp/pwd_grp.c	(revision 17397)
-+++ uClibc_trunk/libc/pwd_grp/pwd_grp.c	(working copy)
-@@ -43,11 +43,12 @@ libc_hidden_proto(strlen)
+diff -ur uClibc-0.9.29/libc/misc/error/error.c uClibc-0.9.29-patched/libc/misc/error/error.c
+--- uClibc-0.9.29/libc/misc/error/error.c	2006-05-04 09:44:13.000000000 -0500
++++ uClibc-0.9.29-patched/libc/misc/error/error.c	2007-05-09 18:05:21.646421810 -0500
+@@ -30,11 +30,14 @@
+ libc_hidden_proto(strerror)
+ libc_hidden_proto(fprintf)
+ libc_hidden_proto(exit)
++//#undef putc
+ libc_hidden_proto(putc)
++libc_hidden_proto(fputc)
+ libc_hidden_proto(vfprintf)
+ libc_hidden_proto(fflush)
+-libc_hidden_proto(fputc)
+-libc_hidden_proto(__fputc_unlocked)
++//#ifdef __UCLIBC_HAS_STDIO_PUTC_MACRO__
++libc_hidden_proto(fputc_unlocked)
++//#endif
+ 
+ /* This variable is incremented each time `error' is called.  */
+ unsigned int error_message_count = 0;
+diff -ur uClibc-0.9.29/libc/misc/ttyent/getttyent.c uClibc-0.9.29-patched/libc/misc/ttyent/getttyent.c
+--- uClibc-0.9.29/libc/misc/ttyent/getttyent.c	2006-12-07 17:24:02.000000000 -0600
++++ uClibc-0.9.29-patched/libc/misc/ttyent/getttyent.c	2007-05-09 18:05:21.646421810 -0500
+@@ -44,8 +44,10 @@
+ libc_hidden_proto(__fsetlocking)
+ libc_hidden_proto(rewind)
+ libc_hidden_proto(fgets_unlocked)
++//#undef getc_unlocked
+ libc_hidden_proto(getc_unlocked)
+-libc_hidden_proto(__fgetc_unlocked)
++//#undef fgetc_unlocked
++libc_hidden_proto(fgetc_unlocked)
+ libc_hidden_proto(fopen)
+ libc_hidden_proto(fclose)
+ libc_hidden_proto(abort)
+diff -ur uClibc-0.9.29/libc/pwd_grp/pwd_grp.c uClibc-0.9.29-patched/libc/pwd_grp/pwd_grp.c
+--- uClibc-0.9.29/libc/pwd_grp/pwd_grp.c	2007-04-13 03:32:18.000000000 -0500
++++ uClibc-0.9.29-patched/libc/pwd_grp/pwd_grp.c	2007-05-09 18:05:21.638421151 -0500
+@@ -43,11 +43,12 @@
  libc_hidden_proto(strtoul)
  libc_hidden_proto(rewind)
  libc_hidden_proto(fgets_unlocked)
@@ -42,7 +74,7 @@
  #ifdef __UCLIBC_HAS_XLOCALE__
  libc_hidden_proto(__ctype_b_loc)
  #elif __UCLIBC_HAS_CTYPE_TABLES__
-@@ -809,7 +810,7 @@ int putgrent(const struct group *__restr
+@@ -801,7 +802,7 @@
  
  			do {
  				if (!*m) {
@@ -51,7 +83,7 @@
  						rv = 0;
  					}
  					break;
-@@ -875,7 +876,7 @@ int putspent(const struct spwd *p, FILE 
+@@ -867,7 +868,7 @@
  		goto DO_UNLOCK;
  	}
  
@@ -60,34 +92,10 @@
  		rv = 0;
  	}
  
-Index: uClibc_trunk/libc/stdio/fgets.c
-===================================================================
---- uClibc_trunk/libc/stdio/fgets.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/fgets.c	(working copy)
-@@ -10,8 +10,7 @@
- libc_hidden_proto(fgets_unlocked)
- 
- #ifdef __DO_UNLOCKED
--
--libc_hidden_proto(__fgetc_unlocked)
-+libc_hidden_proto(fgetc_unlocked)
- 
- char *fgets_unlocked(char *__restrict s, int n,
- 					   register FILE * __restrict stream)
-@@ -38,7 +37,7 @@ char *fgets_unlocked(char *__restrict s,
- 				break;
- 			}
- 		} else {
--			if ((c = __fgetc_unlocked(stream)) == EOF) {
-+			if ((c = fgetc_unlocked(stream)) == EOF) {
- 				if (__FERROR_UNLOCKED(stream)) {
- 					goto ERROR;
- 				}
-Index: uClibc_trunk/libc/stdio/_scanf.c
-===================================================================
---- uClibc_trunk/libc/stdio/_scanf.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/_scanf.c	(working copy)
-@@ -86,7 +86,8 @@ libc_hidden_proto(vfscanf)
+diff -ur uClibc-0.9.29/libc/stdio/_scanf.c uClibc-0.9.29-patched/libc/stdio/_scanf.c
+--- uClibc-0.9.29/libc/stdio/_scanf.c	2007-01-20 12:32:10.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/_scanf.c	2007-05-09 18:05:21.642421481 -0500
+@@ -86,7 +86,8 @@
  libc_hidden_proto(vsscanf)
  libc_hidden_proto(fclose)
  libc_hidden_proto(getc_unlocked)
@@ -97,58 +105,82 @@
  #ifdef __UCLIBC_HAS_WCHAR__
  libc_hidden_proto(wcslen)
  libc_hidden_proto(vfwscanf)
-Index: uClibc_trunk/libc/stdio/putwchar.c
-===================================================================
---- uClibc_trunk/libc/stdio/putwchar.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/putwchar.c	(working copy)
-@@ -22,7 +22,8 @@ strong_alias(putwchar_unlocked,putwchar)
+diff -ur uClibc-0.9.29/libc/stdio/fgetc.c uClibc-0.9.29-patched/libc/stdio/fgetc.c
+--- uClibc-0.9.29/libc/stdio/fgetc.c	2006-01-15 16:41:03.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/fgetc.c	2007-05-09 18:05:21.642421481 -0500
+@@ -13,13 +13,13 @@
+ #undef getc
+ #undef getc_unlocked
  
- #elif defined __UCLIBC_HAS_THREADS__
+-libc_hidden_proto(__fgetc_unlocked)
++libc_hidden_proto(fgetc_unlocked)
  
--libc_hidden_proto(__fputc_unlocked)
-+//#undef fputc_unlocked
-+libc_hidden_proto(fputc_unlocked)
- /* psm: should this be fputwc? */
- libc_hidden_proto(fputc)
+ #ifdef __DO_UNLOCKED
  
-Index: uClibc_trunk/libc/stdio/getchar.c
-===================================================================
---- uClibc_trunk/libc/stdio/getchar.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/getchar.c	(working copy)
-@@ -7,7 +7,8 @@
+ libc_hidden_proto(fflush_unlocked)
  
- #include "_stdio.h"
+-int __fgetc_unlocked(FILE *stream)
++int fgetc_unlocked(FILE *stream)
+ {
+ 	__STDIO_STREAM_VALIDATE(stream);
  
--libc_hidden_proto(__fgetc_unlocked)
-+//#undef fgetc_unlocked
-+libc_hidden_proto(fgetc_unlocked)
+@@ -73,26 +73,22 @@
  
- #undef getchar
- #ifdef __DO_UNLOCKED
-Index: uClibc_trunk/libc/stdio/putchar.c
-===================================================================
---- uClibc_trunk/libc/stdio/putchar.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/putchar.c	(working copy)
-@@ -7,7 +7,8 @@
+ 	return EOF;
+ }
+-libc_hidden_def(__fgetc_unlocked)
+-
+-libc_hidden_proto(fgetc_unlocked)
+-strong_alias(__fgetc_unlocked,fgetc_unlocked)
+ libc_hidden_def(fgetc_unlocked)
  
- #include "_stdio.h"
+ //libc_hidden_proto(__getc_unlocked)
+-//strong_alias(__fgetc_unlocked,__getc_unlocked)
++//strong_alias(fgetc_unlocked,__getc_unlocked)
+ //libc_hidden_def(__getc_unlocked)
  
--libc_hidden_proto(__fputc_unlocked)
-+//#undef fputc_unlocked
-+libc_hidden_proto(fputc_unlocked)
+ libc_hidden_proto(getc_unlocked)
+-strong_alias(__fgetc_unlocked,getc_unlocked)
++strong_alias(fgetc_unlocked,getc_unlocked)
+ libc_hidden_def(getc_unlocked)
  
- #undef putchar
+ #ifndef __UCLIBC_HAS_THREADS__
+ libc_hidden_proto(fgetc)
+-strong_alias(__fgetc_unlocked,fgetc)
++strong_alias(fgetc_unlocked,fgetc)
+ libc_hidden_def(fgetc)
+ 
+-strong_alias(__fgetc_unlocked,getc)
++strong_alias(fgetc_unlocked,getc)
+ #endif
+ 
+ #elif defined __UCLIBC_HAS_THREADS__
+diff -ur uClibc-0.9.29/libc/stdio/fgets.c uClibc-0.9.29-patched/libc/stdio/fgets.c
+--- uClibc-0.9.29/libc/stdio/fgets.c	2006-01-15 16:41:03.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/fgets.c	2007-05-09 18:05:21.638421151 -0500
+@@ -10,8 +10,7 @@
+ libc_hidden_proto(fgets_unlocked)
+ 
  #ifdef __DO_UNLOCKED
-Index: uClibc_trunk/libc/stdio/fputc.c
-===================================================================
---- uClibc_trunk/libc/stdio/fputc.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/fputc.c	(working copy)
-@@ -12,11 +12,11 @@
- #undef putc
- #undef putc_unlocked
+-
+-libc_hidden_proto(__fgetc_unlocked)
++libc_hidden_proto(fgetc_unlocked)
  
--libc_hidden_proto(__fputc_unlocked)
-+libc_hidden_proto(fputc_unlocked)
+ char *fgets_unlocked(char *__restrict s, int n,
+ 					   register FILE * __restrict stream)
+@@ -38,7 +37,7 @@
+ 				break;
+ 			}
+ 		} else {
+-			if ((c = __fgetc_unlocked(stream)) == EOF) {
++			if ((c = fgetc_unlocked(stream)) == EOF) {
+ 				if (__FERROR_UNLOCKED(stream)) {
+ 					goto ERROR;
+ 				}
+diff -ur uClibc-0.9.29/libc/stdio/fputc.c uClibc-0.9.29-patched/libc/stdio/fputc.c
+--- uClibc-0.9.29/libc/stdio/fputc.c	2007-04-14 12:03:18.000000000 -0500
++++ uClibc-0.9.29-patched/libc/stdio/fputc.c	2007-05-09 20:50:51.350629927 -0500
+@@ -16,7 +16,7 @@
  
  #ifdef __DO_UNLOCKED
  
@@ -157,20 +189,20 @@
  {
  	__STDIO_STREAM_VALIDATE(stream);
  
-@@ -70,20 +70,20 @@ int __fputc_unlocked(int c, register FIL
+@@ -70,22 +70,22 @@
   BAD:
  	return EOF;
  }
 -libc_hidden_def(__fputc_unlocked)
--
--libc_hidden_proto(fputc_unlocked)
++libc_hidden_def(fputc_unlocked)
+ 
+ /* exposing these would be fundamentally *wrong*! fix you, instead! */
+ /* libc_hidden_proto(fputc_unlocked) */
 -strong_alias(__fputc_unlocked,fputc_unlocked)
- libc_hidden_def(fputc_unlocked)
++/* strong_alias(__fputc_unlocked,fputc_unlocked) */
+ /* exposing these would be fundamentally *wrong*! fix you, instead! */
+ /* libc_hidden_def(fputc_unlocked) */
  
-+//libc_hidden_proto(fputc_unlocked)
-+//strong_alias(__fputc_unlocked,fputc_unlocked)
-+//libc_hidden_def(fputc_unlocked)
-+
  libc_hidden_proto(putc_unlocked)
 -strong_alias(__fputc_unlocked,putc_unlocked)
 +strong_alias(fputc_unlocked,putc_unlocked)
@@ -185,10 +217,22 @@
  libc_hidden_def(putc)
  #endif
  
-Index: uClibc_trunk/libc/stdio/getdelim.c
-===================================================================
---- uClibc_trunk/libc/stdio/getdelim.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/getdelim.c	(working copy)
+diff -ur uClibc-0.9.29/libc/stdio/getchar.c uClibc-0.9.29-patched/libc/stdio/getchar.c
+--- uClibc-0.9.29/libc/stdio/getchar.c	2006-12-19 22:30:25.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/getchar.c	2007-05-09 18:05:21.642421481 -0500
+@@ -7,7 +7,8 @@
+ 
+ #include "_stdio.h"
+ 
+-libc_hidden_proto(__fgetc_unlocked)
++//#undef fgetc_unlocked
++libc_hidden_proto(fgetc_unlocked)
+ 
+ #undef getchar
+ #ifdef __DO_UNLOCKED
+diff -ur uClibc-0.9.29/libc/stdio/getdelim.c uClibc-0.9.29-patched/libc/stdio/getdelim.c
+--- uClibc-0.9.29/libc/stdio/getdelim.c	2006-02-13 02:52:46.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/getdelim.c	2007-05-09 18:05:21.642421481 -0500
 @@ -11,8 +11,8 @@
  #include "_stdio.h"
  
@@ -200,10 +244,22 @@
  
  /* Note: There is a defect in this function.  (size_t vs ssize_t). */
  
-Index: uClibc_trunk/libc/stdio/puts.c
-===================================================================
---- uClibc_trunk/libc/stdio/puts.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/puts.c	(working copy)
+diff -ur uClibc-0.9.29/libc/stdio/old_vfprintf.c uClibc-0.9.29-patched/libc/stdio/old_vfprintf.c
+--- uClibc-0.9.29/libc/stdio/old_vfprintf.c	2006-01-22 13:35:08.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/old_vfprintf.c	2007-05-09 18:05:21.642421481 -0500
+@@ -149,7 +149,8 @@
+ libc_hidden_proto(strnlen)
+ libc_hidden_proto(memcpy)
+ libc_hidden_proto(putc_unlocked)
+-libc_hidden_proto(__fputc_unlocked)
++//#undef fputc_unlocked
++libc_hidden_proto(fputc_unlocked)
+ libc_hidden_proto(__glibc_strerror_r)
+ 
+ /*  #undef __UCLIBC_HAS_FLOATS__ */
+diff -ur uClibc-0.9.29/libc/stdio/putchar.c uClibc-0.9.29-patched/libc/stdio/putchar.c
+--- uClibc-0.9.29/libc/stdio/putchar.c	2006-01-13 18:58:03.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/putchar.c	2007-05-09 18:05:21.642421481 -0500
 @@ -7,7 +7,8 @@
  
  #include "_stdio.h"
@@ -211,10 +267,23 @@
 -libc_hidden_proto(__fputc_unlocked)
 +//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
+ 
+ #undef putchar
+ #ifdef __DO_UNLOCKED
+diff -ur uClibc-0.9.29/libc/stdio/puts.c uClibc-0.9.29-patched/libc/stdio/puts.c
+--- uClibc-0.9.29/libc/stdio/puts.c	2006-01-13 18:58:03.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/puts.c	2007-05-09 18:05:21.642421481 -0500
+@@ -7,7 +7,8 @@
+ 
+ #include "_stdio.h"
+ 
+-libc_hidden_proto(__fputc_unlocked)
++//#undef fputc_unlocked
++libc_hidden_proto(fputc_unlocked)
  libc_hidden_proto(fputs_unlocked)
  
  int puts(register const char * __restrict s)
-@@ -25,7 +26,7 @@ int puts(register const char * __restric
+@@ -25,7 +26,7 @@
  	/* Note: Nonportable as fputs need only return nonnegative on success. */
  	if ((n = fputs_unlocked(s, stream)) != EOF) {
  		++n;
@@ -223,100 +292,32 @@
  			n = EOF;
  		}
  	}
-Index: uClibc_trunk/libc/stdio/old_vfprintf.c
-===================================================================
---- uClibc_trunk/libc/stdio/old_vfprintf.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/old_vfprintf.c	(working copy)
-@@ -149,7 +149,8 @@ libc_hidden_proto(strlen)
- libc_hidden_proto(strnlen)
- libc_hidden_proto(memcpy)
- libc_hidden_proto(putc_unlocked)
--libc_hidden_proto(__fputc_unlocked)
-+//#undef fputc_unlocked
-+libc_hidden_proto(fputc_unlocked)
- libc_hidden_proto(__glibc_strerror_r)
+diff -ur uClibc-0.9.29/libc/stdio/putwchar.c uClibc-0.9.29-patched/libc/stdio/putwchar.c
+--- uClibc-0.9.29/libc/stdio/putwchar.c	2006-01-14 14:16:19.000000000 -0600
++++ uClibc-0.9.29-patched/libc/stdio/putwchar.c	2007-05-09 18:05:21.642421481 -0500
+@@ -22,7 +22,8 @@
  
- /*  #undef __UCLIBC_HAS_FLOATS__ */
-Index: uClibc_trunk/libc/stdio/fgetc.c
-===================================================================
---- uClibc_trunk/libc/stdio/fgetc.c	(revision 17397)
-+++ uClibc_trunk/libc/stdio/fgetc.c	(working copy)
-@@ -13,13 +13,13 @@
- #undef getc
- #undef getc_unlocked
- 
--libc_hidden_proto(__fgetc_unlocked)
-+libc_hidden_proto(fgetc_unlocked)
- 
- #ifdef __DO_UNLOCKED
- 
- libc_hidden_proto(fflush_unlocked)
- 
--int __fgetc_unlocked(FILE *stream)
-+int fgetc_unlocked(FILE *stream)
- {
- 	__STDIO_STREAM_VALIDATE(stream);
- 
-@@ -73,26 +73,22 @@ int __fgetc_unlocked(FILE *stream)
- 
- 	return EOF;
- }
--libc_hidden_def(__fgetc_unlocked)
--
--libc_hidden_proto(fgetc_unlocked)
--strong_alias(__fgetc_unlocked,fgetc_unlocked)
- libc_hidden_def(fgetc_unlocked)
- 
- //libc_hidden_proto(__getc_unlocked)
--//strong_alias(__fgetc_unlocked,__getc_unlocked)
-+//strong_alias(fgetc_unlocked,__getc_unlocked)
- //libc_hidden_def(__getc_unlocked)
- 
- libc_hidden_proto(getc_unlocked)
--strong_alias(__fgetc_unlocked,getc_unlocked)
-+strong_alias(fgetc_unlocked,getc_unlocked)
- libc_hidden_def(getc_unlocked)
- 
- #ifndef __UCLIBC_HAS_THREADS__
- libc_hidden_proto(fgetc)
--strong_alias(__fgetc_unlocked,fgetc)
-+strong_alias(fgetc_unlocked,fgetc)
- libc_hidden_def(fgetc)
- 
--strong_alias(__fgetc_unlocked,getc)
-+strong_alias(fgetc_unlocked,getc)
- #endif
- 
  #elif defined __UCLIBC_HAS_THREADS__
-Index: uClibc_trunk/libc/unistd/getpass.c
-===================================================================
---- uClibc_trunk/libc/unistd/getpass.c	(revision 17397)
-+++ uClibc_trunk/libc/unistd/getpass.c	(working copy)
-@@ -36,7 +36,8 @@ libc_hidden_proto(fgets)
- libc_hidden_proto(fputs)
- libc_hidden_proto(fputc)
- libc_hidden_proto(putc)
+ 
 -libc_hidden_proto(__fputc_unlocked)
 +//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
+ /* psm: should this be fputwc? */
+ libc_hidden_proto(fputc)
  
- /* It is desirable to use this bit on systems that have it.
-    The only bit of terminal state we want to twiddle is echoing, which is
-Index: uClibc_trunk/libc/sysdeps/linux/common/bits/uClibc_stdio.h
-===================================================================
---- uClibc_trunk/libc/sysdeps/linux/common/bits/uClibc_stdio.h	(revision 17397)
-+++ uClibc_trunk/libc/sysdeps/linux/common/bits/uClibc_stdio.h	(working copy)
-@@ -381,32 +381,29 @@ extern void __stdio_init_mutex(__UCLIBC_
+diff -ur uClibc-0.9.29/libc/sysdeps/linux/common/bits/uClibc_stdio.h uClibc-0.9.29-patched/libc/sysdeps/linux/common/bits/uClibc_stdio.h
+--- uClibc-0.9.29/libc/sysdeps/linux/common/bits/uClibc_stdio.h	2007-01-28 07:16:58.000000000 -0600
++++ uClibc-0.9.29-patched/libc/sysdeps/linux/common/bits/uClibc_stdio.h	2007-05-09 20:56:02.408110608 -0500
+@@ -381,33 +381,29 @@
  # define __FEOF(__stream)		__FEOF_UNLOCKED(__stream)
  #endif
  
 -extern int __fgetc_unlocked(FILE *__stream);
 -extern int __fputc_unlocked(int __c, FILE *__stream);
 -
--/* First define the default definitions.  They overriden below as necessary. */
+ /* First define the default definitions.
+    They are overridden below as necessary. */
 -#define __FGETC_UNLOCKED(__stream)		(__fgetc_unlocked)((__stream))
-+/* First define the default definitions.
-+ * They are overridden as necessary. */
 +#define __FGETC_UNLOCKED(__stream)		(fgetc_unlocked)((__stream))
  #define __FGETC(__stream)			(fgetc)((__stream))
 -#define __GETC_UNLOCKED_MACRO(__stream)		(__fgetc_unlocked)((__stream))
@@ -344,11 +345,11 @@
  		( ((__stream)->__bufpos < (__stream)->__bufgetc_u)	\
  		  ? (*(__stream)->__bufpos++)				\
 -		  : __fgetc_unlocked(__stream) )
-+		  : (fgetc_unlocked)(__stream) )
++		  : fgetc_unlocked(__stream) )
  
  # if 0
  	/* Classic macro approach.  getc{_unlocked} can have side effects. */
-@@ -452,20 +449,17 @@ extern FILE *__stdin;			/* For getchar()
+@@ -453,20 +449,17 @@
  #  endif
  # endif
  
@@ -366,11 +367,11 @@
  		( ((__stream)->__bufpos < (__stream)->__bufputc_u)	\
  		  ? (*(__stream)->__bufpos++) = (__c)			\
 -		  : __fputc_unlocked((__c),(__stream)) )
-+		  : (fputc_unlocked)((__c),(__stream)) )
++		  : (fputc_unlocked((__c),(__stream)) )
  
  # if 0
  	/* Classic macro approach.  putc{_unlocked} can have side effects.*/
-@@ -488,7 +482,8 @@ extern FILE *__stdout;			/* For putchar(
+@@ -489,7 +482,8 @@
  		}) )
  
  #  undef  __PUTC_UNLOCKED
@@ -380,40 +381,16 @@
  
  #  ifdef __UCLIBC_HAS_THREADS__
  #   undef  __FPUTC
-Index: uClibc_trunk/libc/misc/ttyent/getttyent.c
-===================================================================
---- uClibc_trunk/libc/misc/ttyent/getttyent.c	(revision 17397)
-+++ uClibc_trunk/libc/misc/ttyent/getttyent.c	(working copy)
-@@ -44,8 +44,10 @@ libc_hidden_proto(strncmp)
- libc_hidden_proto(__fsetlocking)
- libc_hidden_proto(rewind)
- libc_hidden_proto(fgets_unlocked)
-+//#undef getc_unlocked
- libc_hidden_proto(getc_unlocked)
--libc_hidden_proto(__fgetc_unlocked)
-+//#undef fgetc_unlocked
-+libc_hidden_proto(fgetc_unlocked)
- libc_hidden_proto(fopen)
- libc_hidden_proto(fclose)
- libc_hidden_proto(abort)
-Index: uClibc_trunk/libc/misc/error/error.c
-===================================================================
---- uClibc_trunk/libc/misc/error/error.c	(revision 17397)
-+++ uClibc_trunk/libc/misc/error/error.c	(working copy)
-@@ -30,11 +30,14 @@ libc_hidden_proto(strcmp)
- libc_hidden_proto(strerror)
- libc_hidden_proto(fprintf)
- libc_hidden_proto(exit)
-+//#undef putc
+diff -ur uClibc-0.9.29/libc/unistd/getpass.c uClibc-0.9.29-patched/libc/unistd/getpass.c
+--- uClibc-0.9.29/libc/unistd/getpass.c	2006-07-05 05:58:38.000000000 -0500
++++ uClibc-0.9.29-patched/libc/unistd/getpass.c	2007-05-09 18:05:21.642421481 -0500
+@@ -36,7 +36,8 @@
+ libc_hidden_proto(fputs)
+ libc_hidden_proto(fputc)
  libc_hidden_proto(putc)
-+libc_hidden_proto(fputc)
- libc_hidden_proto(vfprintf)
- libc_hidden_proto(fflush)
--libc_hidden_proto(fputc)
 -libc_hidden_proto(__fputc_unlocked)
-+//#ifdef __UCLIBC_HAS_STDIO_PUTC_MACRO__
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
-+//#endif
  
- /* This variable is incremented each time `error' is called.  */
- unsigned int error_message_count = 0;
+ /* It is desirable to use this bit on systems that have it.
+    The only bit of terminal state we want to twiddle is echoing, which is

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch	2007-05-09 22:58:59 UTC (rev 18599)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-gethostent_r-failure-retval.patch	2007-05-10 02:37:16 UTC (rev 18600)
@@ -1,8 +1,7 @@
-Index: uClibc/libc/inet/resolv.c
-===================================================================
---- uClibc/libc/inet/resolv.c	(revision 17775)
-+++ uClibc/libc/inet/resolv.c	(working copy)
-@@ -1689,7 +1689,7 @@
+diff -ur uClibc-0.9.29/libc/inet/resolv.c uClibc-0.9.29-patched/libc/inet/resolv.c
+--- uClibc-0.9.29/libc/inet/resolv.c	2007-04-23 12:01:05.000000000 -0500
++++ uClibc-0.9.29-patched/libc/inet/resolv.c	2007-05-09 18:05:33.563404419 -0500
+@@ -1700,7 +1700,7 @@
  int gethostent_r(struct hostent *result_buf, char *buf, size_t buflen,
  	struct hostent **result, int *h_errnop)
  {
