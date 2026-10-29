Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D444606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U6/hM8cl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E4ED40B63;
	Fri, 30 Oct 2026 14:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-I7R6f5_y71; Fri, 30 Oct 2026 14:07:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4810F40B4C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369236;
	b=sp9ocKDXTqu0pjQ4CV8oZ3n/AYWJ84jRW+QRWCYxbfw9mnNkSNU1F0F38oS4xvOSivTe
	 6WH3BgLJyqm4jO5zkojrG3tIShDuMvSSDBIigtBZmrPxs3xygFnri8Y/GGpIhTPhBhQOE
	 yhAyg3p1T1YDMCadrVwwJOmpaBzyKeCIw08fhT6c8/o0Bj/XESLr9bv/jR+uYvDd+gE63
	 i4FDXMYEQ4yUBnFmN7/hmkbiCPscI++kztJHHhrjpyWPQwoymVRc4Sa79UW4cjsmmgp6q
	 l6WULrZ7isIeMi/8xMX+L1F+SDxrqcfNu+ZGbD9w8hwjFBkWIZBdnpGdRV3T7zAyhDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1CUPUHfg3ct6FejYzjgptifrm7ZvazL+LwT324qF0B4=;
	b=tVDIB1P8beE4P0KmoY4S0OAPbODYCQrYheD+iirslS3qSNgjc3FZOgZ5R53SatyiWBAQ
	 YIsBCX5PisoBWEL/wst/cYas1+8tIyd7VL/3knYwvDAIUyBMpU1a5KIr4Ngn+M9DpDHdJ
	 VqAxJd99QG3IUWUhbYrnnnKDdUePCzBUETRsMJ6kKY6PkIeQvDEGOmoVXzeagmxF2eEi5
	 +e5fiI9dlRPpyWZu6tA9ixXb307kMr5mpzACCJInG59zIvSIDTStzM6jDz2BkAcFqrZln
	 V8EuSrExk5FwCF+hXSB2Tbe5HUizh18NPXctt7XI0XKTFOdfdpPUZ5g1JFQ1ZPuH3oQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369236;
	bh=1CUPUHfg3ct6FejYzjgptifrm7ZvazL+LwT324qF0B4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U6/hM8clYEInG8BsuKfwfXMCV2nq5ZjYofikPCwYQD8fnSgot6NFhhkK6XPrH7LXy
	 UVvihNj0tNaoXLUoYYL58rLvzq+1+Fl4oVoqRqyEqWE9j303Z7Bj6sTr/MFiic7hNt
	 zto5Jb1+8aHUWqqa5dIAepz/Js3fM6o4ec+iOSUGWKfdfXmimIxHeUfUptQPXvvO/A
	 v1B9PCICOXp8RwyatKTiMdSxTrzcKh247Mid6ahVPSB32JpJZ4iMsfNmuD6nWlhVzj
	 3lwyDKLothMhqZWCCVUxmVcdtB6WSQF2GEIOSpE5PG1gGLDFQS+8gaCQiY6TtuL6GX
	 uOagBSTma0COg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4810F40B4C;
	Fri, 30 Oct 2026 14:07:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E67362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8C3540B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdgxruQU1hak for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A3E940B32
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=Tzn6EoPxIWx15lJ/kgC94jxqYYPlkMQSphZ165TliC++icRNJ3L4KkIlkyn/qYIB83k7
 v6zznynnh9Xs2fKvd55Oh9SeU125E8f5c/iknVfTqmUT8GY5+GVIq6kMXZQYrBKN38hNW
 UkdLoasPxiMjZy5FG5gKmAxuxMGZi7vgG+ybMaRKSzaWA197e1GtcPlOHNV6oHqnoOaM/
 Tqk2zDSR/2nmh0onQGdDu5OjfC63Rf9zpK7LFv4/AruJvPmKJfsx4fEk/teVxzuAWBAq0
 Tgl7z2wu+TeQjqCrpy/3mfwSqup0nL5NTzOFbU57VdtLyrSsVWVVQEpvyO6TeJgwN5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=i/bv+JQakRf920qi44FdGfC1h9TXdLWEH+9V/PPcZ1Y=;
 b=ibgBHk2Ym+UrHg3MdEGQBgDYijtvKtYBul1ZjTyogA0bKMGxhCCs4KJ7jiLD08EIEOMO
 TSihtxyd4ehE2q9qU9RfLt+DcYcm1IgElxiXgwutdyaMtQ9UEkzmMtaPsm8CuxCSJhIrE
 bw6FB7cqpec3QJz6GWxcbeof+Me9h7YTIXOKRJBzs9nYh1ER4eX5YWXanRtvygG6y/xuB
 HaNGDcwCSMn6HZrgqmzp6Qf9ZXX/WO7vijTGBxu1t4azcD4U6l3WjQLlgc69SiOz26FGU
 Qqujg/aWm7sjwdQeURHKdtvwfZargWTKsKz1YIYD/L35CABGZeemNmusxA2NJJrM/MA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A3E940B32
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 393519D389; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 13f77c192dc86ef28ef1670303e1fed13886fd5a
X-Git-Newrev: a2fce459c553f79579fda5fb239954c7f8ea488e
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.393519D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.115.1
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
Content-Type: multipart/mixed; boundary="===============6084610653971290524=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6084610653971290524==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2fce459c553f79579fda5fb239954c7f8ea488e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_115_1.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 174d4bd255f4d05f881c5284d8ed14d92fb0f3d0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1c6b5ede18..abd550d5c8 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_RTM/src/SHA256SUMS
-sha256  ac2a47fb33bd79320159144e01c0d4af9a937a2d928c7c77ff06f5d9507861ab  nss-3.115.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_115_1_RTM/src/SHA256SUMS
+sha256  b8189c030b528e57dc5290023c07eea429ce242912a51a0388c184c75a257bcf  nss-3.115.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1580994941..bc6d71a7e5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.115
+LIBNSS_VERSION = 3.115.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============6084610653971290524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6084610653971290524==--
