Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E021DCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B624E612E0;
	Fri, 12 Jun 2026 11:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCu1oLE4E4gp; Fri, 12 Jun 2026 11:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F35611AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263494;
	bh=eL3S7facVqOmU40hRuPR/C+F8COGR2/FW4LPFvd3zao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yp+MeRIZuC1c8u9QyyoI/1k/AaTxurRQN+5q5O1I7wQKDdAKxuXOhCu9qZJyNhOti
	 Ylg0rje1PQlqXxFJlmIrpRPYr342ftMIjTx3s1dmEk7CPZL+BEPhrHfEi0AHJkvEvZ
	 QqFPnh+nNzlin0GUyDxX2z0vPluSbwRSeMF+0EnNG2WQ3FvCHe2DgVjpEIibGci68/
	 BkpmZaozjnnCJkFSm/FWeX6zsDX3qr6e1r3xC9SCwN13QUQ2p7IgUPi6LkQ0WkYDiW
	 XsGlCbWZe+Bsv5gTDBLL9/KDxG6JOtJtrbKNun373jxGUphiL/yWKE9g2q2ZWUbs7w
	 f6cLjCozHPNDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F35611AA;
	Fri, 12 Jun 2026 11:24:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8D8E237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 618D84065F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnV2vjFNxp9y for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F63040658
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F63040658
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18E6F880E9; Fri, 12 Jun 2026 11:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:44:32 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 44228e3f97bf11e162d9c4f57393d4a0cc96dc88
X-Git-Newrev: e36265aafb47c9c65d14aa71db1932506c52b34d
X-Patchwork-Hint: ignore
Message-Id: <20260612112350.18E6F880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/docker-engine:
 security bump to version 28.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e36265aafb47c9c65d14aa71db1932506c52b34d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following security issue:

- CVE-2025-54388: Firewalld reload makes published container ports
  accessible from remote hosts

  https://github.com/moby/moby/security/advisories/GHSA-x4rx-4gw3-53p4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 831335ac71c8fd366c1dbbc34a9a11d26f32df97)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 5d7bc51a6a..7f305b6880 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4828e32e474cef1b78f40278211648300071399c7498252dfe0b96e789b8a31  docker-engine-28.3.2-go2.tar.gz
+sha256  3727c8963ab4bcff12291e99e4d4a6b9a29ace5236fd245717bbff648f15f8cd  docker-engine-28.3.3-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5fe225fbbc..2df260e1e5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 28.3.2
+DOCKER_ENGINE_VERSION = 28.3.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
