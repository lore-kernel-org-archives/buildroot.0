Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B8606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W6Zp4yRN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3E0812F6;
	Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4V7c9GgRn6i; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A76681283
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369893;
	b=hlgfPY251xqJnJ4xcmrHT0r0LAuJS75+PHlkdwt+UtmMtMWy9TJo7cYQ8rQPVOtjJrwQ
	 rhLA798jRMLlw+Z/rjJaCtU6rMtUVg3R8LDTAtIDOikVVux9fTj6ahprD5sUdcN8nfMiu
	 7HOxuw4FVWdAxT6eSIsS8VxJnxEfdFMn0H6Xey4zNhiH/xaqzh2XMd4Jh9BjhxJjE43Qg
	 +78NHhiHkQTcfyfbsdWs/ElAuHzQKUE5tQbMy75uLA9R5tp40iz/QXu2Xo3Z+1JbVUEY5
	 vZLHpIWFpt47IhAgzq3+4Vg5PTsdpYN2BaMOAxjoQN6oZRJIvTxBbYaOZcU7yAvfp/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369893;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6SlotQ8FJWud7efrBoShJ7sZuurAVkBqIIrOhEGh60E=;
	b=I9hbH7o98fgRYd+eUH0MegE2w+7tKb95cCQ+wAZBl8iCpcO/ViW6kEuQwkPwA301V4R4
	 yeFf/76kF8x5rpNUbbhK3eBxKKqdWwrLWOGLIQrE7nXqAVG+OYw1mrTr69Cnnc4ZxEtuR
	 6+Z0O5lvOX+/4v8KQ7JNRROc/CvLFtSStPtJ5+t+Hh3Syqate2jkyNlHC1z5o/8wE+XnT
	 //ZuDCItm3qYZu9SuIj1Jgc6HrK7GaI668drUeuxz0gqHlqAQXf3oVmYkR5iOUPwyG0HH
	 3vwWHAh+nSVBpGnEArUuUCJZNAXirOqcYEs01eghZCSfYacMMNsZ7kw15vO+3HPHrXQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369893;
	bh=6SlotQ8FJWud7efrBoShJ7sZuurAVkBqIIrOhEGh60E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W6Zp4yRN/8OL+h31UaClPC7FhvASOxAmzAFNVey+WQUTewrsPG38JfJrVn/ZI6fLJ
	 +UIvl/PCCPnlqExJQ1HDPYUS9I/iGAdgQ4PGoA2nMt/TjrAfhsqAENePnVpyXDCirb
	 xbTLWng9DyjbppBL0tU6EaTdljwwEWDYVifhLDPR/UPz5uOLx3T2vopLsC1BDvbyVs
	 A0vwDDPg1/VzIbXh35HICYfEP924TiUjvtnGIeLxXVkkdKt5oT24Rs+xPJrd5LG8c9
	 LfLQ+yrZ6aVyDZs1kJUupkYEM6voAHC77eluzqhAauED4vUyhQjWUqQUA8chLWyLJg
	 Qhf9eu0TjQy3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A76681283;
	Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87F2C712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 746AA812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBAjNmPSQSHv for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86DA781135
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=ZZfc6KN/7+dq6jCzDvq/KuTs2fxGwevL4Nz9pxZBpqj51uEnU7QnBq0onRqarxceSjFx
 5XNlRZnvKUT+lZJ8REzuBlxgJZ13iKirOF/fnyke4G3VKVusk4fKkS6fxf8OJxTg9Fm0n
 xAWyuerwIAtsXaWijqDZijEhBYn1IJNreKbi4K/NNq3fveyq0EU84wU1a6j9G6sOf8Tub
 P205ff/mw8VshZbi8CZSKpy0NX2VLN1lNRBq34TsykYrJk+DhAp1tBRfSC+4+hP9X1e//
 St+p2sOocJu6yEX86ptwlnu6pKeEPvwv7s8UTxG1uP+327azkV7CVorkwYZNCrjKVPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8RX44qVf19yIU5N/ZpzBXSiJF5SdK+jL4NJrGVxeYY0=;
 b=EUAA5FMoz7mP2DPBiE1Tu+h5LGZ+I2YMH1xuKyUs5cyPM27m6qLttenXmLAhHQ9yw23Z
 7EeHlBnVX1WiCcsYJ3zSTXaWTcOh5LbFg4vosNygkdk8r1yhT9/ZkZJHbBaGVOheiSjpb
 d6TCRXiQUVVZIa9Vrb5Dk1qabfekGmbZ1cwAvJcBuZ6JUxyZ3+1CBygtYEXTcf7c8uPLX
 8aC0c5quLhohQPOKVcBrooq2mn+BhH/yrC4hkQvpYqwGOnP7JoPArje+bLR4tmjjGOuhr
 T3O7YtfiAOjZuyKENOgrRwhUkdGA8eJUtDOCv8QyVEibSHH2z2CumUR+J34KONnGKZw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86DA781135
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96A719D38A; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3f5f2fc67282b18e658dd0dbe52eb3ecd8e62191
X-Git-Newrev: 32bc11c9bcb2c2c5474b678f35b584bf56e79908
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.96A719D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ncftp: fix cross
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
Content-Type: multipart/mixed; boundary="===============6476998396521121846=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6476998396521121846==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/32bc11c9bcb2c2c5474b678f35b584bf56e79908
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============6476998396521121846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6476998396521121846==--
