Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0CEC5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B28081E60;
	Fri, 21 Aug 2026 15:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQKQwoaF92LF; Fri, 21 Aug 2026 15:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325136;
	bh=oiNT+dhvw305IZjoRgCKd3l8VmSk0OE5+DIdBj/IvDU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pxLNKgVCQ3DbfDr6+TD6ryKzxNQ3cAL6IYP44rgX0FiHwmXZl9e6LWTe5nC7Rhpsb
	 3Bx4x6VF9ghaPTw262tyiVWry+HYzAYqZ6CauWrb6JgMuQmNxtaorRWyFty9xmxJ76
	 KdfelS7yaqq7vLr7ifDbtYmEAmxD/AGRr1gvHdffile8yWFQon9zrMvYv7aMEIwWEq
	 3cQKtGPzrOD/mBnUrGyeFr/xLCvkKjtJAK4o5PbKXQqKB7SNW4TfUOaI5VjPbBhnGM
	 YRuJCHNrWd92dLKRwn3/xtjQ1g0PpcACnH2W+rQsY+WclPZW20rDCl5rAWeM1aQEMl
	 dtWnOLngO1f+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2B981E4F;
	Fri, 21 Aug 2026 15:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 483FBEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E7508110C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vifq7D-TEwF1 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834D581151
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01CF28E1C7; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:53:41 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6b0f605183db930be6a17c886750f280dbfdd6a5
X-Git-Newrev: 90210125f65a91dc1f5db312ef7d53dfb25b56bc
X-Patchwork-Hint: ignore
Message-Id: <20260821151018.01CF28E1C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/expat: security
 bump version to 2.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/90210125f65a91dc1f5db312ef7d53dfb25b56bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-3-released/

Fixes CVE-2026-72522.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e3d5341e01eb83fb4f76a5c721a3363cff8a7f73)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 2087133382..c5a8816f9b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_2
-sha256  3ad89b8588e6644bd4e49981480d48b21289eebbcd4f0a1a4afb1c29f99b6ab4  expat-2.8.2.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_3
+sha256  f6256df90c906773d344da084402b7d3e4f22ed41b1a59c989098a83d3ea0c85  expat-2.8.3.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index fb25a4a47b..7645edfd52 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.2
+EXPAT_VERSION = 2.8.3
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
