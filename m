Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F3606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ML1XJOdf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AEB811B9;
	Fri, 30 Oct 2026 14:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiuCJ6CgYHT9; Fri, 30 Oct 2026 14:06:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A924C81180
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369183;
	b=I3NB2ygZLgaWsnG6aR/2bP0n8kcjvKMry12tzOyxxpm1yx8O/8qS+LidvCHACGK7hrSm
	 Z4sPtONAy3NeiIeuzYJHjz4DSP5hlyB6PwihWkd/vVqs6+cRskSpm48+yxAgDlG3a34l+
	 8zyQc2RNBKX5pRFPddVgCn+Wq82T8VBtEPhn+6Ey0XrKwX+whFjPDABXymKb1H8iuTdIs
	 z1Yz2u5LurbvPhPLtqXqZY4LHvl4G77aCKJ9tJz9jSiDKLt+s2Gd83VXqTnBW6KBrWqSY
	 eH4Hxt9ed0ZVIxKIHBJPkKpanegz2ROmBXaHD2KTsEN1x0YrDbfdQqCVKc7IWrpeUbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1OfuhQO4YSCuuf8ncMH01IZdeZIMBAi34n5XXvXfOpQ=;
	b=AZNODNn5YIPonTo5s90xRvjsHFPB++1AObaRO936S2Wd2t+XWlkFxA1EptTvQKnm1egu
	 dfN348iWPc+gV/u6c4PLKQEPvTyGfcrJUeDR/2tASamZ2ULzBJIeb44rq6jBh4DtTeF01
	 pjXVlOlKOiPUCdJ/8SVz5bhgORa7lE99KfDS1bT4fIGB68uqQCUiDu5FBN/2MN2owU+L3
	 Mnfro2u+meJ7QcUqkU7vDCe4Pk5SdytphCRsPHjPDcKNeweyHKlBt1vgu/eQvM36IrsxM
	 ZlkG61K5IazuYslDPm0swQJUq0rBeE6YGMiV7E916yqWhgE3Af4grNGAxvYiEiKBICA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369183;
	bh=1OfuhQO4YSCuuf8ncMH01IZdeZIMBAi34n5XXvXfOpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ML1XJOdf33nwWBnF+TWTNDlPi4r73n9s4JrhQzJswj985f6GbJaX3gaV8Izxoekou
	 yx2S7zEsFebv/Y/zqG5CYbyrm2W1mnFJTCw0LnuEE6j4i+lvj9W8Og+QykkCcrHjbg
	 rJSee//vAWOMOyDcMfYzKvE2E09n8yq0xaAeeioWHabY2UA4j0R1npxwpGBHrekCiL
	 ONCCpWKmr7W9jsTovaVE9eaVFWW+ajDey9J61x+8F1bTtESFcy/i4sQW4sRbwWyvg5
	 yMyqOa6PTbFBCCh+//Be28tYDzAoCP/yyp/CgeKLFy4Gx23CvT8KS0jb82ILLydVe3
	 BJ6lRnKlPixYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A924C81180;
	Fri, 30 Oct 2026 14:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0BED44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9058140B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqM0fJ69ME9c for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 037BA40B18
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=WYtvMs8auPKQKaxi9LE1iMl5WILS08BdKEYpE+r91mYWyc62KYUkzy1O63qQA5dpQVCP
 iGITZHTnfnfGWRg8nwqjEIUsuEn2jTxD3ECW9MT4T8HMp3HMLTdtW3uQkwNWFgiwKxSLA
 g8EYMrz+jsKiL4biV+oEAy/XIPOGao23lQaurnq07OpYE41By8h2T+1kY1rZ/QQscGaJ9
 ooP4zWhOlvQ+ubqbWSjhNuu8YPbHnwkEJ3pDpLmhInQ/pucPU7MSd6iu7IefORFg+8P1D
 fUvW6E/UgdM22hwq8NQ4sFBhXYqMsubFs/WYzrsaq0DOWwH+RO3JpZzszdr5Sw5Kn5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=z/TNqRETR6rbbJ3xQucNvzRJvAnwNXDnuBm8UdN5Xe0=;
 b=QUYlv0RULyA4ycDoQY51qUKnGpJJr+8he6XRiQxeZf2YnxuWShx18Td6A0Tlvw3oi6mB
 rfdZYMR+ehZtoqN1p+sMDoQs9E33iJjIt1+Cn4NWTzzOr8qoFU62XCDyoOpluTVOX7eCS
 oKvKOmEOmGiykknzX5AXgESVywlQAJN7Rd9yZUwcwykzyh6zkkmDWTuB6t6yOslPVr1Jc
 RNTaPTzN4WiuXzU64qMIbv4ewId/jcvbIe0sYL+fP+FvFAU3hloqSlXzOizfoQC5yWe0D
 eCTRFDvBC0857mYSxGK5LvlV1+oOIKyxdXD7jHltKUdwiierrlPvaZGupF11CHA/dEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037BA40B18
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FA449D388; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: add8a63fe0c3b3f72ac03066d8bedfb073b3141d
X-Git-Newrev: f118b1d4459b60cca4ee5b5ccf18845ab37dc477
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.1FA449D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ncftp: fix cross
 compilation detection
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
Content-Type: multipart/mixed; boundary="===============4284774765163680447=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4284774765163680447==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f118b1d4459b60cca4ee5b5ccf18845ab37dc477
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

