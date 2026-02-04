Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAE0E9539B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC862409EA;
	Wed,  4 Feb 2026 13:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbUrtXT9MvVV; Wed,  4 Feb 2026 13:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EE0409C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770210522;
	bh=A2/8z43e/drrKkjP273MSgoLybNCYYqMnmhHuMB76UU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=odcjV9lX06fKNIwA5tTDeJKKeC5FDq0sXYKd1tAR9cCvwkD7EibpNCC3COI0M3yrV
	 +tXTcCncXHF6nBahnev6BgjEZs8TBc2Pri2FMNHss5Ip/WR3M8b9j9Oj/s8gyAA4Kl
	 XlivYDPduXm0C5N2OyZpZd1S/rzOLXUZmBV7bIYZkOIcjoIa13RvXW9/xoeDh9DfnR
	 ToGHXQwMfo8RoFqloQAk5jlqXYZzXW8OGZSLilxdZ2mCFMWhTFQ2YV/I8umbrAqFeu
	 PTeED/sXPff9SkYhBhyUQs8C+tgGHrjRqZ6iP8ZJb+2q/CNf8eQnjGYw1Dpt/FFH10
	 Oy9nVsk34cRxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EE0409C8;
	Wed,  4 Feb 2026 13:08:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 272DAF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05D3C409C8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ0UxCs0_Z9y for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C122409A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C122409A6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D68584892; Wed,  4 Feb 2026 13:08:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 14:07:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0b129e36e6d6b45de473bb59795001fddfcc0cc
X-Git-Newrev: 8e7a54f7ef121a2236c3d722d0adca26860c4cfa
X-Patchwork-Hint: ignore
Message-Id: <20260204130839.2D68584892@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libite: bump to v2.6.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e7a54f7ef121a2236c3d722d0adca26860c4cfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
- Fix memory leak in which() on realloc() failure
- Fix pidfile() to handle missing trailing slash in prefix path

Changes to src/pidfile.c do not affect the licensing terms, but
require updating the hash of this file that is used as one of the
license files.

https://github.com/troglobit/libite/releases/tag/v2.6.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 3abad09b0a..c593f7a66d 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,7 @@
 # Upstream .sha256 from GitHub
-sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
+sha256  0550ac5670836db85569786e00860d1d6999df8f74005307c290371c990e1dbd  libite-2.6.2.tar.xz
 
 # Locally calculated
 sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
 sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
-sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
+sha256  b6cc7074a27b26ee4e1ccda8d634d485d0f6f819e564c663c28ed61f4cc2b451  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index e4bd845487..beb8c27ba7 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.6.1
+LIBITE_VERSION = 2.6.2
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
