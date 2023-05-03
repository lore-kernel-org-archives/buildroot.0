Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B900AC77B78
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 19:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 503C5400FD;
	Wed,  3 May 2023 19:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 503C5400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cr1sdA01hIvR; Wed,  3 May 2023 19:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8DA7404AB;
	Wed,  3 May 2023 19:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DA7404AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7349B1BF334
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4472240883
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4472240883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B196ogfcxbMn for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 19:02:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A783740880
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A783740880
 for <buildroot@buildroot.org>; Wed,  3 May 2023 19:02:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.65]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7JzQ-1ptBoC2D88-007iWB; Wed, 03
 May 2023 21:02:08 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 21:02:07 +0200
Message-Id: <20230503190207.14970-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5u9U2/VxbptHfl0Bp2JYPAr7lOCRlQQ8ZRzfv7QPR4CJbNeuyTt
 vGMxiXzQBInOy/9mN5gN7qCWbabAwhNFCZy/zYA7yiyX1JJAJFH8658E2Nu4Z6HP/ZRWG5y
 M07E+a845Gblta6o+oz5bfS93NhQs8HJHUvNj1VeGmqyKb7ddvqEoBCzERjisRZz9i9Pl/a
 TZ0o7KRXWB9536NssZSaw==
UI-OutboundReport: notjunk:1;M01:P0:iOfLwxaDzig=;GWafutkxa3rHxYDY/z1/G61vAOd
 Yt2wDD22PuJHkXQRVNvApcLY4iylE8cVOSqqtNHco8C7tOgx4oiGXUfjIGOeUCEU4diIN82XH
 1MDOQdAwvFaTs/343NrQK7TWwXdv9WmTM3I4Oe49Of3hBWHnRq6pau6q/Cm00mpZaBcfdNLac
 kjo3Wk9y1+sXEIrq2/smRa3kjz+nhRMAiu4BpyRaytilih8FtcgUYrsxWSZqnnqxhkj2ju2hd
 1xD1Gw2hOQQ7OWNlQNpC7xN78rAxEHB2fmqafOva6DWxdEt4CT88HZG9Jox+3yH673cIUZsHG
 xkuhjzPDGN88k65mAp6huisGLXBQnm0v6T4kuSIKBXs08px4TnzT/hba4uhi3S+j2KjGjpRfI
 wLaR1arsJWvqzfINDcRlatH/ZR3hNye0AQODs96eGHlcDyckFz9Gy4eTucXiqxkqldwNTHl0L
 GRbZ28xBVqLWQjbEvBUeKHYnaninIOXrhIEWkE+8OzjdQc8oCXGZ8E8jA2+lQSUULk15Tg7iJ
 /z60oQFUSX6mWFq3XLiNSfzZTrIlISqrEofyIgNL1rbcbos10wc/PzSw5i88qNpfLcndsNmEv
 j6DQTXbM1kNFh19lEfMjqg9RssiaJydO/5MhvI0+zeKKnIkYs3ajOVeJcEGfi16dy9E/88zh1
 pjscgwR98JaKq6FtNmuQIlV7TF8HPxhzZTI43F1+BNANYzMTcqS+4/qmOMgl7CWw4VvMQ39wN
 4vjcp+Pw7G/DLJBxe11ZTCMxr2XPGYN1xUMKq95wfaE1m+tv4y/ymH/sK+M+bVG2OaOndOfST
 YyitrRI5UhBD/XP8ZXisUNOzyeic/T1br/w/5PXXKmFbANelBIVHpXFI+DoPyKsQX8B0EFTRZ
 4mNwWGNhQ3ag7oYS6EfMU3SxuPQAmdRtoLjhK+IF+M3svvcDQKuEHDMJ2kDRiZxzY2Mfz0Xoj
 rearrvA45em1eYlNT+cNueoT13s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683140528; i=ps.report@gmx.net;
 bh=mKkK22eVaCVn4zGvs6rofgoLUP9jJRCkQ/aj/qi5q48=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ts1z00zIbJ+mhjZufYioMIuERSgw8lkdY1ENLvJFXIAgXWkaJ+OewEvnwP92Rhrub
 YXpMCCvKUGgbjDiaU6V/3y869xOHfVx6d0tNaAUjLD5c+PNrmaoXxhjCGNarxOQ+E3
 6HoMkrI82cGY2GEVPtdrVLWE/psBP9eFho+rzS/2ojykgObktDxsNWvSz/S+VrqMKW
 zMaqRLBZEGgO/ZsbRGlkbgGIIqx/OusbHpZunZIZAxAypxTPS3RJj2g76GZS97O8OS
 GJwKsiUYeyEYPvElNh3tfGPXPm6CemPMpig67eifHAwg1NIBpC3wrucfe3YMQt0Z81
 39yjb5FwrHbHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ts1z00zI
