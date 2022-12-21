Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E029C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 14:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 251506106B;
	Wed, 21 Dec 2022 14:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 251506106B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRgELH6VAQnd; Wed, 21 Dec 2022 14:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72AD360B8A;
	Wed, 21 Dec 2022 14:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72AD360B8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08B521BF8C7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F6E417BD
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F6E417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGOOKzBO9aGa for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 14:20:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA58D417BC
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 14:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA58D417BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8FE586BD2; Wed, 21 Dec 2022 14:20:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 15:18:47 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b912c01a7d804291fca3c4e2cb7b09b45631a253
X-Git-Newrev: 785ebc18cf374316ff012157809cd7b9e13f737c
X-Patchwork-Hint: ignore
Message-Id: <20221221142052.D8FE586BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/docker-engine:
 security bump to version 20.10.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=785ebc18cf374316ff012157809cd7b9e13f737c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Partial mitigations for CVE-2022-39253 Git vulnerability and other fixes:

https://github.com/moby/moby/releases/tag/v20.10.21

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 309bc5d2d4b0f3ca133b40e36ee949411b3d532d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index dfd4f4e365..10e9727a08 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  228caadac1b37a5ba310eb25418cf1fdd8878336f1d8faf0a2daa87fcc577577  docker-engine-20.10.19.tar.gz
+sha256  61f4c3a2d0426e1bbbda1b0e5dd33ec203776f7d99d1a61522c77c04c4ed09fe  docker-engine-20.10.21.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index dc45baf055..36c66485ba 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.19
+DOCKER_ENGINE_VERSION = 20.10.21
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
