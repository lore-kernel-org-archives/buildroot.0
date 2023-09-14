Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B51EEAA5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 18:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BD441E5A;
	Thu, 14 Sep 2023 18:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4BD441E5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pEhbs1mTQ60; Thu, 14 Sep 2023 18:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86F341FBA;
	Thu, 14 Sep 2023 18:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86F341FBA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05F0C1BF316
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3C9D839F9
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C9D839F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtt_sIiHFe8L for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 293CF839E5
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 293CF839E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 147A286F6D; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 20:20:12 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: d8ce1deff96c48a5d5dacf0ab82d9bce92c8cc6c
X-Git-Newrev: c4a7dee1c247073ece726943950a11147c70d0a0
X-Patchwork-Hint: ignore
Message-Id: <20230914182452.147A286F6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/docker-engine:
 bump version to v24.0.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4a7dee1c247073ece726943950a11147c70d0a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Bug fixes in containerd storage backend and Docker itself and a single
new warning about old Docker image format deprecation.

https://github.com/moby/moby/releases/tag/v24.0.6

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e80116562a126e4ea0936b6a052e269f660b71e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 061999464e..7a8b17d3f3 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  837d7d667fb64508bf6e53cb5915b4b5ef356599294ffdd5ca8678168230cb38  docker-engine-24.0.5.tar.gz
+sha256  29a8ee54e9ea008b40eebca42dec8b67ab257eb8ac175f67e79c110e4187d7d2  docker-engine-24.0.6.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 22cd2c58ed..a8f47254a4 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 24.0.5
+DOCKER_ENGINE_VERSION = 24.0.6
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
