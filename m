Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995CD606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YnczP5q8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73BDE608AD;
	Fri,  6 Nov 2026 16:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlNHg_J2HBMl; Fri,  6 Nov 2026 16:08:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 651C2606B1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981302;
	b=hxk6rt2JglSPpzGFMtKF3wfWbj/aE1qKVjSkQx+jQ5ZBlpkZKn836aCOnXxwctRS5fso
	 vXGH5193Mt1zuQ0cFMHbMtqnppW1d94Yusga6o7QyKw726SNF8Rp73eTnSdg64NeAnjT7
	 BLMQUM/aAHtyGBmus3ZloiBRgYJzs5kUfjPn1wwERq32jAEvCYfxExePiMAdnhXjxROP7
	 IhuB4crrKJOkK8cbkx7/UWGIGTqfTrsdeV+Prto8b/Pa44BSrZYBLJWlO5wm4RJGGb4Tr
	 hHljTvOxbsk4L8TAQlnqiElWjl9q++GDwXn0KUMBQ4UFB80eT0GxavTxNwM+Hzgtccg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=e8iHSMYKJkHxqemSAeA3ZVXovGWdiTJZhgWTT+FYVXs=;
	b=fhcDETpXCxCldUf4YGlsA14+dBYRzDT3ZxZ/PJeFXe2zklaK8iKAqutpFd0HUw584hCh
	 CwemcnYZ1gyBUKf2tudfZfxozq00SlWH+YaaQUNx4UYx3M3H8Pkr2iQVt8+C5SjXtFwjb
	 OzeYRP5cK2CViNU2quZysIZ7t5NdiWNc+OE2YRlmQEgIOL7bgfNcKTd7jX9FtykvzIAsf
	 NgYV7KpK+Yr06EH3THWZ5QJb6GmoxIQnorNuOK+PvuXvFfI7j9a/l8X9GHFhUtVCbRGug
	 +lyw8+17r4Jh013AwDqo35TfEotHdrGrUD7G8lSv/bCMsG/dEzq7stVvNjuGU7EmW1Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981302;
	bh=e8iHSMYKJkHxqemSAeA3ZVXovGWdiTJZhgWTT+FYVXs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YnczP5q8KEadziLQyAx2a/c5iLeh8helRFmFB11hLQNpj7X4Pln5GPd26294APDaV
	 y7XzpAhRX7R9q3VBZ8MlhZS3xuOaMAvHYg7ykNSN8Dish0e5Et8UUF5YVcJ8OE6YQd
	 x/2ntTQ2JctmlXj36/MX4SlfOZ18Wqg67fh2p+syN4rgmlpc2oj5zlAsFeFPa5fabE
	 Kk8sn15131/MOymRb1BksIWGoBGJADlpeZAetyXFpIAbB02ozSp27vRLaKNegWWFd3
	 UUDNAghGIiU4c49mNy//vS5mBnYwDxcSYOURX5qbB+3CO5e4kZ8UZpw0h+aZHiaG6p
	 mHXoKsDlKtyGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651C2606B1;
	Fri,  6 Nov 2026 16:08:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B22E4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D46D40911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aR34mcccsNSc for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 622664090B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 622664090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68FE09E09B; Fri,  6 Nov 2026 16:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:56 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 80c73c3a46177c4982773ca08a5ad018bf0e4ba9
X-Git-Newrev: 7fa7d79f377ecb2feb22121e025b9cd570d83946
X-Patchwork-Hint: ignore
Message-Id: <20261106160640.68FE09E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ccrypt: fix build
 with GCC 15 on musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5157590277672344443=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5157590277672344443==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fa7d79f377ecb2feb22121e025b9cd570d83946
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

When cross-compiling, ccrypt's configure can't run its getopt_long
test and always falls back to the bundled getopt. Its getopt.h only
prototypes getopt() when __GNU_LIBRARY__ is defined (glibc, uClibc),
so on musl it declares "extern int getopt ();", and getopt.c declares
"extern char *getenv ();". GCC 15 defaults to C23, where an empty
parameter list means (void), so the build fails:

  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1

Add a patch that always uses the full POSIX prototype for getopt()
and gives getenv() its standard prototype.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"), which made a C23-by-default compiler
available. It therefore affects 2025.08 and later, including the
2026.02.x LTS branch.

Fixes:
https://autobuild.buildroot.org/results/dd2b362542488a306a523fa05dedc859dfb0cf7e

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8e9bda8e6434d1cf7b7ec33d5b40c2a9723405a8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...d-with-C23-compilers-on-non-glibc-systems.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
new file mode 100644
index 0000000000..002d011062
--- /dev/null
+++ b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 26 Oct 2026 14:41:24 +0100
+Subject: [PATCH] Fix build with C23 compilers on non-glibc systems
+
+C23 (the default since GCC 15) treats an empty parameter list as
+(void). The bundled getopt only prototypes getopt() when
+__GNU_LIBRARY__ is defined and declares getenv() without parameters,
+so building against e.g. musl fails:
+
+  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
+  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
+  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1
+
+Always use the full POSIX prototype for getopt() and give getenv() its
+standard prototype.
+
+Upstream: https://sourceforge.net/p/ccrypt/patches/7/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/getopt.c                | 2 +-
+ src/include/getopt/getopt.h | 7 -------
+ 2 files changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index 23ab9c3..9974486 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -209,7 +209,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ static char *
+diff --git a/src/include/getopt/getopt.h b/src/include/getopt/getopt.h
+index 1abae0f..d8b4edd 100644
+--- a/src/include/getopt/getopt.h
++++ b/src/include/getopt/getopt.h
+@@ -141,14 +141,7 @@ struct option
+    `getopt'.  */
+ 
+ #if defined __STDC__ && __STDC__
+-# ifdef __GNU_LIBRARY__
+-/* Many other libraries have conflicting prototypes for getopt, with
+-   differences in the consts, in stdlib.h.  To avoid compilation
+-   errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *__shortopts);
+-# else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
+-# endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,

--===============5157590277672344443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5157590277672344443==--
