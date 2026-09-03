Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70871C61DD3
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 11:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF1840AC0;
	Thu,  3 Sep 2026 11:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOi0nGTIjN-Y; Thu,  3 Sep 2026 11:47:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C2CF740AC2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788436054;
	b=g2FV+0/Hn+aEtdfk66PTvkMqZ4514mG0ydmnjFa2+Csxa1TPzTiNDl39tl53PDte/ApU
	 4Kk9eFeroMA7E+MThr2KFr4YMM824lgShhgxfcRY5G5b1ZqsCiLbQgTq4vgoykZcqGNtI
	 M4Up+h+gdU7zpahcCsQAG5tuQuCHcJ/p/G1pZfptk6JO597/uVg1HaR3PpW1VxaErHRnm
	 Jyfxf4lJmHAhM3vqfWpAFlpy0/IVGYLFQF60DZpxX5I06NM0IDnt6HNEsAWopJC2gFjfj
	 SE3thJKaSNXeCl1cQu42aIRjP86NWA5q7zwKpS6mabnmS/nwC1YZ3l/ggypEwZdgOhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788436054;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qCYYjmFarLpqI5IkgyZkDxZxEH2EZg+lEsETwd3Hwjg=;
	b=HEFhCR7k4IwZ3OjJktrR05Kqm6uW2AGmFaAgG989q1kyhpLuy0PZD4ZCM0NAXqk0UgA+
	 nEINbuoq5KjYORhWP0BTbBvTCwZvUagL90pCBdldSdaCCgYWW1yAZZcIrTy3tlliSX/1K
	 sujlFBebl+cC5VqwEA1GNyecjEgclMh4GU5ECp0M/uZ7cQHSEouOauEUzUr1tebcwTTLk
	 L6Q6pfSFv4hpGMmkVIkbC/HsccPzQZAicPHYR312NLANTAmh22dIOMAqZYvoKdM4OjPEV
	 Iscdq3ouVhJBjdPMn1G4OLMV/dRMY16xaKu0jnZjbV4ZQ3PomrJpHW8bTe09VXB5d1w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788436054;
	bh=qCYYjmFarLpqI5IkgyZkDxZxEH2EZg+lEsETwd3Hwjg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=L9Oua0Qcz47Q+65TtTr37xge1ICpjxMgRv3Y8fOpCOVlINpKyXyhRbW03AjAO31xF
	 llTr58KT3v7Z6MFafBCAACyI366bJBP7LfvuNCaEWc3X+xREuYv7CQfZqA1HSGLb/b
	 MUMMUPxe2K5NhB44lUZTSvM5hnnXEN8oGLIoRNFSrwxhZttKttg4rJHf0QxzMtgMDm
	 J28E/bTiiw0r1LF6Hv3C7Uz0VXmt6j0Lffvr0RkCAHfWalv19TeTUeQsSmbj2nvY1G
	 30kQIDOTv53sJlBIVXVsJ6hTnLuIwWeyC5o1LeUX7vlCkiwnx2psLTewTzWFGzSYup
	 T5XtyfX58iPKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2CF740AC2;
	Thu,  3 Sep 2026 11:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A902265
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 11:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F055040AC2
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 11:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoW1NXBR7rGZ for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 11:47:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BAA1E40AC0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788436053;
 b=UXjGRZC+gSfy+8DkEeKNAlz0eyhRBYOqazNgwHLUaxwhpZ12+G8E6ol8CmooDOKRKLlR
 TS60L4KOiYhLPG39yTRhHEL06qdSuZXTP6+khDL8YgutBF0dKS7cs8T885yEEoOrJhVCq
 j7jQMG8xrVQkl8wIgX4E9VCl2lqDIAmlGBa/dbRWOh7iTxauCAUtN1eX42QEglE/Fj36o
 cb6emrAPj1BIsQsRbz4w2QSuJJE2LVhwOux/qsykcO1qtuXG0s7yNVQ8ikEommXRS/Uwf
 wUdC3KGXUe8gZzQQR4MQ0lDL+5b54LMlOkB6c/vJMXx1Fjl9tMpcT1eA90DJMB7SZmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788436053;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=OXqCWjEvJF42W+WsTIq/HARt+o7m7WvVmrHVl1Lz7UQ=;
 b=mKTkOGMLRVaSQmCU4cu6L3YWdMZw9zDtNBs1FzuFqL2nRqdjqE8XNKCsO/VsCZIfp4UX
 Te8+XLlQvu4gN0LyYEoX0GsUY6V6Wzld7kg9enddI3YaqRqXuVefVetJ7/NQggS4dG/mR
 YNYShKljpHnGDEpOdUqH+A+nr4KTT9ixRNnOjSBsfj0I3YwVsirOMzY94I2R+QWPFaAPb
 IrwJHp1ZWELf8dpbxmvvqMGG6eB5Xh91pV+rYeHqbLR7mRgg0YroLE15qst/jJqsNlZtr
 n7FcgMpbBZr2fs6p6KXeCtic6qTkD/v01VA1Cf684muTt3U5yVFe8vtYJg8smUAkMvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=kGyowFvn; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAA1E40AC0
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 11:47:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so303734866b.2
 for <buildroot@buildroot.org>; Thu, 03 Sep 2026 04:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788436050; x=1789040850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OXqCWjEvJF42W+WsTIq/HARt+o7m7WvVmrHVl1Lz7UQ=;
 b=C4N3NkizZYha5sahKfHA0kJljDUqSanOdVg7StCrN+RwePiaSOCzrtvdDRMWggeZAo
 du+YIkjl4sf2sZe3j0UCLQmvLOPRbMcB5USw/4PzVF/sAJboV9beIZ0Jr2KHcjvO7Bjy
 ICX0x4j9VNugutJTtqA6tQPDYoxL5ACGJQY9xi7E955AccyXRCtTv12wZzRegrWDtbwq
 0l+s7Hs09/k943woCwM5igbWxDHVFQ/E6c8RAHr81RqyQkcqGTBkbv30hj8cC7Lf791l
 MPRfkxU0DnD2+bvbbDMusW3nhQRIlznbANbEqg6lZnJELIeKrLEsKBWkE1e6aFu184Bg
 ohxQ==
