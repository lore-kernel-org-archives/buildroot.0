Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3FC43217
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 14:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F1E81465;
	Mon, 17 Oct 2022 14:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59F1E81465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpLq7wrc9nLj; Mon, 17 Oct 2022 14:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F7EC81453;
	Mon, 17 Oct 2022 14:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F7EC81453
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3927F1BF97F
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1450A605F6
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 14:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1450A605F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNubOsiWsIwd for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 14:08:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63F95605EA
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 14:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F95605EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5239186E3D; Mon, 17 Oct 2022 14:08:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 16:07:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 231e4922173ea55032b91b2d068610fd380afb78
X-Git-Newrev: 0a1195186fa64f6c9db05bc90f2a16cd10f449a1
X-Patchwork-Hint: ignore
Message-Id: <20221017140840.5239186E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: bump to version
 20.10.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a1195186fa64f6c9db05bc90f2a16cd10f449a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release of Docker Engine comes with some bug-fixes, and an updated version
of Docker Compose.

Builder

    Fix an issue that could result in a panic during docker builder prune or
    docker system prune moby/moby#44122.

Daemon

    Fix a bug where using docker volume prune would remove volumes that were
    still in use if the daemon was running with "live restore" and was restarted
    moby/moby#44238.

Packaging

    Update Docker Compose to v2.11.2.

https://github.com/moby/moby/releases/tag/v20.10.19

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index e1c29f0926..dfd4f4e365 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9907aaaf39fb1c2c3fd427192e4a63d7adf8ddc9fb0e29c692a6ca10de9c34f6  docker-engine-20.10.18.tar.gz
+sha256  228caadac1b37a5ba310eb25418cf1fdd8878336f1d8faf0a2daa87fcc577577  docker-engine-20.10.19.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 246419ec4f..dc45baf055 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.18
+DOCKER_ENGINE_VERSION = 20.10.19
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
