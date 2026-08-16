Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BA7C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46DE80C88;
	Sun, 16 Aug 2026 22:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTSS928FkEk1; Sun, 16 Aug 2026 22:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C850A80DA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918834;
	bh=nO6QxdSKCjnEzsD++mYy3Molw92zDlAOz1nHwThFVd0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YF7jnvPqzNrsu/bSIe9fayBPwfdUYSP3iy9cfCJL9AGn6Hazjl6t/5TI6eY9UX+sS
	 a/nhPIWIt5VkecVo3pyVZowUPRhnDsN8M+ScFbARDLOXHu5EAjkImOZID0kNDXcXiu
	 +h12fMwFfVNMvxCJLlQs/aTb/svtHGa/LwSPtiVUY3zEKvTX9NO1nRQRBjpMJKqiv8
	 T0Hh13ofY/twJICZZjH526KGKH6ATk3qa+JD6RUbsZz8S2Jglm5v0mLOnfKEoc3B3h
	 V96/nsD907193AYcai0A5KKmW1p2IFWwL9waWcMc1emfSdKJmnXOhhw6B7kzIX0bT5
	 /3m8gXxmDddPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C850A80DA5;
	Sun, 16 Aug 2026 22:20:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79FCE798
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AAA5400F6
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dnBEodlzAw3 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14814009E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14814009E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 725788DB15; Sun, 16 Aug 2026 22:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 00:06:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7acf1235564c48881eda9ac53a4abbfa9508f8c
X-Git-Newrev: a9ac8fb74b8e5d9b9ad6c1655bd4b1bc74279cee
X-Patchwork-Hint: ignore
Message-Id: <20260816221939.725788DB15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: security bump to
 version 28.5.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9ac8fb74b8e5d9b9ad6c1655bd4b1bc74279cee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/moby/moby/releases/tag/v28.5.2
Fixes CVE-2025-31133, CVE-2025-52565 & CVE-2025-52881.

https://github.com/moby/moby/releases/tag/v28.5.1
https://github.com/moby/moby/releases/tag/v28.5.0
https://github.com/moby/moby/releases/tag/v28.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 7f305b6880..32bdb45ef5 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3727c8963ab4bcff12291e99e4d4a6b9a29ace5236fd245717bbff648f15f8cd  docker-engine-28.3.3-go2.tar.gz
+sha256  0e450c03c536a1304ba8fd26ca4c4ff96fac62182fd042fec90ffdf4a0969d40  docker-engine-28.5.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2df260e1e5..bf2dc588fb 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 28.3.3
+DOCKER_ENGINE_VERSION = 28.5.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