X-Gm-Message-State: AFuF++m6v4ywPC+W7/4E+xXGBrdn3TFhTHDHdkSiLUe2QprmPfgbTey0
 /s/C/+aZBe1zvo/nnfbftUFhJtaNEEySVWv4ruuCgAf2FvqYXIALR5k2vIRkuA==
X-Gm-Gg: AYBFou1pBqcMjiDqchb0+qjLHEmw9t97rgMmiK0/iNrkXa7IAlsU6Ta7ICYMcZgj/BY
 RaP5oXbKDszFQugm2zRPmQrkXnNHNB2NvrObiT+FFwGhLMdwGkN9tux/YUZPQln1FL98b3WQS6f
 BnJRZl8CHo9f8BmxUh0JRDR2S6IdVI63Bz1ohQETW52CHN49ymfhsbX7HuUoluNY2A/SIFk8cac
 05AupQnbQpPewoOOEa/17Dz/PhoQYO7YD72QV8Pwl1mjd33qlAiwgEKjV6LQgNlwcrlSuXqWDOn
 vCTvl/4bOiHOqolErZZPj2Fxra46qeeXwXj+mgZggDfSwUipj8g8FtbP1PK2KLR1CxpGHsb8PRD
 RJaOpxBIEMwgQ4DzU1GIOwzsTxNKZQWLO58VJ72f4kRPgNYwLTNFKZlO1dwDpsJSlo/a46zojrF
 yqDmxWSMn+YpzRzyuOW1HW+hDwBLSUwCdlovmpkQ6KIWHtj4w/6Nwxym9udq2DCEofG1jTc8xjb
 HF18LoZRc5mX+6Tb29OiYtaLuIhDoaYYQ/H
X-Received: by 2002:a17:906:6a05:b0:c24:c24f:e176 with SMTP id
 a640c23a62f3a-c25d5440617mr712846566b.15.1788436050005; 
 Thu, 03 Sep 2026 04:47:30 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c25f41e71a9sm90589566b.43.2026.09.03.04.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 04:47:29 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Sep 2026 13:47:21 +0200
Message-Id: <20260903114721.984785-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ncftp: fix cross compilation detection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Claude Opus 5 <noreply@anthropic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

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

Fixes:
https://autobuild.buildroot.org/results/ab25f98d7ab8b397e2aa4f87af9cf1d814f3d6cc/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Co-Authored-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
---
 ...cross-compilation-from-host-and-buil.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/ncftp/0001-configure-detect-cross-compilation-from-host-and-buil.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