ncftp still ships a configure script generated with autoconf 2.13, which
determines whether it is cross compiling by simply trying to run a
trivial program built with $CC, instead of looking at --host/--build.
That heuristic breaks when the build machine is able to execute the
binaries produced by the cross compiler, which is typically the case
when building for x86/x86-64 on an x86-64 machine:

  checking whether the C compiler (...) is a cross-compiler... no

configure then takes the AC_TRY_RUN path for the remaining tests. Those
tests link against the target libraries but are executed on the build
machine, so they fail as soon as more than the bare C library is
involved. The most visible victim is the curses detection, which links
the test program against the target libncurses and then runs it:

  checking for curses library headers... checking for ncurses.h... yes
  checking for curses.h... yes
  checking for curses library... no

With no curses library, ncftpbookmarks is silently dropped from the
build and installation later fails with:

  install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory

Other checks are mis-detected the same way, e.g. the 64-bit integral
type checks, which end up breaking the build itself:

  checking how to scan a 64-bit integral type... cannot scan
  io_get.c:763:96: error: expected ')' before 'PRINTF_LONG_LONG'

So add a patch making the generated configure script follow what
autoconf has been doing since 2.50, and consider the build cross
compilation as soon as --host is given and differs from --build,
regardless of whether the produced binaries happen to be runnable.

Regenerating configure instead is not an option: the macros in
autoconf_local/aclocal.m4 rely on autoconf 2.13 internals (AC_LANG used
as a value, AC_FD_CC, __oline__, ...) and upstream generates configure
with a patched autoconf 2.13 (see autoconf_local/acgeneral-2.13.m4.patch
and acspecific-2.13.m4.patch). A modern autoconf fails with:

  configure.in:53: error: AC_LANG: unknown language:

This regression was introduced by commit
f8bc27111531e9607f79121414f61c0c2d5f83c0 ("package/ncftp: bump to
version 3.2.9"). Before it, a pre-configure hook regenerated configure
with autoconf precisely because the bundled script "doesn't detect
cross-compilation correctly". With 3.2.9 that regeneration started to
fail, so the hook was dropped, which brought the broken detection back.
That commit left the host-autoconf dependency behind though, so drop it
now.

The issue is present since 2025.05, and in 2025.02.x since 2025.02.1,
where the 3.2.9 bump was backported as commit
6b0e4d82c31ee04e8a6abb48323252a7cd97c177.

Fixes:
https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc/

Fixes: f8bc27111531e9607f79121414f61c0c2d5f83c0 ("package/ncftp: bump to version 3.2.9")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c65582cfd29a1c12457fb506014673bee727e9b8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...tect-cross-compilation-from-host-and-buil.patch | 60 ++++++++++++++++++++++
 package/ncftp/ncftp.mk                             |  1 -
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch b/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
new file mode 100644
index 0000000000..c3ecd61d1f
--- /dev/null
+++ b/package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch
@@ -0,0 +1,60 @@
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 3 Sep 2026 10:00:00 +0200
+Subject: [PATCH] configure: detect cross compilation from --host and --build
+
+ncftp still ships a configure script generated with autoconf 2.13, which
+determines whether it is cross compiling by simply trying to run a
+trivial program built with $CC. That heuristic breaks when the build
+machine is able to execute the binaries produced by the cross compiler,
+which is typically the case when building for x86/x86-64 on an x86-64
+machine: configure then concludes it is not cross compiling and starts
+using AC_TRY_RUN based tests.
+
+Those tests link against the target libraries but are executed on the
+build machine, so they fail as soon as more than the bare C library is
+involved. The most visible victim is the curses detection, which links
+the test program against the target libncurses and then runs it:
+
+  checking for curses library headers... checking for ncurses.h... yes
+  checking for curses.h... yes
+  checking for curses library... no
+
+With no curses library, ncftpbookmarks is silently dropped from the
+build and installation later fails with:
+
+  install: cannot stat '.../build/ncftp-3.3.0/bin/ncftpbookmarks': No such file or directory
+
+Follow what autoconf has been doing since 2.50 and consider the build
+cross compilation as soon as --host is given and differs from --build,
+regardless of whether the produced binaries happen to be runnable.
+
+Note: configure is not regenerated during the build, hence the generated
+script is patched directly.
+
+Upstream: N/A, patching a generated file (upstream has neither a public
+VCS nor a bug tracker)
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ configure | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index d955e20..2311c73 100755
+--- a/configure
++++ b/configure
+@@ -845,8 +845,13 @@ int main(void){return(0);}
+ EOF
+ if { (eval echo configure:847: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
+   ac_cv_prog_cc_works=yes
++  # If --host was given and differs from --build, we are cross compiling,
++  # even when the build machine happens to be able to run the binaries
++  # produced by the cross compiler.
++  if test "$host" != NONE && test "$host" != "$build"; then
++    ac_cv_prog_cc_cross=yes
+   # If we can't run a trivial program, we are probably using a cross compiler.
+-  if (./conftest; exit) 2>/dev/null; then
++  elif (./conftest; exit) 2>/dev/null; then
+     ac_cv_prog_cc_cross=no
+   else
+     ac_cv_prog_cc_cross=yes
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index c56fc86848..4075449c53 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -11,7 +11,6 @@ NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = ClArtistic
 NCFTP_LICENSE_FILES = doc/LICENSE.txt
 
-NCFTP_DEPENDENCIES = host-autoconf
 NCFTP_CONF_OPTS = --disable-ccdv
 
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)

--===============4284774765163680447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4284774765163680447==--
