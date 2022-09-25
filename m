Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C185AC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 21:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571B48267F;
	Sun, 25 Sep 2022 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571B48267F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58UBRLNIxF3D; Sun, 25 Sep 2022 21:12:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6338282591;
	Sun, 25 Sep 2022 21:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6338282591
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B27031BF2B7
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 21:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A9878250B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9878250B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDZzMmsTmqz7 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 21:11:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3B29824F4
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 21:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3B29824F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B05DD8602D; Sun, 25 Sep 2022 21:11:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 23:09:01 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 1431b822c3bd728ce834db2d080e0dcebe44f042
X-Git-Newrev: 941893fd42cec84126f39b4ec7d6512f43f45fac
X-Patchwork-Hint: ignore
Message-Id: <20220925211153.B05DD8602D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/docker-engine:
 security bump to version 20.10.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=941893fd42cec84126f39b4ec7d6512f43f45fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

https://github.com/moby/moby/releases/tag/v20.10.18

Fixes CVE-2022-36109: Security vulnerability relating to supplementary group
permissions
https://github.com/moby/moby/security/advisories/GHSA-rc4r-wh2q-q6c4

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a53271b77e21e90e46e61a5d0afd9ab9544b25c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 2cf2f4a75e..e1c29f0926 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  061cf8579aa3c813c353c80fa480744e2f6cca2e6392f546bd0942a6a10c7a14  docker-engine-20.10.17.tar.gz
+sha256  9907aaaf39fb1c2c3fd427192e4a63d7adf8ddc9fb0e29c692a6ca10de9c34f6  docker-engine-20.10.18.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 293af1858c..fa35b33a2b 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.17
+DOCKER_ENGINE_VERSION = 20.10.18
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
