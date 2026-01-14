Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CCFD39011
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE26260C0F;
	Wed, 14 Jan 2026 20:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MNuPyEdd1bF; Wed, 14 Jan 2026 20:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27C3960BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768422211;
	bh=rp6KCprys0I9Olwtze46P3aSJFDwZGsML+lr7R+n69U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lRgqmKsN45xE9X0opLhB5oE4fRCnz7/F8VP8dehev6cE974m4bA0sI8G7iNOVHOIS
	 fUej8Ob4oTDfA4ds73XJwE0mTYskA6tjmY+7YrCpMT0fhNoI/GX1pz7824ygWYq/1a
	 jXrfiUYXLcV02NPPxNxQgRDsDh3kHA1lIuv6tMLBo0sqJtucvkl1egptqphzo1r6+e
	 uFXoo5/isAi41OA1qBegxTz+xGty42AWGJmTV4tjyRWx150YaI0/w6AjRVXVycMwLp
	 kRoqZvl9gPKAJ29wH5hckTdg17Y4RUxi3o46Fwu6gmmnk7LWSV513OtOHtM9hY8nol
	 1ZB13jJvlJCfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27C3960BEA;
	Wed, 14 Jan 2026 20:23:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8D71232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1E7A60C07
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo8Arat0Zfoc for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CFC60C05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2CFC60C05
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:23:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBDA388553; Wed, 14 Jan 2026 20:23:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 21:21:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73ab737a25a3e08c48920873280323d0f62330b2
X-Git-Newrev: 5b748550e5fbd52a63ff9a784701e17d4c0a870f
X-Patchwork-Hint: ignore
Message-Id: <20260114202328.BBDA388553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 25.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b748550e5fbd52a63ff9a784701e17d4c0a870f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://stellarium.org/release/2025/12/29/stellarium-25.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 6c8e2a850d..67e053eff7 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  1cdebfa04220656a956270425e06c6c522579c07d61c3440f6b11ac3f09f6db5  stellarium-25.3.tar.xz
+sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index ec792bf20a..660d518860 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.3
+STELLARIUM_VERSION = 25.4
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
