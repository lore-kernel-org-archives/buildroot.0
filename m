Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EF9CCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DA781CA3;
	Mon, 19 Jan 2026 09:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkgzBR0ZBgyP; Mon, 19 Jan 2026 09:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB06B81D18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816752;
	bh=xB9J88ambF02K13BND6Sm9XjfFvUArpXFRupqnWchU0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E8h7ZyNByRItid2o+JGzsMQs8CaB15LrWLz8FXS9yVoTvOvssKbkc/i/7gm7kRgOp
	 /Nsn8QOCCVGu1FQLl6qTZ7DeO2BQOcjhi0FfULIu+E6pnOmY6MPOl5ymsP1yHo5DJX
	 2rAkuuhwG5WNkEIyVxtEcEFK4j7FNpLHaq+K4qGwJABAmownpOC4hH0Jl2w5LI7EoA
	 ncnTir55d2993VYaaL1lsFP62Ui/DhQQnmqwPIsgzMYlrgco7lCUc6jywN1a1985AL
	 zz09BH6zWE2BwC02FSkIB4qLD7jqxpusNfGrfPHKEV6X/0bxVKcDYGQd9SqKnq296A
	 RCavn8LfGRUoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB06B81D18;
	Mon, 19 Jan 2026 09:59:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B6C160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25DC740CF4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV7fbYyRlMpc for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9882240CF3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9882240CF3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9623C88673; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:33:43 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 28a171568993141ef0d3e3f43933153bcdafae2a
X-Git-Newrev: c32269354772f954dde3b5f1f01524a104dbf74e
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.9623C88673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: bump to
 version 8.17.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c32269354772f954dde3b5f1f01524a104dbf74e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Brings a number of bugfixes and a (not applicable to Buildroot) security fix
for wolfssl (by dropping support for it).

https://curl.se/ch/8.17.0.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 788b7d695856640684f4ed018d30a7e359e6a984)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 4cc4da4f26..786d030171 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.16.0.tar.xz.asc
+# https://curl.se/download/curl-8.17.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5dec6eb2d22ff1d  curl-8.16.0.tar.xz
+sha256  955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992  curl-8.17.0.tar.xz
 sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 3f577357b7..6924631735 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.16.0
+LIBCURL_VERSION = 8.17.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
