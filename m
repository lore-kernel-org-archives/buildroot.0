Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F81CD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53BB416B3;
	Fri,  8 May 2026 10:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRZnARzDBHNx; Fri,  8 May 2026 10:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9221416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778237715;
	bh=h8hUudfoBUwEjclTcHQ9FLSyse9F3eymhCuYSCB32u8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FkNLE4JjgEZn3z8A0wnUAdd7VP4geetEphz5XeDAhegi1juYED/nE1hf+OaoVWazP
	 E81fDLCziE2uQJAyGAA6dzKVXdTsSJr2YM4cwH3BoBcg4NfGJbNpQyQOUv5b0K6MAy
	 nre/8FaXM3Kl50lMC0XOhJIbFqYTXAzNk6TN6gfSi6mPDfNAAej4bz9B3vE7H2jaV0
	 1ZQ/sc8BPeZWUXmqAsxMjQsqju52swoKM9UOzzciCoL/9g6nDaDrb3npCw2ZcJYIvV
	 mR8/rFUxiBzCCkY2WSsuUNpkPXSE/h6IHgmUHN/tj3JwM28n1pUJkWkV7RakO/JCg5
	 ge5/5s0RLeXow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9221416B5;
	Fri,  8 May 2026 10:55:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B634D272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7CCE83D7F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_mzNVvfQJTV for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0260E83D7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0260E83D7E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:55:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2448854C9; Fri,  8 May 2026 10:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 12:49:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b57e09eb2ff0192af6158c0bce5ee28d3e4c4e2
X-Git-Newrev: fb6872d948e971a53fa88fef4a3472a98b942aec
X-Patchwork-Hint: ignore
Message-Id: <20260508105511.C2448854C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zellij: bump to version 0.44.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb6872d948e971a53fa88fef4a3472a98b942aec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.2/CHANGELOG.md
Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 03b647f7bf..635f5ff79a 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7c17759e1be5ce0b73cd2a33c7c111c9b7ce08d4c7f2efce12a0d7a7815b8b6b  zellij-0.44.1-cargo5.tar.gz
+sha256  69a6209cb26ecba6cb9fa28d10abad328d82adaa7e79b2eb6c750e08a4500021  zellij-0.44.2-cargo5.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 2d76b89891..f1828cba78 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.1
+ZELLIJ_VERSION = 0.44.2
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
