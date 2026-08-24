Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F16C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1442C60614;
	Mon, 24 Aug 2026 21:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybaA6iEPoU3l; Mon, 24 Aug 2026 21:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607956;
	bh=qwuzjqjEz6UZj8a2JQ/H/Mi1yy0xVw2jmXoQiIXqsAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U8mvshFg1Jmp1tw67q/Bjuys7XJk5e3saPmhC5WA4dbFHlySH53vFn297LoUgFEK9
	 c3qfqBCTGIDmHNGh23x6duSFzQbbJ0itwbvSke9BdCVEnQhmtqsRXC+m6f+v1blubs
	 vdGtJCikMcU+rRqiyhpqyyf09TbOASKhC+sChDTSnuOB8eFynD2oefywBjv1vL9EU6
	 B3xn6lbtWL4orrVY3Gd8N/yG6UHvSYPPP0ceDEK6intIH+wDbh699nA48m8d844JEe
	 s45lhswBpNv++8c5BvPHOJS4z0mD3WJ6jmvqEcTQEGHiSQ37sii9TQPpS6ZHO9DVii
	 fnHYiUvdSeI1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C75060618;
	Mon, 24 Aug 2026 21:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C832386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65C1F80C9D
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l638ZWOC0mX0 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989CF80C74
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:45:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 599CC90CAA; Mon, 24 Aug 2026 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 23:37:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d6c68d625cf80cc9a9cf4ce1058248fcfc413a7
X-Git-Newrev: a8dd506faabc65d3cd678141f4303a8d88968894
X-Patchwork-Hint: ignore
Message-Id: <20260824214458.599CC90CAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zellij: bump to
 version 0.45.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8dd506faabc65d3cd678141f4303a8d88968894
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog: https://github.com/zellij-org/zellij/blob/v0.45.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index ac6a219270..73ef5729db 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
+sha256  ca775a98e78fc8b721dc3c67ca511733c3eaa106423652e621ae66b6d10ecbf8  zellij-0.45.0-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index 4b4e7d6a3f..39cfe2e460 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.3
+ZELLIJ_VERSION = 0.45.0
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
