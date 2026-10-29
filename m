Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97931606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ETIiZ//c
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF2460D65;
	Fri, 30 Oct 2026 14:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UHlQ5TX-ghfN; Fri, 30 Oct 2026 14:19:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5337B60D4E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369993;
	b=quPBwOBkjWdkucI95AsXkr2vVPR8NoceepR1oG64POXv67xx/WMkhv2fT0r/hghVRopx
	 NTYa7VpfVFegx2hrZFfllp2BV3qkA/LWZrFaFK/1jk+Q1//44DcnhO/GkqMCb5m400o1r
	 oNd+Ac4CbWdrOaN3EtBDgRD5SP5c6OBFZb/hQXeUQtx9KP/LgioUsHfrD/GkVvL9SYHcg
	 caxPQspylEMW3UX2vIAgzRvRJLBG9lELkIB7nCRbSfIAROXXb3QQsAGQdoIPutBQPda0K
	 NWzYLZZiLXGBP9E0PADmyknoGPRBhLXU4qsO8EKZ9gm4kJecR8gewU/Pm5WtgZM9erg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ARxk4vn5Inqx0HRudvdDjfSIpSNBu8GCT6Vmpzs7/78=;
	b=maADBD2XVbiGHgfYYSgefupR4Xld51K1INWwl04MIxpZQiyHRA0TfdH3pXrqg2Y40aHB
	 pE3ryQ/8KONVGSYx2HlsJ0DzBFLtMpynhSHqa60ObNj1CyGJNHk1WrDUeoNEavAKkCr4h
	 3RwtFdE/gMgRzmiheATADP4c+OUKWInQCu5MtLTKeIZ3nI3kMNkNHI8evMEcwfMl8s1dk
	 rfexuZxSFPFS22tpUI8nFSEGkIAMBlrjPOEdJxcXhfcqkHb92Hs+vTc0ZKD8CBNGnz1FL
	 WZMJchcf5C4TvEOsbmp6mRgDMwK1AfikNGZaXFi3YKfuDI4jCJDYU4a3n5XXdqpns2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369993;
	bh=ARxk4vn5Inqx0HRudvdDjfSIpSNBu8GCT6Vmpzs7/78=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ETIiZ//crX9S6KmWZQcRLCG+soK8M3S0bR6D7F9d8xooSFRgsLodJxiY5mPgvNXP9
	 BneHDNv1TRRO2HVcJxXkrV7bmW492ArJ4g7f2vcCQyF2Qyy8bfWOSpg8LyhHfV0f2i
	 kvqxlWq8O1C7LwM88g0Wkr4FBenfSSU3fVtD/p2QETJW+seoFQr5R7Szm/P9ipd649
	 EhTvRnyICSCODm9oNZTLgtUqC2K+EQddkXezA7xmchfcxvdRDNhPFDlKH4Nw6e4/jL
	 Z5HZdrUbnpkzJYx+yk3sOgMzoqwe1lYdEmtdpTm1ZXLavFCrNnrT12bveegX6Z+K/K
	 HyBuURhwjLtqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5337B60D4E;
	Fri, 30 Oct 2026 14:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0DFD712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3304400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFGOwyofafFt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 043B24052F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=GyJboCKbtxQneebnSYZqqzni0GwXdOef2YMYf7MtxgBRz0+nYdVNLBVk0Xx9qd3ytY9L
 E6Ozrj/UhTxtEYfgKNURiTNW5ImK0oF8JuVcd5npc2LIsec4W74zRfjiMqbT9BqFbAzOc
 9uLy/+xRVKARzx0YMCA07HPFhlkJCW6aYfYsUmmc/2N2vTi3iNvzU7UmzR7IyYPZb+7PR
 tUgomz8cNKQSp0k44ufrqa+Y+2+7ca+TDY3lyNuiD6f+rG8WtFHlviZMQwyMwy33nA+Tl
 uaCwN9yGafHZf7PJP8Pt30kKW/Jm4nc1yJa5JC5f/SbJmwexGMr/J0BW87peGIufaMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pGPtWs57laBnN7z7Ljdd2p9R3+wefx7QyNWV43J2Stg=;
 b=j4CVY6xqshFZ2Q0wU+EpuVYUriG+ly8Xun0a+xAXoSOFtY9HPPTYzYOeUE9GB2Cr/Lv/
 Zf+XppSKMAY9NzqxDI0uQNN0xEmJ7bp/aWEbPj6j+aUBPWjT3FKj8FX6B/iwQWnVavn8c
 5Y1f+VPh7DJ0fcdyqSZLdRkxKxPCYUeFIWa7KFxZzbHZOppKUsMgLtt/fwJIXxEAIWogZ
 W+ywD3Z8pHF9zRTRp54rua22zKP9sEhfaJulndZEoVNenhiyzGqr+/mRTF3k8mT/SbBqi
 smU2v2P/bQKiYWWDvxTpluptr3GPKFJqk4T3Uqnbd9Vvb9frJEb+8Vaxfplu3UAOoSQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 043B24052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22EC29D389; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 99980185ddd134c0caef6f68974fa8cd4c5555a8
X-Git-Newrev: e13239da7fa32d50898f0c5d203d95c436fdb0b0
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.22EC29D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/parted: security
 bump to version 3.8
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
Content-Type: multipart/mixed; boundary="===============3076529339831903511=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3076529339831903511==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e13239da7fa32d50898f0c5d203d95c436fdb0b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes the following security issues:

- CVE-2026-89085
- CVE-2026-89088

Other changes in 3.7 and 3.8 include ExFAT detection support, several
libparted fixes for corrupted/unhandled disklabels and a gcc 15 build
fix. See the NEWS file for details:
https://cgit.git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.8

Drop 0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch,
which is included in this release.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92b2747f46673d69710f4f330adcf836c0d66294)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...4-PATCH-parted-fix-do_version-declaration.patch | 44 ----------------------
 package/parted/parted.hash                         |  2 +-
 package/parted/parted.mk                           |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
deleted file mode 100644
index 78709e07ad..0000000000
--- a/package/parted/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 16343bda6ce0d41edf43f8dac368db3bbb63d271 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 12:22:22 +0000
-Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
-
-With gcc 15-20241117 compile fails with the below error, update the
-do_version declaration to match the header in command.h
-
-../../parted/parted.c: In function '_init_commands':
-../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
- 2469 |         do_version,
-      |         ^~~~~~~~~~
-      |         |
-      |         int (*)(void)
-In file included from ../../parted/parted.c:28:
-../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
-   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
-      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream: https://cgit.git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- parted/parted.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parted/parted.c b/parted/parted.c
-index 3abb52f..fc2aeba 100644
---- a/parted/parted.c
-+++ b/parted/parted.c
-@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
- }
- 
- static int
--do_version ()
-+do_version (PedDevice** dev, PedDisk** diskp)
- {
-     printf ("\n%s\n%s",
-             prog_name,
--- 
-2.34.1
-
diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 6643ba9fbe..9218deb39b 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612  parted-3.6.tar.xz
+sha256  a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63  parted-3.8.tar.xz
 
 # Locally calculated
 sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 5b55a9f21e..314bd0d3c4 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.6
+PARTED_VERSION = 3.8
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux

--===============3076529339831903511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3076529339831903511==--
