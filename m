Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF73606A325
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q13Dyy2F
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366E540636;
	Mon,  9 Nov 2026 08:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRWV3H3aud-H; Mon,  9 Nov 2026 08:42:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1FEA340612
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794213720;
	b=pK6NQPE1lsdlFvVczCd+SxGc1ndMEKxhJj3ZXcrn4iukK0UbOniBx/xFwgqC8/Gcmb7j
	 Cnzcbcpn2nYO1f/6GNKogmDQEnqbFqaRkuVCNBWtsITXfPqZwe81JX5XwTkWEraogj44T
	 xYpU8BSmOf1djvrYLfzhyl+FNpH9bn2gI00SaBU50aWIAkQjCVgDaJASaIX5DEwLg2EuF
	 SAbP3UNtAepx/luh02OFeOxKKKnq4Aad75tG9T7+pyY3sG3lbhEq5xjh7FYbvO5k840xU
	 8htYTSwVoZfwfZoWQ3eqS17AluDl9kSeCkPEasIZXxiJ3bUj1d/bnKunUPegxJwViSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794213720;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pYXuo6IoaEnVXy/4EU6QwsCq0DSw0uYBHeL+fUR1pNQ=;
	b=NNaCVcWotFcoco1a3vfIY8Dpz//C8c5pbC3WZywfKGtBLmqVWT4ZQLbgBGaJGD3YNrlT
	 KEbXlGAdNOpth/gm05+WCyYBO+/4yrS1k0DiWwlB3x7Q+B36Qlsxgm2cVut9Yadpx3GYX
	 2AgoxsZ37V1QZ1n8XVrQ0w6+ol/62gFYMl36AdZUjvHPfI26BIO4kl5kGbTZkCHkvxWaG
	 PNQGD4h59Gq6msv9KO+MatncFaTWSrRpu1hwyff/rfgJ/zjTFydCFlbsCOtpbxc9r0DVy
	 83qrKOGdG0G+M8PtT4aP91LI2garCSESUy2ofsPKLDz93XhMqkFiRTM3pWatr2t6XwA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794213720;
	bh=pYXuo6IoaEnVXy/4EU6QwsCq0DSw0uYBHeL+fUR1pNQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q13Dyy2F0b6hsfwFz9kI85hd8roTl8qmgbpkkgAKj5HyL2HUVQKkq0vMF8ErUxafB
	 9gjAcWShUfzKO5erCcdqeDFN7jIoV4407VMxE8XaLF2Atg0xlFFNpjTgZ/IPVsKsmq
	 x/Na7X6sLFw11C65r8L0dONF9xDaUYDYmnjuLNG0BiILGCChyJBoJHzkbGrAh0PNzh
	 y9kbRFkobUEnV6RZ9Wk5Jf/eDrb+75c2S9XEUscPZ8GbiaDuNGLGwia6IzRiZssjHi
	 rabfcZ1A78K1nQwTZO8vCCqOM07GrPPkyJKTlmAbjplPLuti71FPOKxTt7HRf3qHR6
	 dMpsAXH/tut8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FEA340612;
	Mon,  9 Nov 2026 08:42:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB0E1A6
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 08:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5595A6066C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 08:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAxD6qONltI2 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 08:41:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EF65F605F8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF65F605F8
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 08:41:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4d58c50743so81283366b.1
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 00:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794213714; x=1794818514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VyG5R+a3rbWAwL6hK7V/yf/Cr2uS2NSU+laW6591Pq4=;
 b=JwqYDFpip5d1117dXus/nEDlUjEK6IlB2wcAQxKX302F6w8HmxWdM2dXVQMxTcaYJj
 0KtnnVrHionLlEAWaSE4hDgUCS4/u7TedIgf+KVfbiGvIsw17XFvNv7UPoAuxcdw3bnK
 4XngZXDF4NW27W6o5+lfy+IyNTp9cs7dus4wjJwJ717VDvDvUz/Y88mwuyOuyxwVQ0Ni
 YAB3KFmRZAngJ+iY+su0SWcdLlGxIyI7TF01CcyVkyR+3Oi9XAxdukghdk7FTpMKzCo/
 zSl1/MG53rKCD0mZw4Ed8xsBkPvFItIJd4zvfYXKnimD6bcjzj3Ygj6gXyfr0TuA5mhb
 LVmA==
