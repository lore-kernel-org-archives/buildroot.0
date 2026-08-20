Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4E7C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB868119F;
	Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlXFYb5TDMTa; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324830;
	bh=z3OyLi3j7KlzHJxh9rDYvoIww6jo8X4xjTXrutaOv/8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GlcWsl0cE+8lmOXxUly36m8kWEjrXdXI0h9dSx8ifH22RRCJqjSyjwLl7fW4b9GVj
	 zD7M0FQR/EMakCMpnMO1ciYPXh1nOYWm2QXtuCtAwsOJbsqXlynhi+79WaeyDbv1IB
	 fcKFgkdb6MSdsrsBBnIT9YeGAivaQZd3tIp4BAKB+zm2VkyRtAt+3Qta7DteK56AVu
	 k21Ic6gSnICMQnyiVeySWTTCFQbpIefC+8EcyGHWuHw+DVloXlOTvplBET/kXBTVyG
	 GxLx4fsdGLzFTM7hxLoLj7UX3EQipFoVZzrudrq2RYuYB6qHSlScQzNyD4CCCZlZw5
	 Va28eh2EltFIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A298117C;
	Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BAD529B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DF1740417
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsjjBy7hktrL for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D1C440026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DD0F8E198; Fri, 21 Aug 2026 15:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 10:55:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 62d273c836d808af9032b99b33cfccdbb4420cab
X-Git-Newrev: 53e27a7c5d649195ae0868bad6ab5282a02d0d9f
X-Patchwork-Hint: ignore
Message-Id: <20260821150613.8DD0F8E198@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgit2: bump
 version to 1.9.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53e27a7c5d649195ae0868bad6ab5282a02d0d9f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.3

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a562b8c3aa8f47976c4eb10dc9723f1dc86e5d56)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index e8c155c994..11eab3001c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
+sha256  d532172d7ab24d2a25944e2434212d63ee85f3650e97b5f7579e7f201a78ad64  libgit2-1.9.3.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 02af500a65..7c95145fce 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.2
+LIBGIT2_VERSION = 1.9.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
