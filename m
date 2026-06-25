Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD79C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A079560F25;
	Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PK3AtVIaeg5; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EB060F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485387;
	bh=YOzfXW5sn10xw6r3U1OX5/gHaAG2TAtBiJKv74w6ztk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K5BCOanwhuET96V9mcyAYOU+yRhzfBz6Xe9ydQbuB7ITPbQysHltHEC3+GeShTxnr
	 3m5YMqq9VdalcVPfzjChDB4TyqRrK/eYg2FZMGwmJWNv81dYuJLtTfxdwNvjGOQYSm
	 emLD9cqbB/c3uA9Btt1vFO82ebw0RiFIg8WoCS3XnhOEWTfA8Y071P/9rJ4BRLJEDb
	 df5/XwWlIBgEGEdiDOQ/fVB6YXoi/Yunq9g8FCyA9rd1Uw3EUnaNkW/Q52TBELWr/D
	 Nly6gDClsrcBGe84b6n7WlAwqzekQKN4qEPLVusBcbRiYXvXHlzyU1sa6H7rQ+xMHk
	 lmAndiMbjiAbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EB060F27;
	Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD8A3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF06540E21
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bzbkntmuCMK for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4AC540E17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4AC540E17
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2E0A864B7; Fri, 26 Jun 2026 14:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:23:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f543b8dc40cf91d1dee6cec9554c83e91106e105
X-Git-Newrev: 16914bd73fbaeec764236d200261e5db200a5c4f
X-Patchwork-Hint: ignore
Message-Id: <20260626144919.B2E0A864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/kodi-screensaver-rsxs: remove dependencies to gli & glm
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16914bd73fbaeec764236d200261e5db200a5c4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Upstream commit
https://github.com/xbmc/screensavers.rsxs/commit/a00a3cce3c5f24ea7274968b5b16c8d2db656a8b
added the code of gli & glm in-tree and removed the usage as external
packages.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8bcb156d33e5c8f39fa6d52154736a3585a5a81c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kodi-screensaver-rsxs/Config.in                | 2 --
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index e88df1fe49..8185f3c424 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
 	depends on BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_GLI
-	select BR2_PACKAGE_GLM
 	help
 	  RSXS screensaver add-ons for Kodi
 
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index ff554a2e1a..dcca031b51 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -8,6 +8,6 @@ KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm kodi
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 kodi
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