Subject: [Buildroot] [PATCH v1] package/cpio: bump version to 2.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove 0001-Minor-fix.patch
  (from upstream, see [1])
- remove 0002-Rewrite-dynamic-string-support.patch
  (from upstream, see [2])
- remove 0003-Fix-previous-commit.patch
  (from upstream, see [3])

For details see [4].

[1] https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=641d3f489cf6238bb916368d4ba0d9325a235afb
[2] https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dd96882877721703e19272fe25034560b794061b
[3] https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dfc801c44a93bed7b3951905b188823d6a0432c8
[4] https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00001.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/cpio/0001-Minor-fix.patch             |  30 --
 .../0002-Rewrite-dynamic-string-support.patch | 461 ------------------
 package/cpio/0003-Fix-previous-commit.patch   |  40 --
 package/cpio/cpio.hash                        |   7 +-
 package/cpio/cpio.mk                          |   2 +-
 5 files changed, 4 insertions(+), 536 deletions(-)
 delete mode 100644 package/cpio/0001-Minor-fix.patch
 delete mode 100644 package/cpio/0002-Rewrite-dynamic-string-support.patch
 delete mode 100644 package/cpio/0003-Fix-previous-commit.patch

diff --git a/package/cpio/0001-Minor-fix.patch b/package/cpio/0001-Minor-fix.patch
deleted file mode 100644
index 429df7d5f8..0000000000
--- a/package/cpio/0001-Minor-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 641d3f489cf6238bb916368d4ba0d9325a235afb Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Mon, 20 Jan 2020 07:45:39 +0200
-Subject: Minor fix * src/global.c: Remove superfluous declaration of
- program_name
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=641d3f489cf6238bb916368d4ba0d9325a235afb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/global.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/global.c b/src/global.c
-index fb3abe9..acf92bc 100644
---- a/src/global.c
-+++ b/src/global.c
-@@ -184,9 +184,6 @@ unsigned int warn_option = 0;
- /* Extract to standard output? */
- bool to_stdout_option = false;
- 
--/* The name this program was run with.  */
--char *program_name;
--
- /* A pointer to either lstat or stat, depending on whether
-    dereferencing of symlinks is done for input files.  */
- int (*xstat) ();
--- 
-cgit v1.2.1
-
diff --git a/package/cpio/0002-Rewrite-dynamic-string-support.patch b/package/cpio/0002-Rewrite-dynamic-string-support.patch
deleted file mode 100644
index 44282ae3f1..0000000000
--- a/package/cpio/0002-Rewrite-dynamic-string-support.patch
+++ /dev/null
@@ -1,461 +0,0 @@
-From dd96882877721703e19272fe25034560b794061b Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 7 Aug 2021 12:52:21 +0300
-Subject: Rewrite dynamic string support.
-
-* src/dstring.c (ds_init): Take a single argument.
-(ds_free): New function.
-(ds_resize): Take a single argument.  Use x2nrealloc to expand
-the storage.
-(ds_reset,ds_append,ds_concat,ds_endswith): New function.
-(ds_fgetstr): Rewrite.  In particular, this fixes integer overflow.
-* src/dstring.h (dynamic_string): Keep both the allocated length
-(ds_size) and index of the next free byte in the string (ds_idx).
-(ds_init,ds_resize): Change signature.
-(ds_len): New macro.
-(ds_free,ds_reset,ds_append,ds_concat,ds_endswith): New protos.
-* src/copyin.c: Use new ds_ functions.
-* src/copyout.c: Likewise.
-* src/copypass.c: Likewise.
-* src/util.c: Likewise.
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dd96882877721703e19272fe25034560b794061b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/copyin.c   | 40 +++++++++++++-------------
- src/copyout.c  | 16 ++++-------
- src/copypass.c | 34 +++++++++++------------
- src/dstring.c  | 88 ++++++++++++++++++++++++++++++++++++++++++----------------
- src/dstring.h  | 31 ++++++++++-----------
- src/util.c     |  6 ++--
- 6 files changed, 123 insertions(+), 92 deletions(-)
-
-diff --git a/src/copyin.c b/src/copyin.c
-index a096048..4fb14af 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -55,11 +55,12 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *tty_in, FILE *tty_out,
-   char *str_res;		/* Result for string function.  */
-   static dynamic_string new_name;	/* New file name for rename option.  */
-   static int initialized_new_name = false;
-+
-   if (!initialized_new_name)
--  {
--    ds_init (&new_name, 128);
--    initialized_new_name = true;
--  }
-+    {
-+      ds_init (&new_name);
-+      initialized_new_name = true;
-+    }
- 
-   if (rename_flag)
-     {
-@@ -780,37 +781,36 @@ long_format (struct cpio_file_stat *file_hdr, char const *link_name)
-    already in `save_patterns' (from the command line) are preserved.  */
- 
- static void
--read_pattern_file ()
-+read_pattern_file (void)
- {
--  int max_new_patterns;
--  char **new_save_patterns;
--  int new_num_patterns;
-+  char **new_save_patterns = NULL;
-+  size_t max_new_patterns;
-+  size_t new_num_patterns;
-   int i;
--  dynamic_string pattern_name;
-+  dynamic_string pattern_name = DYNAMIC_STRING_INITIALIZER;
-   FILE *pattern_fp;
- 
-   if (num_patterns < 0)
-     num_patterns = 0;
--  max_new_patterns = 1 + num_patterns;
--  new_save_patterns = (char **) xmalloc (max_new_patterns * sizeof (char *));
-   new_num_patterns = num_patterns;
--  ds_init (&pattern_name, 128);
-+  max_new_patterns = num_patterns;
-+  new_save_patterns = xcalloc (max_new_patterns, sizeof (new_save_patterns[0]));
- 
-   pattern_fp = fopen (pattern_file_name, "r");
-   if (pattern_fp == NULL)
-     open_fatal (pattern_file_name);
-   while (ds_fgetstr (pattern_fp, &pattern_name, '\n') != NULL)
-     {
--      if (new_num_patterns >= max_new_patterns)
--	{
--	  max_new_patterns += 1;
--	  new_save_patterns = (char **)
--	    xrealloc ((char *) new_save_patterns,
--		      max_new_patterns * sizeof (char *));
--	}
-+      if (new_num_patterns == max_new_patterns)
-+	new_save_patterns = x2nrealloc (new_save_patterns,
-+					&max_new_patterns,
-+					sizeof (new_save_patterns[0]));
-       new_save_patterns[new_num_patterns] = xstrdup (pattern_name.ds_string);
-       ++new_num_patterns;
-     }
-+
-+  ds_free (&pattern_name);
-+  
-   if (ferror (pattern_fp) || fclose (pattern_fp) == EOF)
-     close_error (pattern_file_name);
- 
-@@ -1210,7 +1210,7 @@ swab_array (char *ptr, int count)
-    in the file system.  */
- 
- void
--process_copy_in ()
-+process_copy_in (void)
- {
-   FILE *tty_in = NULL;		/* Interactive file for rename option.  */
-   FILE *tty_out = NULL;		/* Interactive file for rename option.  */
-diff --git a/src/copyout.c b/src/copyout.c
-index 5ca587f..ca6798c 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -594,9 +594,10 @@ assign_string (char **pvar, char *value)
-    The format of the header depends on the compatibility (-c) flag.  */
- 
- void
--process_copy_out ()
-+process_copy_out (void)
- {
--  dynamic_string input_name;	/* Name of file read from stdin.  */
-+  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of file read from stdin.  */
-   struct stat file_stat;	/* Stat record for file.  */
-   struct cpio_file_stat file_hdr = CPIO_FILE_STAT_INITIALIZER;
-                                 /* Output header information.  */
-@@ -605,7 +606,6 @@ process_copy_out ()
-   char *orig_file_name = NULL;
- 
-   /* Initialize the copy out.  */
--  ds_init (&input_name, 128);
-   file_hdr.c_magic = 070707;
- 
-   /* Check whether the output file might be a tape.  */
-@@ -657,14 +657,9 @@ process_copy_out ()
- 	    {
- 	      if (file_hdr.c_mode & CP_IFDIR)
- 		{
--		  int len = strlen (input_name.ds_string);
- 		  /* Make sure the name ends with a slash */
--		  if (input_name.ds_string[len-1] != '/')
--		    {
--		      ds_resize (&input_name, len + 2);
--		      input_name.ds_string[len] = '/';
--		      input_name.ds_string[len+1] = 0;
--		    }
-+		  if (!ds_endswith (&input_name, '/'))
-+		    ds_append (&input_name, '/');
- 		}
- 	    }
- 	  
-@@ -875,6 +870,7 @@ process_copy_out ()
- 			 (unsigned long) blocks), (unsigned long) blocks);
-     }
-   cpio_file_stat_free (&file_hdr);
-+  ds_free (&input_name);
- }
- 
- 
-diff --git a/src/copypass.c b/src/copypass.c
-index 5d5e939..23ee687 100644
---- a/src/copypass.c
-+++ b/src/copypass.c
-@@ -48,10 +48,12 @@ set_copypass_perms (int fd, const char *name, struct stat *st)
-    If `link_flag', link instead of copying.  */
- 
- void
--process_copy_pass ()
-+process_copy_pass (void)
- {
--  dynamic_string input_name;	/* Name of file from stdin.  */
--  dynamic_string output_name;	/* Name of new file.  */
-+  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of file from stdin.  */
-+  dynamic_string output_name = DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of new file.  */
-   size_t dirname_len;		/* Length of `directory_name'.  */
-   int res;			/* Result of functions.  */
-   char *slash;			/* For moving past slashes in input name.  */
-@@ -65,25 +67,18 @@ process_copy_pass ()
- 				   created files  */
- 
-   /* Initialize the copy pass.  */
--  ds_init (&input_name, 128);
-   
-   dirname_len = strlen (directory_name);
-   if (change_directory_option && !ISSLASH (directory_name[0]))
-     {
-       char *pwd = xgetcwd ();
--
--      dirname_len += strlen (pwd) + 1;
--      ds_init (&output_name, dirname_len + 2);
--      strcpy (output_name.ds_string, pwd);
--      strcat (output_name.ds_string, "/");
--      strcat (output_name.ds_string, directory_name);
-+      
-+      ds_concat (&output_name, pwd);
-+      ds_append (&output_name, '/');
-     }
--  else
--    {
--      ds_init (&output_name, dirname_len + 2);
--      strcpy (output_name.ds_string, directory_name);
--    }
--  output_name.ds_string[dirname_len] = '/';
-+  ds_concat (&output_name, directory_name);
-+  ds_append (&output_name, '/');
-+  dirname_len = ds_len (&output_name);
-   output_is_seekable = true;
- 
-   change_dir ();
-@@ -116,8 +111,8 @@ process_copy_pass ()
-       /* Make the name of the new file.  */
-       for (slash = input_name.ds_string; *slash == '/'; ++slash)
- 	;
--      ds_resize (&output_name, dirname_len + strlen (slash) + 2);
--      strcpy (output_name.ds_string + dirname_len + 1, slash);
-+      ds_reset (&output_name, dirname_len);
-+      ds_concat (&output_name, slash);
- 
-       existing_dir = false;
-       if (lstat (output_name.ds_string, &out_file_stat) == 0)
-@@ -333,6 +328,9 @@ process_copy_pass ()
- 			 (unsigned long) blocks),
- 	       (unsigned long) blocks);
-     }
-+
-+  ds_free (&input_name);
-+  ds_free (&output_name);
- }
- 
- /* Try and create a hard link from FILE_NAME to another file 
-diff --git a/src/dstring.c b/src/dstring.c
-index b261d5a..692d3e7 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -20,8 +20,8 @@
- #if defined(HAVE_CONFIG_H)
- # include <config.h>
- #endif
--
- #include <stdio.h>
-+#include <stdlib.h>
- #if defined(HAVE_STRING_H) || defined(STDC_HEADERS)
- #include <string.h>
- #else
-@@ -33,24 +33,41 @@
- /* Initialiaze dynamic string STRING with space for SIZE characters.  */
- 
- void
--ds_init (dynamic_string *string, int size)
-+ds_init (dynamic_string *string)
-+{
-+  memset (string, 0, sizeof *string);
-+}
-+
-+/* Free the dynamic string storage. */
-+
-+void
-+ds_free (dynamic_string *string)
- {
--  string->ds_length = size;
--  string->ds_string = (char *) xmalloc (size);
-+  free (string->ds_string);
- }
- 
--/* Expand dynamic string STRING, if necessary, to hold SIZE characters.  */
-+/* Expand dynamic string STRING, if necessary.  */
- 
- void
--ds_resize (dynamic_string *string, int size)
-+ds_resize (dynamic_string *string)
- {
--  if (size > string->ds_length)
-+  if (string->ds_idx == string->ds_size)
-     {
--      string->ds_length = size;
--      string->ds_string = (char *) xrealloc ((char *) string->ds_string, size);
-+      string->ds_string = x2nrealloc (string->ds_string, &string->ds_size,
-+				      1);
-     }
- }
- 
-+/* Reset the index of the dynamic string S to LEN. */
-+
-+void
-+ds_reset (dynamic_string *s, size_t len)
-+{
-+  while (len > s->ds_size)
-+    ds_resize (s);
-+  s->ds_idx = len;
-+}
-+
- /* Dynamic string S gets a string terminated by the EOS character
-    (which is removed) from file F.  S will increase
-    in size during the function if the string from F is longer than
-@@ -61,34 +78,50 @@ ds_resize (dynamic_string *string, int size)
- char *
- ds_fgetstr (FILE *f, dynamic_string *s, char eos)
- {
--  int insize;			/* Amount needed for line.  */
--  int strsize;			/* Amount allocated for S.  */
-   int next_ch;
- 
-   /* Initialize.  */
--  insize = 0;
--  strsize = s->ds_length;
-+  s->ds_idx = 0;
- 
-   /* Read the input string.  */
--  next_ch = getc (f);
--  while (next_ch != eos && next_ch != EOF)
-+  while ((next_ch = getc (f)) != eos && next_ch != EOF)
-     {
--      if (insize >= strsize - 1)
--	{
--	  ds_resize (s, strsize * 2 + 2);
--	  strsize = s->ds_length;
--	}
--      s->ds_string[insize++] = next_ch;
--      next_ch = getc (f);
-+      ds_resize (s);
-+      s->ds_string[s->ds_idx++] = next_ch;
-     }
--  s->ds_string[insize++] = '\0';
-+  ds_resize (s);
-+  s->ds_string[s->ds_idx] = '\0';
- 
--  if (insize == 1 && next_ch == EOF)
-+  if (s->ds_idx == 0 && next_ch == EOF)
-     return NULL;
-   else
-     return s->ds_string;
- }
- 
-+void
-+ds_append (dynamic_string *s, int c)
-+{
-+  ds_resize (s);
-+  s->ds_string[s->ds_idx] = c;
-+  if (c)
-+    {
-+      s->ds_idx++;
-+      ds_resize (s);
-+      s->ds_string[s->ds_idx] = 0;
-+    }      
-+}
-+
-+void
-+ds_concat (dynamic_string *s, char const *str)
-+{
-+  size_t len = strlen (str);
-+  while (len + 1 > s->ds_size)
-+    ds_resize (s);
-+  memcpy (s->ds_string + s->ds_idx, str, len);
-+  s->ds_idx += len;
-+  s->ds_string[s->ds_idx] = 0;
-+}
-+
- char *
- ds_fgets (FILE *f, dynamic_string *s)
- {
-@@ -100,3 +133,10 @@ ds_fgetname (FILE *f, dynamic_string *s)
- {
-   return ds_fgetstr (f, s, '\0');
- }
-+
-+/* Return true if the dynamic string S ends with character C. */
-+int
-+ds_endswith (dynamic_string *s, int c)
-+{
-+  return (s->ds_idx > 0 && s->ds_string[s->ds_idx - 1] == c);
-+}
-diff --git a/src/dstring.h b/src/dstring.h
-index 5d24181..ca7a5f1 100644
---- a/src/dstring.h
-+++ b/src/dstring.h
-@@ -17,10 +17,6 @@
-    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
-    Boston, MA 02110-1301 USA.  */
- 
--#ifndef NULL
--#define NULL 0
--#endif
--
- /* A dynamic string consists of record that records the size of an
-    allocated string and the pointer to that string.  The actual string
-    is a normal zero byte terminated string that can be used with the
-@@ -30,22 +26,25 @@
- 
- typedef struct
- {
--  int ds_length;		/* Actual amount of storage allocated.  */
--  char *ds_string;		/* String.  */
-+  size_t ds_size;   /* Actual amount of storage allocated.  */
-+  size_t ds_idx;    /* Index of the next free byte in the string. */
-+  char *ds_string;  /* String storage. */
- } dynamic_string;
- 
-+#define DYNAMIC_STRING_INITIALIZER { 0, 0, NULL }
- 
--/* Macros that look similar to the original string functions.
--   WARNING:  These macros work only on pointers to dynamic string records.
--   If used with a real record, an "&" must be used to get the pointer.  */
--#define ds_strlen(s)		strlen ((s)->ds_string)
--#define ds_strcmp(s1, s2)	strcmp ((s1)->ds_string, (s2)->ds_string)
--#define ds_strncmp(s1, s2, n)	strncmp ((s1)->ds_string, (s2)->ds_string, n)
--#define ds_index(s, c)		index ((s)->ds_string, c)
--#define ds_rindex(s, c)		rindex ((s)->ds_string, c)
-+void ds_init (dynamic_string *string);
-+void ds_free (dynamic_string *string);
-+void ds_reset (dynamic_string *s, size_t len);
- 
--void ds_init (dynamic_string *string, int size);
--void ds_resize (dynamic_string *string, int size);
-+/* All functions below guarantee that s->ds_string[s->ds_idx] == '\0' */
- char *ds_fgetname (FILE *f, dynamic_string *s);
- char *ds_fgets (FILE *f, dynamic_string *s);
- char *ds_fgetstr (FILE *f, dynamic_string *s, char eos);
-+void ds_append (dynamic_string *s, int c);
-+void ds_concat (dynamic_string *s, char const *str);
-+
-+#define ds_len(s) ((s)->ds_idx)
-+
-+int ds_endswith (dynamic_string *s, int c);
-+
-diff --git a/src/util.c b/src/util.c
-index 996d4fa..ff2746d 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -846,11 +846,9 @@ get_next_reel (int tape_des)
-   FILE *tty_out;		/* File for interacting with user.  */
-   int old_tape_des;
-   char *next_archive_name;
--  dynamic_string new_name;
-+  dynamic_string new_name = DYNAMIC_STRING_INITIALIZER;
-   char *str_res;
- 
--  ds_init (&new_name, 128);
--
-   /* Open files for interactive communication.  */
-   tty_in = fopen (TTY_NAME, "r");
-   if (tty_in == NULL)
-@@ -925,7 +923,7 @@ get_next_reel (int tape_des)
-     error (PAXEXIT_FAILURE, 0, _("internal error: tape descriptor changed from %d to %d"),
- 	   old_tape_des, tape_des);
- 
--  free (new_name.ds_string);
-+  ds_free (&new_name);
-   fclose (tty_in);
-   fclose (tty_out);
- }
--- 
-cgit v1.2.1
-
diff --git a/package/cpio/0003-Fix-previous-commit.patch b/package/cpio/0003-Fix-previous-commit.patch
deleted file mode 100644
index e33a8523d8..0000000000
--- a/package/cpio/0003-Fix-previous-commit.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From dfc801c44a93bed7b3951905b188823d6a0432c8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 11 Aug 2021 18:10:38 +0300
-Subject: Fix previous commit
-
-* src/dstring.c (ds_reset,ds_concat): Don't call ds_resize in a
-loop.
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dfc801c44a93bed7b3951905b188823d6a0432c8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/dstring.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/dstring.c b/src/dstring.c
-index 692d3e7..b7e0bb5 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -64,7 +64,7 @@ void
- ds_reset (dynamic_string *s, size_t len)
- {
-   while (len > s->ds_size)
--    ds_resize (s);
-+    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
-   s->ds_idx = len;
- }
- 
-@@ -116,7 +116,7 @@ ds_concat (dynamic_string *s, char const *str)
- {
-   size_t len = strlen (str);
-   while (len + 1 > s->ds_size)
--    ds_resize (s);
-+    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
-   memcpy (s->ds_string + s->ds_idx, str, len);
-   s->ds_idx += len;
-   s->ds_string[s->ds_idx] = 0;
--- 
-cgit v1.2.1
-
diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index b03114635c..20fd9392e7 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,7 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2019-11/msg00002.html
-md5  f3438e672e3fa273a7dc26339dd1eed6  cpio-2.13.tar.bz2
-sha1  4dcefc0e1bc36b11506a354768d82b15e3fe6bb8  cpio-2.13.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00001.html
+sha1  cbac50a61079b6f3bdcf9ffe42171d9257cfe877  cpio-2.14.tar.bz2
 # Locally calculated after checking pgp signature
-sha256  eab5bdc5ae1df285c59f2a4f140a98fc33678a0bf61bdba67d9436ae26b46f6d  cpio-2.13.tar.bz2
+sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.13.tar.bz2
 # Locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index e95ea742b3..19224000bb 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPIO_VERSION = 2.13
+CPIO_VERSION = 2.14
 CPIO_SOURCE = cpio-$(CPIO_VERSION).tar.bz2
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
