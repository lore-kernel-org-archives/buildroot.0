Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD0FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020246058D
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 18:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 020246058D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E6B83D1B;
	Thu, 16 Sep 2021 18:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IK4OxAcAAJm; Thu, 16 Sep 2021 18:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E2A83E40;
	Thu, 16 Sep 2021 18:55:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE6A1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A41983D1B
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSw9MqdiK4If for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 18:54:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAAC983E40
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 18:54:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B7C648B4B1; Thu, 16 Sep 2021 18:53:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 20:52:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c056db673430f5f85b0a6c7c1133bcde3f4c095
X-Git-Newrev: b2a1e959ea6da4ddfc6ffbe9877de9826a832684
X-Patchwork-Hint: ignore
Message-Id: <20210916185301.B7C648B4B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/m4: bump to version 1.4.19
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8289510855344324503=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============8289510855344324503==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b2a1e959ea6da4ddfc6ffbe9877de9826a832684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches.

COPYING hash changed because the URLs were converted to https.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...lush-adjust-to-glibc-2.28-libio.h-removal.patch | 166 ---------------------
 ...ush-be-more-paranoid-about-libio.h-change.patch | 151 -------------------
 package/m4/0003-c-stack-stop-using-SIGSTKSZ.patch  | 106 -------------
 package/m4/m4.hash                                 |   4 +-
 package/m4/m4.mk                                   |   2 +-
 5 files changed, 3 insertions(+), 426 deletions(-)