X-Gm-Message-State: APuU4Z9k1y+6txpvoZ6u90HlhOg9bQhTDj3L3JPNJmhXJqfx95Cw1atk
 7PccswI2GxU1J1frA1fNPjUkvZmmiYqvZLZ1pevYdYoQIXq5SI2hPOOgbdFcKg==
X-Gm-Gg: AYBFou0/YCCCx1WHpHw54N06Pl/S7OM4nRRj/+jRwklWUq4zBXrjU7BtR0jaajjFMN7
 3iiofFWtcf35845hp3rPohP5Z8KikqefBI2nGIRt/2p8yiOO9oN27h07NvmlwBQNe2aNb3ZmCDm
 /eVFaw2WziOPqaniUh3psxet8dFqoh/1bscgWoxxPV1X7dfJGKGbxgXkhhSAlcW/QcdSIO6ZcBL
 l0EGq13fwf3AzaoqpPdAhRM5Ihs6PuOcYQX+FkwjnY87Uml/WUhDfC3xY85xa/cCwJCLfAMb/Xl
 pojnU7ShDZPuZy+01yugeoKecD9wiVqazLKisquYvzS8+ml55A5+5aTButUzCxoIrYUdegDCwDs
 12eltooW7tx4zvAUx69DzQqkfFm7a49zDeJ5qGabQcUXOFMgaz9FvTpH57kVe2ToEsIUmJc4UPM
 bW3CYUm8NYfzE2cpwmrO1PrzCzhEpcFh8X9kqt4jVlyegfNHV1fZGo15Jj9OShvME26RqmbiSFv
 5SSKVec/BI6gh26GIHhNxpR72MhFMLnuQGvukLXylTqFXhfDRHMVsKwCRYCApPq6k0PXlCy3RYR
 ARQ2nZwiibSMIZGniFSgN5BsH0XN1FaCXU/oVxUtjJagX+eqIqlKY4N+YhU26JT50Zy6yqm/Bgm
 UaeEPwSiEpTFFaH2IkvKN9Vy7OS+5Wg==
X-Received: by 2002:a17:907:d8a:b0:c2d:bc33:7be3 with SMTP id
 a640c23a62f3a-c4d6d84dcb5mr219167366b.47.1794213714367; 
 Mon, 09 Nov 2026 00:41:54 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d69f9440esm141654366b.21.2026.11.09.00.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 00:41:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 09:41:53 +0100
Message-Id: <20261109084153.3832689-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/berkeleydb: fix build on ARM FDPIC
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building berkeleydb for an ARM FDPIC target with GCC >= 14 fails with:

../src/os/os_yield.c: In function '__os_yield':
../src/os/os_yield.c:53:17: error: implicit declaration of function 'pthread_yield'; did you mean 'pthread_self'? [-Wimplicit-function-declaration]
   53 |                 pthread_yield();

dist/configure only adds -D_GNU_SOURCE -D_REENTRANT to CPPFLAGS when
host_os matches "linux*", but the FDPIC tuple
arm-buildroot-uclinuxfdpiceabi has host_os "uclinuxfdpiceabi". Without
_GNU_SOURCE, uClibc-ng's pthread.h does not declare pthread_yield(),
while configure still detects it at link time (HAVE_PTHREAD_YIELD), so
os_yield.c calls it without a prototype, which is an error since
GCC 14.

Add a patch so that dist/configure.ac and the pre-generated
dist/configure handle uclinux* like linux*.

