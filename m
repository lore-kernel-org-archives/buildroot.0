Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F930D5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 12:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1DC60D7C;
	Sat, 13 Dec 2025 12:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncTzoxfmOabC; Sat, 13 Dec 2025 12:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F24D60D76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765628691;
	bh=cVXQZsuU4XKDBQMl1HnaDAkpLzgLqf2sdJnT0IbXVAU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U6s83GJLJ2pUVe6YEBuRRwYSXZ/xCm1Ce0LDJA+w2aWczHmTlG8X9Pd1a6A/ZX49O
	 zZuOmp6H2tCgR8LBNl/rT2WD6wsvui3qDaWzNeaiuGifEOPCahqujNfmOt1pusk2Rs
	 30owRX+ULkQKCjhvAFgInTC13c5oL0+sEwL2D+BXYFJWHTCh26UV2SCBIaORDwd4Pw
	 S+pwt5kL2N1ZiDC610QnTI1gmSLT7s5Qx2IMq93h/1E2yGrG/ZyXUSn6q3P5R3gSjn
	 bVBeFnTa2v2Ogf5InlH6r4/sCXlxMm2JceoHzmaghlTLwIxbGLdeXQqflO6qUvl02G
	 FILVAoDEiuM6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F24D60D76;
	Sat, 13 Dec 2025 12:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D14A2E7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3996400BA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwi-GiWkHhZF for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 12:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22CC14009B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22CC14009B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1306186A49; Sat, 13 Dec 2025 12:24:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 13:20:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc7eb6bf08d2293fc47f5f43d16d377758e9788a
X-Git-Newrev: 68b83f9a805908e37fa6cf01e57752eb8ae2bc59
X-Patchwork-Hint: ignore
Message-Id: <20251213122449.1306186A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump version
 to 3.8.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68b83f9a805908e37fa6cf01e57752eb8ae2bc59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libarchive/libarchive/releases/tag/v3.8.3
"Libarchive 3.8.3 is a bugfix and security release."
https://github.com/libarchive/libarchive/releases/tag/v3.8.4

Switch to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - add missing '#' in hash file to fix check-package error
 - add back the comment with the pgp signature
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libarchive/libarchive.hash | 7 ++++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index f31b693c67..1a61d254f7 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,5 +1,6 @@
-# Locally computed after verifying the signature from
-# https://www.libarchive.de/downloads/libarchive-3.8.2.tar.xz.asc
-sha256  db0dee91561cbd957689036a3a71281efefd131d35d1d98ebbc32720e4da58e2  libarchive-3.8.2.tar.xz
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+# After verifying the pgp signature from:
+# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
+sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8568847493..083e913033 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.2
+LIBARCHIVE_VERSION = 3.8.4
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