diff --git a/package/m4/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch b/package/m4/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
deleted file mode 100644
index 5c5c11b990..0000000000
--- a/package/m4/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 4af4a4a71827c0bc5e0ec67af23edef4f15cee8e Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 5 Mar 2018 10:56:29 -0800
-Subject: [PATCH] fflush: adjust to glibc 2.28 libio.h removal
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Daniel P. Berrangé in:
-https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
-* lib/fbufmode.c (fbufmode):
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpending.c (__fpending):
-* lib/fpurge.c (fpurge):
-* lib/freadable.c (freadable):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/freadptr.c (freadptr):
-* lib/freadseek.c (freadptrinc):
-* lib/fseeko.c (fseeko):
-* lib/fseterr.c (fseterr):
-* lib/fwritable.c (fwritable):
-* lib/fwriting.c (fwriting):
-Check _IO_EOF_SEEN instead of _IO_ftrylockfile.
-* lib/stdio-impl.h (_IO_IN_BACKUP) [_IO_EOF_SEEN]:
-Define if not already defined.
-
-[yann.morin.1998@free.fr: partially backport from upstream gnulib]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
- lib/fflush.c     |  6 +++---
- lib/fpending.c   |  2 +-
- lib/fpurge.c     |  2 +-
- lib/freadahead.c |  2 +-
- lib/freading.c   |  2 +-
- lib/fseeko.c     |  4 ++--
- lib/stdio-impl.h |  6 ++++++
- 7 files changed, 15 insertions(+), 9 deletions(-)
-
-diff --git a/lib/fflush.c b/build-aux/gnulib/lib/fflush.c
-index 983ade0ff..a6edfa105 100644
---- a/lib/fflush.c
-+++ b/lib/fflush.c
-@@ -33,7 +33,7 @@
- #undef fflush
- 
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
- /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
- static void
-@@ -72,7 +72,7 @@ clear_ungetc_buffer (FILE *fp)
- 
- #endif
- 
--#if ! (defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-+#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
- 
- # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
- /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-@@ -148,7 +148,7 @@ rpl_fflush (FILE *stream)
-   if (stream == NULL || ! freading (stream))
-     return fflush (stream);
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
-   clear_ungetc_buffer_preserving_position (stream);
- 
-diff --git a/lib/fpending.c b/build-aux/gnulib/lib/fpending.c
-index c84e3a5b4..789f50e4e 100644
---- a/lib/fpending.c
-+++ b/lib/fpending.c
-@@ -32,7 +32,7 @@ __fpending (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return fp->_IO_write_ptr - fp->_IO_write_base;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-diff --git a/lib/fpurge.c b/build-aux/gnulib/lib/fpurge.c
-index b1d417c7a..3aedcc373 100644
---- a/lib/fpurge.c
-+++ b/lib/fpurge.c
-@@ -62,7 +62,7 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-diff --git a/lib/freadahead.c b/build-aux/gnulib/lib/freadahead.c
-index c2ecb5b28..23ec76ee5 100644
---- a/lib/freadahead.c
-+++ b/lib/freadahead.c
-@@ -30,7 +30,7 @@ extern size_t __sreadahead (FILE *);
- size_t
- freadahead (FILE *fp)
- {
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_write_ptr > fp->_IO_write_base)
-     return 0;
-   return (fp->_IO_read_end - fp->_IO_read_ptr)
-diff --git a/lib/freading.c b/build-aux/gnulib/lib/freading.c
-index 73c28acdd..c24d0c88a 100644
---- a/lib/freading.c
-+++ b/lib/freading.c
-@@ -31,7 +31,7 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-diff --git a/lib/fseeko.c b/build-aux/gnulib/lib/fseeko.c
-index 0101ab55f..193f4e8ce 100644
---- a/lib/fseeko.c
-+++ b/lib/fseeko.c
-@@ -47,7 +47,7 @@ fseeko (FILE *fp, off_t offset, int whence)
- #endif
- 
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +123,7 @@ fseeko (FILE *fp, off_t offset, int whence)
-           return -1;
-         }
- 
--#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-diff --git a/lib/stdio-impl.h b/build-aux/gnulib/lib/stdio-impl.h
-index 78d896e9f..05c5752a2 100644
---- a/lib/stdio-impl.h
-+++ b/lib/stdio-impl.h
-@@ -18,6 +18,12 @@
-    the same implementation of stdio extension API, except that some fields
-    have different naming conventions, or their access requires some casts.  */
- 
-+/* Glibc 2.28 made _IO_IN_BACKUP private.  For now, work around this
-+   problem by defining it ourselves.  FIXME: Do not rely on glibc
-+   internals.  */
-+#if !defined _IO_IN_BACKUP && defined _IO_EOF_SEEN
-+# define _IO_IN_BACKUP 0x100
-+#endif
- 
- /* BSD stdio derived implementations.  */
- 
--- 
-2.14.1
-
diff --git a/package/m4/0002-fflush-be-more-paranoid-about-libio.h-change.patch b/package/m4/0002-fflush-be-more-paranoid-about-libio.h-change.patch
deleted file mode 100644
index a820ca8ca9..0000000000
--- a/package/m4/0002-fflush-be-more-paranoid-about-libio.h-change.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 74d9d6a293d7462dea8f83e7fc5ac792e956a0ad Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 8 Mar 2018 16:42:45 -0800
-Subject: [PATCH 2/2] fflush: be more paranoid about libio.h change
-
-Suggested by Eli Zaretskii in:
-https://lists.gnu.org/r/emacs-devel/2018-03/msg00270.html
-* lib/fbufmode.c (fbufmode):
-* lib/fflush.c (clear_ungetc_buffer_preserving_position)
-(disable_seek_optimization, rpl_fflush):
-* lib/fpending.c (__fpending):
-* lib/fpurge.c (fpurge):
-* lib/freadable.c (freadable):
-* lib/freadahead.c (freadahead):
-* lib/freading.c (freading):
-* lib/freadptr.c (freadptr):
-* lib/freadseek.c (freadptrinc):
-* lib/fseeko.c (fseeko):
-* lib/fseterr.c (fseterr):
-* lib/fwritable.c (fwritable):
-* lib/fwriting.c (fwriting):
-Look at _IO_ftrylockfile as well as at _IO_EOF_SEEN.
----
- lib/fflush.c     |  9 ++++++---
- lib/fpending.c   |  3 ++-
- lib/fpurge.c     |  3 ++-
- lib/freadahead.c |  3 ++-
- lib/freading.c   |  3 ++-
- lib/fseeko.c     |  6 ++++--
- 6 files changed, 18 insertions(+), 9 deletions(-)
-
-[yann.morin.1998@free.fr: partially backport from upstream gnulib]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/lib/fflush.c b/build-aux/gnulib/lib/fflush.c
-index a6edfa105..a140b7ad9 100644
---- a/lib/fflush.c
-+++ b/lib/fflush.c
-@@ -33,7 +33,8 @@
- #undef fflush
- 
- 
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+/* GNU libc, BeOS, Haiku, Linux libc5 */
- 
- /* Clear the stream's ungetc buffer, preserving the value of ftello (fp).  */
- static void
-@@ -72,7 +73,8 @@ clear_ungetc_buffer (FILE *fp)
- 
- #endif
- 
--#if ! (defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */)
-+#if ! (defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1)
-+/* GNU libc, BeOS, Haiku, Linux libc5 */
- 
- # if (defined __sferror || defined __DragonFly__ || defined __ANDROID__) && defined __SNPT
- /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-@@ -148,7 +150,8 @@ rpl_fflush (FILE *stream)
-   if (stream == NULL || ! freading (stream))
-     return fflush (stream);
- 
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
- 
-   clear_ungetc_buffer_preserving_position (stream);
- 
-diff --git a/lib/fpending.c b/build-aux/gnulib/lib/fpending.c
-index 789f50e4e..7bc235ded 100644
---- a/lib/fpending.c
-+++ b/lib/fpending.c
-@@ -32,7 +32,8 @@ __fpending (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return fp->_IO_write_ptr - fp->_IO_write_base;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
-   /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin, Minix 3, Android */
-diff --git a/lib/fpurge.c b/build-aux/gnulib/lib/fpurge.c
-index 3aedcc373..554790b56 100644
---- a/lib/fpurge.c
-+++ b/lib/fpurge.c
-@@ -62,7 +62,8 @@ fpurge (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
-   fp->_IO_read_end = fp->_IO_read_ptr;
-   fp->_IO_write_ptr = fp->_IO_write_base;
-   /* Avoid memory leak when there is an active ungetc buffer.  */
-diff --git a/lib/freadahead.c b/build-aux/gnulib/lib/freadahead.c
-index 23ec76ee5..ed3dd0ebd 100644
---- a/lib/freadahead.c
-+++ b/lib/freadahead.c
-@@ -30,7 +30,8 @@ extern size_t __sreadahead (FILE *);
- size_t
- freadahead (FILE *fp)
- {
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_write_ptr > fp->_IO_write_base)
-     return 0;
-   return (fp->_IO_read_end - fp->_IO_read_ptr)
-diff --git a/lib/freading.c b/build-aux/gnulib/lib/freading.c
-index c24d0c88a..790f92ca3 100644
---- a/lib/freading.c
-+++ b/lib/freading.c
-@@ -31,7 +31,8 @@ freading (FILE *fp)
-   /* Most systems provide FILE as a struct and the necessary bitmask in
-      <stdio.h>, because they need it for implementing getc() and putc() as
-      fast macros.  */
--# if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+# if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
-   return ((fp->_flags & _IO_NO_WRITES) != 0
-           || ((fp->_flags & (_IO_NO_READS | _IO_CURRENTLY_PUTTING)) == 0
-               && fp->_IO_read_base != NULL));
-diff --git a/lib/fseeko.c b/build-aux/gnulib/lib/fseeko.c
-index 193f4e8ce..e5c5172e7 100644
---- a/lib/fseeko.c
-+++ b/lib/fseeko.c
-@@ -47,7 +47,8 @@ fseeko (FILE *fp, off_t offset, int whence)
- #endif
- 
-   /* These tests are based on fpurge.c.  */
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+  /* GNU libc, BeOS, Haiku, Linux libc5 */
-   if (fp->_IO_read_end == fp->_IO_read_ptr
-       && fp->_IO_write_ptr == fp->_IO_write_base
-       && fp->_IO_save_base == NULL)
-@@ -123,7 +124,8 @@ fseeko (FILE *fp, off_t offset, int whence)
-           return -1;
-         }
- 
--#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
-+#if defined _IO_EOF_SEEN || defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1
-+      /* GNU libc, BeOS, Haiku, Linux libc5 */
-       fp->_flags &= ~_IO_EOF_SEEN;
-       fp->_offset = pos;
- #elif defined __sferror || defined __DragonFly__ || defined __ANDROID__
--- 
-2.14.1
-
diff --git a/package/m4/0003-c-stack-stop-using-SIGSTKSZ.patch b/package/m4/0003-c-stack-stop-using-SIGSTKSZ.patch
deleted file mode 100644
index f262fc818e..0000000000
--- a/package/m4/0003-c-stack-stop-using-SIGSTKSZ.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-c-stack: stop using SIGSTKSZ
-
-It’s been proposed to stop making SIGSTKSZ an integer constant:
-https://sourceware.org/pipermail/libc-alpha/2020-September/118028.html
-Also, using SIGSTKSZ in #if did not conform to current POSIX.
-Also, avoiding SIGSTKSZ makes the code simpler and easier to grok.
-* lib/c-stack.c (SIGSTKSZ): Remove.
-(alternate_signal_stack): Now a 64 KiB array, for simplicity.
-All uses changed.
-
-[Retrieved (and backported) from:
-https://git.savannah.gnu.org/cgit/gnulib.git/patch/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura m4-1.4.18.orig/lib/c-stack.c m4-1.4.18/lib/c-stack.c
---- m4-1.4.18.orig/lib/c-stack.c	2021-04-11 19:12:14.086494029 +0200
-+++ m4-1.4.18/lib/c-stack.c	2021-04-11 19:48:46.316862760 +0200
-@@ -50,15 +50,16 @@
- #if ! HAVE_STACK_T && ! defined stack_t
- typedef struct sigaltstack stack_t;
- #endif
--#ifndef SIGSTKSZ
--# define SIGSTKSZ 16384
--#elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
--/* libsigsegv 2.6 through 2.8 have a bug where some architectures use
--   more than the Linux default of an 8k alternate stack when deciding
--   if a fault was caused by stack overflow.  */
--# undef SIGSTKSZ
--# define SIGSTKSZ 16384
--#endif
-+
-+/* Storage for the alternate signal stack.
-+   64 KiB is not too large for Gnulib-using apps, and is large enough
-+   for all known platforms.  Smaller sizes may run into trouble.
-+   For example, libsigsegv 2.6 through 2.8 have a bug where some
-+   architectures use more than the Linux default of an 8 KiB alternate
-+   stack when deciding if a fault was caused by stack overflow.  */
-+static max_align_t alternate_signal_stack[(64 * 1024
-+                                           + sizeof (max_align_t) - 1)
-+                                          / sizeof (max_align_t)];
- 
- #include <stdlib.h>
- #include <string.h>
-@@ -128,19 +129,6 @@
- #if (HAVE_SIGALTSTACK && HAVE_DECL_SIGALTSTACK \
-      && HAVE_STACK_OVERFLOW_HANDLING) || HAVE_LIBSIGSEGV
- 
--/* Storage for the alternate signal stack.  */
--static union
--{
--  char buffer[SIGSTKSZ];
--
--  /* These other members are for proper alignment.  There's no
--     standard way to guarantee stack alignment, but this seems enough
--     in practice.  */
--  long double ld;
--  long l;
--  void *p;
--} alternate_signal_stack;
--
- static void
- null_action (int signo __attribute__ ((unused)))
- {
-@@ -205,8 +193,8 @@
- 
-   /* Always install the overflow handler.  */
-   if (stackoverflow_install_handler (overflow_handler,
--                                     alternate_signal_stack.buffer,
--                                     sizeof alternate_signal_stack.buffer))
-+                                     alternate_signal_stack,
-+                                     sizeof alternate_signal_stack))
-     {
-       errno = ENOTSUP;
-       return -1;
-@@ -279,14 +267,14 @@
-   stack_t st;
-   struct sigaction act;
-   st.ss_flags = 0;
-+  st.ss_sp = alternate_signal_stack;
-+  st.ss_size = sizeof alternate_signal_stack;
- # if SIGALTSTACK_SS_REVERSED
-   /* Irix mistakenly treats ss_sp as the upper bound, rather than
-      lower bound, of the alternate stack.  */
--  st.ss_sp = alternate_signal_stack.buffer + SIGSTKSZ - sizeof (void *);
--  st.ss_size = sizeof alternate_signal_stack.buffer - sizeof (void *);
--# else
--  st.ss_sp = alternate_signal_stack.buffer;
--  st.ss_size = sizeof alternate_signal_stack.buffer;
-+  st.ss_size -= sizeof (void *);
-+  char *ss_sp = st.ss_sp;
-+  st.ss_sp = ss_sp + st.ss_size;
- # endif
-   r = sigaltstack (&st, NULL);
-   if (r != 0)
-diff -Nura m4-1.4.18.orig/lib/c-stack.h m4-1.4.18/lib/c-stack.h
---- m4-1.4.18.orig/lib/c-stack.h	2021-04-11 19:12:14.098494042 +0200
-+++ m4-1.4.18/lib/c-stack.h	2021-04-11 19:17:42.138848378 +0200
-@@ -34,7 +34,7 @@
-    A null ACTION acts like an action that does nothing.
- 
-    ACTION must be async-signal-safe.  ACTION together with its callees
--   must not require more than SIGSTKSZ bytes of stack space.  Also,
-+   must not require more than 64 KiB bytes of stack space.  Also,
-    ACTION should not call longjmp, because this implementation does
-    not guarantee that it is safe to return to the original stack.
- 
diff --git a/package/m4/m4.hash b/package/m4/m4.hash
index e665fc149f..a81f4fab9c 100644
--- a/package/m4/m4.hash
+++ b/package/m4/m4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	f2c1e86ca0a404ff281631bdc8377638992744b175afb806e25871a24a934e07	m4-1.4.18.tar.xz
+sha256  63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96  m4-1.4.19.tar.xz
 # License files, locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 849e7f4a54..3a12092971 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-M4_VERSION = 1.4.18
+M4_VERSION = 1.4.19
 M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+

--===============8289510855344324503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8289510855344324503==--