This issue has been present since commit 45c0a5114d44 ("Revert: "arch:
drop now useless support for FDPIC""), which re-introduced FDPIC support
and thus the uclinuxfdpiceabi tuple. It therefore affects 2024.11 and
later, including 2025.02.x and 2026.02.x.

Fixes:
https://autobuild.buildroot.org/results/29766038fbefeb00ccc2a457ed0ff52c8f93d158

Fixes: 45c0a5114d44fa1c20b06ef9d2a4ae7ecf26658a ("Revert: "arch: drop now useless support for FDPIC"")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ac-define-_GNU_SOURCE-on-uClinux-too.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/berkeleydb/0003-dist-configure.ac-define-_GNU_SOURCE-on-uClinux-too.patch

diff --git a/package/berkeleydb/0003-dist-configure.ac-define-_GNU_SOURCE-on-uClinux-too.patch b/package/berkeleydb/0003-dist-configure.ac-define-_GNU_SOURCE-on-uClinux-too.patch
new file mode 100644
index 0000000000..3db1de9be3
--- /dev/null
+++ b/package/berkeleydb/0003-dist-configure.ac-define-_GNU_SOURCE-on-uClinux-too.patch
@@ -0,0 +1,54 @@
+From 3004864ef0e8803b0bf974425451f2b6862c16e4 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 9 Nov 2026 09:15:09 +0100
+Subject: [PATCH] dist/configure.ac: define _GNU_SOURCE on uClinux too
+
+uClinux (noMMU) toolchains use host triplets such as
+arm-buildroot-uclinuxfdpiceabi or arm-buildroot-uclinux-uclibcgnueabi,
+whose host_os ("uclinuxfdpiceabi", "uclinux-uclibcgnueabi") does not
+match the "linux*" pattern. As a result, _GNU_SOURCE and _REENTRANT are
+not defined, so GNU extensions such as pthread_yield() are not
+declared, while configure still detects them as available:
+
+../src/os/os_yield.c:53:17: error: implicit declaration of function 'pthread_yield'; did you mean 'pthread_self'? [-Wimplicit-function-declaration]
+
+Treat uclinux* like linux*. The generated dist/configure is updated
+accordingly.
+
+Upstream: N/A, Berkeley DB 5.x is no longer maintained
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ dist/configure    | 2 +-
+ dist/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/dist/configure b/dist/configure
+index 32b2c66..3fa913b 100755
+--- a/dist/configure
++++ b/dist/configure
+@@ -5115,7 +5115,7 @@ cygwin*)
+ freebsd*)
+ 	CPPFLAGS="$CPPFLAGS -D_THREAD_SAFE"
+ 	LDFLAGS="$LDFLAGS -pthread";;
+-gnu*|k*bsd*-gnu|linux*)
++gnu*|k*bsd*-gnu|linux*|uclinux*)
+ 	CPPFLAGS="$CPPFLAGS -D_GNU_SOURCE -D_REENTRANT";;
+ hpux*)	CPPFLAGS="$CPPFLAGS -D_REENTRANT";;
+ irix*)	optimize_flag="-O2"
+diff --git a/dist/configure.ac b/dist/configure.ac
+index 689f3b8..a9808bd 100644
+--- a/dist/configure.ac
++++ b/dist/configure.ac
+@@ -199,7 +199,7 @@ cygwin*)
+ freebsd*)
+ 	CPPFLAGS="$CPPFLAGS -D_THREAD_SAFE"
+ 	LDFLAGS="$LDFLAGS -pthread";;
+-gnu*|k*bsd*-gnu|linux*)
++gnu*|k*bsd*-gnu|linux*|uclinux*)
+ 	CPPFLAGS="$CPPFLAGS -D_GNU_SOURCE -D_REENTRANT";;
+ hpux*)	CPPFLAGS="$CPPFLAGS -D_REENTRANT";;
+ irix*)	optimize_flag="-O2"
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
