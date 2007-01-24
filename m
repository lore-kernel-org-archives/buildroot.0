From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 07:12:13 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070124151213.1A214485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 07:12:12 -0800 (Wed, 24 Jan 2007)
New Revision: 17500

Log:
- apply vapier's comments


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff	2007-01-24 14:50:27 UTC (rev 17499)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-fget_putc.diff	2007-01-24 15:12:12 UTC (rev 17500)
@@ -219,7 +219,7 @@
  	if ((n = fputs_unlocked(s, stream)) != EOF) {
  		++n;
 -		if (__fputc_unlocked('\n', stream) == EOF) {
-+		if (__FPUTC_UNLOCKED('\n', stream) == EOF) {
++		if (fputc_unlocked('\n', stream) == EOF) {
  			n = EOF;
  		}
  	}
@@ -411,9 +411,9 @@
  libc_hidden_proto(fflush)
 -libc_hidden_proto(fputc)
 -libc_hidden_proto(__fputc_unlocked)
-+#ifdef __UCLIBC_HAS_STDIO_PUTC_MACRO__
++//#ifdef __UCLIBC_HAS_STDIO_PUTC_MACRO__
 +libc_hidden_proto(fputc_unlocked)
-+#endif
++//#endif
  
  /* This variable is incremented each time `error' is called.  */
  unsigned int error_message_count = 0;
