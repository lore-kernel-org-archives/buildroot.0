From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 13:11:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070121211158.539AA48582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 13:11:56 -0800 (Sun, 21 Jan 2007)
New Revision: 17441

Log:
- update proposed patchlet


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff	2007-01-21 19:21:21 UTC (rev 17440)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff	2007-01-21 21:11:56 UTC (rev 17441)
@@ -37,7 +37,7 @@
  libc_hidden_proto(fopen)
  libc_hidden_proto(fclose)
  libc_hidden_proto(fprintf)
-+#undef fputc_unlocked
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
  #ifdef __UCLIBC_HAS_XLOCALE__
  libc_hidden_proto(__ctype_b_loc)
@@ -92,90 +92,11 @@
  libc_hidden_proto(fclose)
  libc_hidden_proto(getc_unlocked)
 -libc_hidden_proto(__fgetc_unlocked)
-+#undef fgetc_unlocked
++//#undef fgetc_unlocked
 +libc_hidden_proto(fgetc_unlocked)
  #ifdef __UCLIBC_HAS_WCHAR__
  libc_hidden_proto(wcslen)
  libc_hidden_proto(vfwscanf)
-@@ -506,7 +507,7 @@ enum {
- 	FLAG_THOUSANDS	=	0x20,
- 	FLAG_I18N		=	0x40,	/* only works for d, i, u */
- 	FLAG_MALLOC     =   0x80,	/* only works for s, S, and [ (and l[)*/
--};	  
-+};
- 
- 
- #define SPEC_RANGES		{ CONV_n, CONV_p, CONV_i, CONV_A, \
-@@ -1024,7 +1025,7 @@ static int scan_getwc(register struct sc
- 		__set_errno(EILSEQ);		/* In case of incomplete conversion. */
- 		sc->mb_fail = 1;
- 	}
--	
-+
-  SUCCESS:
- 	sc->width = width;			/* Restore width. */
- 
-@@ -1366,7 +1367,7 @@ int VFSCANF (FILE *__restrict fp, const 
- 
- 			if (psfs.conv_num == CONV_percent) {
- 				goto MATCH_CHAR;
-- 			}
-+			}
- 
- 			if (psfs.conv_num == CONV_n) {
- #ifdef __UCLIBC_MJN3_ONLY__
-@@ -1410,7 +1411,6 @@ int VFSCANF (FILE *__restrict fp, const 
- 			{
- 				b = (psfs.store ? ((unsigned char *) psfs.cur_ptr) : buf);
- 				fail = 1;
--			
- 
- 				if (psfs.conv_num == CONV_c) {
- 					if (sc.width == INT_MAX) {
-@@ -1451,7 +1451,7 @@ int VFSCANF (FILE *__restrict fp, const 
- 					if (*++fmt == '^') {
- 						++fmt;
- 						invert = 1;
-- 					}
-+					}
- 					memset(scanset, invert, sizeof(scanset));
- 					invert = 1-invert;
- 
-@@ -1519,7 +1519,7 @@ int VFSCANF (FILE *__restrict fp, const 
- 
- 				wb = (psfs.store ? ((wchar_t *) psfs.cur_ptr) : wbuf);
- 				fail = 1;
--			
-+
- 				if (psfs.conv_num == CONV_C) {
- 					if (sc.width == INT_MAX) {
- 						sc.width = 1;
-@@ -1796,7 +1796,6 @@ int attribute_hidden __psfs_do_numeric(p
- 	unsigned char usflag, base;
- 	unsigned char nonzero = 0;
- 	unsigned char seendigit = 0;
--	
- 
- #ifdef __UCLIBC_MJN3_ONLY__
- #warning CONSIDER: What should be returned for an invalid conversion specifier?
-@@ -2210,7 +2209,7 @@ int attribute_hidden __psfs_do_numeric(p
- 		assert(seendigit);
- 		seendigit = 0;
- 		nonzero = 0;
--		
-+
- 		if (sc->cc == '0') {
- 			seendigit = 1;
- 			*b++ = '0';
-@@ -2226,7 +2225,7 @@ int attribute_hidden __psfs_do_numeric(p
- 			}
- 			__scan_getc(sc);
- 		}
--			
-+
- 		if (!seendigit) {		/* No digits.  Unrecoverable. */
- 			goto DONE_DO_UNGET;
- 		}
 Index: uClibc_trunk/libc/stdio/putwchar.c
 ===================================================================
 --- uClibc_trunk/libc/stdio/putwchar.c	(revision 17397)
@@ -185,7 +106,7 @@
  #elif defined __UCLIBC_HAS_THREADS__
  
 -libc_hidden_proto(__fputc_unlocked)
-+#undef fputc_unlocked
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
  /* psm: should this be fputwc? */
  libc_hidden_proto(fputc)
@@ -199,7 +120,7 @@
  #include "_stdio.h"
  
 -libc_hidden_proto(__fgetc_unlocked)
-+#undef fgetc_unlocked
++//#undef fgetc_unlocked
 +libc_hidden_proto(fgetc_unlocked)
  
  #undef getchar
@@ -213,7 +134,7 @@
  #include "_stdio.h"
  
 -libc_hidden_proto(__fputc_unlocked)
-+#undef fputc_unlocked
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
  
  #undef putchar
@@ -274,7 +195,7 @@
  libc_hidden_proto(getdelim)
 -
 -libc_hidden_proto(__fgetc_unlocked)
-+#undef fgetc_unlocked
++//#undef fgetc_unlocked
 +libc_hidden_proto(fgetc_unlocked)
  
  /* Note: There is a defect in this function.  (size_t vs ssize_t). */
@@ -288,7 +209,7 @@
  #include "_stdio.h"
  
 -libc_hidden_proto(__fputc_unlocked)
-+#undef fputc_unlocked
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
  libc_hidden_proto(fputs_unlocked)
  
@@ -311,7 +232,7 @@
  libc_hidden_proto(memcpy)
  libc_hidden_proto(putc_unlocked)
 -libc_hidden_proto(__fputc_unlocked)
-+#undef fputc_unlocked
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
  libc_hidden_proto(__glibc_strerror_r)
  
@@ -376,7 +297,7 @@
  libc_hidden_proto(fputc)
  libc_hidden_proto(putc)
 -libc_hidden_proto(__fputc_unlocked)
-+#undef fputc_unlocked
++//#undef fputc_unlocked
 +libc_hidden_proto(fputc_unlocked)
  
  /* It is desirable to use this bit on systems that have it.
@@ -423,7 +344,7 @@
  		( ((__stream)->__bufpos < (__stream)->__bufgetc_u)	\
  		  ? (*(__stream)->__bufpos++)				\
 -		  : __fgetc_unlocked(__stream) )
-+		  : fgetc_unlocked(__stream) )
++		  : (fgetc_unlocked)(__stream) )
  
  # if 0
  	/* Classic macro approach.  getc{_unlocked} can have side effects. */
@@ -445,7 +366,7 @@
  		( ((__stream)->__bufpos < (__stream)->__bufputc_u)	\
  		  ? (*(__stream)->__bufpos++) = (__c)			\
 -		  : __fputc_unlocked((__c),(__stream)) )
-+		  : fputc_unlocked((__c),(__stream)) )
++		  : (fputc_unlocked)((__c),(__stream)) )
  
  # if 0
  	/* Classic macro approach.  putc{_unlocked} can have side effects.*/
@@ -467,10 +388,10 @@
  libc_hidden_proto(__fsetlocking)
  libc_hidden_proto(rewind)
  libc_hidden_proto(fgets_unlocked)
-+#undef getc_unlocked
++//#undef getc_unlocked
  libc_hidden_proto(getc_unlocked)
 -libc_hidden_proto(__fgetc_unlocked)
-+#undef fgetc_unlocked
++//#undef fgetc_unlocked
 +libc_hidden_proto(fgetc_unlocked)
  libc_hidden_proto(fopen)
  libc_hidden_proto(fclose)
@@ -483,7 +404,7 @@
  libc_hidden_proto(strerror)
  libc_hidden_proto(fprintf)
  libc_hidden_proto(exit)
-+#undef putc
++//#undef putc
  libc_hidden_proto(putc)
 +libc_hidden_proto(fputc)
  libc_hidden_proto(vfprintf)
