Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DD7E92FE2
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 22:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE2B60B04;
	Mon, 29 Dec 2025 22:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nu86d2uQ6tu3; Mon, 29 Dec 2025 22:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D6860B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767047460;
	bh=9d8JQCvDeqmSV28PA7GJZvxu8jLL84IRGL/ojhCH/r8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cArQqnbFd+cm8v39mi9TyD7DucC2+/8OTnyMPLNwuscnS3p9f0xopPuzWbKlicBSQ
	 keDyOgHDt/AKmFbVwratMcIsMz01aaUeQpRrC8pTobc13e/2tXwExex9z9VPwqM6Mj
	 9D70UkUBPElMl533efCMedsOd3s84cOIU6wP02vu56cqEyeTHutHAGuktqrzuye3QQ
	 oXZKnzHNmG5vcChxpl8i8QXLmZtTxyFSuWBE/fdoFAa4O3p2cIJGBeRhmwW1WYP9ju
	 4UT4GNkPsYeihS58TUjlK3VHQQ4ncDtl/uLNMVZwdHeBczfQLvie7CUKA0CKO8gWvh
	 p0JXEcf79iDKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D6860B08;
	Mon, 29 Dec 2025 22:31:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D124B35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22994042F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJ9kMerOVkPz for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 22:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCAC140057
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCAC140057
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 22:30:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4F6B87BBC; Mon, 29 Dec 2025 22:30:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 23:03:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdee48e3c7a0b94a17e236154d9173885bc0d374
X-Git-Newrev: f9a91bf60e35617157b950eea05fc6f6144d650c
X-Patchwork-Hint: ignore
Message-Id: <20251229223057.D4F6B87BBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: bump version to 2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9a91bf60e35617157b950eea05fc6f6144d650c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2025-December/003648.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igt-gpu-tools/igt-gpu-tools.hash | 6 +++---
 package/igt-gpu-tools/igt-gpu-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index fb4b702549..b1899cd986 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-September/003631.html
-sha256  88178558b352a5e8a287954cb2eef05d775aedfacf43b88251509ea014b6182d  igt-gpu-tools-2.2.tar.xz
-sha512  20032b90e397ca73f9f8f5b453034fffc09e28372adddebd1a71b1323235e3e379bf452d5a4dd76b895e4c47df67595051c16b8a1488249e5aae946f6a35258c  igt-gpu-tools-2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003648.html
+sha256  429f2578fb16cff7402e9beb325c5c267ad30a2b7b957343c77e8ea24af03887  igt-gpu-tools-2.3.tar.xz
+sha512  669e5f124c1177ed58c43b8b9b945f6436fc37b1162b16bbd1db78c5e170c68be98cc3b08b5ecb438d1313722fee2ab8bba8ca86a971443401c2acc3f3ec68ff  igt-gpu-tools-2.3.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index bb43f8fe9b..85ed999ed4 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.2
+IGT_GPU_TOOLS_VERSION = 2.3
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
