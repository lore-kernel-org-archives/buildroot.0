Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789D5F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BAA60833;
	Mon, 23 Mar 2026 19:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uJCDOVDExQX; Mon, 23 Mar 2026 19:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D363608AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295286;
	bh=8aTfYn10JEZV7V/Yb4r9Z+OGl3ztTZj07LDE3iS8Iks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fs2Tm9BrRry4urbxNt1NSx5p5k0bOyG+TvRJaylPriz5LJ6Do78wbSD0Couzl+HdU
	 6hXwoG89ia1Qx83ISXe5b1Wkj6i2gQW8ADXToSsmygVnnd5SPeLp8C5QB7exkBCfog
	 5VFxemBvMdmCNkk9tW0cHLC8GArHk4B+k/iCIrm9CM2KHGuSI6ccGUsKLdL+lEOfeN
	 SD98pnfmtmxQzCkSpKbA9su9Mn30bqRMarLgAhb8mvMIPDF9l2oW53Qo3XT3Ar1Fub
	 03wcq+WV04ESt6vCdvmJc2v4eH6C5D/pjEIUh4H5LjKZxWxdX6aESvjxuK+5zFqDZI
	 lxXN9xoHzUssQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D363608AF;
	Mon, 23 Mar 2026 19:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B515F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD03B40281
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVzfVD-QCq59 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF1B540284
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF1B540284
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30B7084CA1; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 12:36:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c66b7ece134a0bcc218aa118eab79dd59cdc855
X-Git-Newrev: abb44c520b93553e98c80ca6fda6946e4bd2712b
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.30B7084CA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropwatch: bump version to 1.5.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/abb44c520b93553e98c80ca6fda6946e4bd2712b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/nhorman/dropwatch/releases/tag/v1.5.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dropwatch/dropwatch.hash | 2 +-
 package/dropwatch/dropwatch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 24fc03097b..c4b85d9354 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c43d0c15d0cb9ce179fa1fb0610611723689a6f551b23c70a7ddc1cf068e8d2  dropwatch-1.5.4.tar.gz
+sha256  73d4bcbbb056b3bd514b7d88ef927ece8aca32c2d50724b37c7d0a0d4d133009  dropwatch-1.5.5.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 33775f6c02..e7b796a837 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.5.4
+DROPWATCH_VERSION = 1.5.5
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
