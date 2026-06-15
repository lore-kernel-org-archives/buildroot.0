Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A829CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 457D98457C;
	Mon, 15 Jun 2026 20:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vg7aoIc2W-nI; Mon, 15 Jun 2026 20:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 902E584547
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781556349;
	bh=XNeqJxXLb3WmKtQslzBTcthMyrRS6CX8QwSzT/uBxPY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G8GIG60cQnXQ+Tt8mklxgZleNeqAu1PRcU2W0+nXfHj5JRhFK/xWJCi0Xh2U+HZFL
	 joy5ACodmKHb4L9X18Qu9WB1+juRp8g8LY83hzlpB6atJ2dTI+TtIEvzH+S381EAbi
	 XNS8CmCEoKT8uNXuQmPBPTcWu6D1J+EERtBovNN7/emanorojKW3OWg3Ww49FDdwlM
	 4+hIaWA3ySijKjWq1eBQp+VQIoq8a2MXqccOAbPQrKHQ/K2BP0RiSbhWN64cdjAf29
	 cd55nq8g5Xwqws6xzXetbxjtzwE7T457xjbEqI/qMMbh17x2tsYgZ2YG+bjB3ierYf
	 SjhsdOozDeCKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902E584547;
	Mon, 15 Jun 2026 20:45:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 022612F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E898061594
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJbS-8WeOA51 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EDE561592
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EDE561592
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A4B7FEE4; Mon, 15 Jun 2026 20:45:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:39:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09fcae15886954040edf81b565873a6869b51947
X-Git-Newrev: 8bcb156d33e5c8f39fa6d52154736a3585a5a81c
X-Patchwork-Hint: ignore
Message-Id: <20260615204527.70A4B7FEE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-rsxs: remove
 dependencies to gli & glm
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8bcb156d33e5c8f39fa6d52154736a3585a5a81c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream commit
https://github.com/xbmc/screensavers.rsxs/commit/a00a3cce3c5f24ea7274968b5b16c8d2db656a8b
added the code of gli & glm in-tree and removed the usage as external
packages.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
