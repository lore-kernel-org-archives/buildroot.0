Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8275C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC3C82173;
	Wed,  5 Apr 2023 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BC3C82173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLNp_Mg9zcPQ; Wed,  5 Apr 2023 20:03:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7279382177;
	Wed,  5 Apr 2023 20:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7279382177
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C92581C2BCF
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC9560F4A
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC9560F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FJId9-0AKGb0 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:02:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D305560F40
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D305560F40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB5E08389A; Wed,  5 Apr 2023 20:02:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:01:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bf66c5640c0fafd63dbacadeeb6ac3a9f4f26a9
X-Git-Newrev: 238d49468751ad761b61e691a18aaf097c020c4a
X-Patchwork-Hint: ignore
Message-Id: <20230405200250.BB5E08389A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: security bump
 version to v23.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=238d49468751ad761b61e691a18aaf097c020c4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed a number of issues that can cause Swarm encrypted overlay networks
to fail to uphold their guarantees, addressing CVE-2023-28841,
CVE-2023-28840, and CVE-2023-28842.

https://github.com/moby/moby/releases/tag/v23.0.3

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 4b7c026eef..0dc974ce85 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4caca59c774445a5aad6114d89c97c88d9705f048704fecdd3f5712cb369dc39  docker-engine-23.0.2.tar.gz
+sha256  2f74aef0eadf5bfe652b1822f1349fa0baf7412f83b856a9cfb9a8fbfd686880  docker-engine-23.0.3.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index a27625a38e..c0f2c73b69 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.2
+DOCKER_ENGINE_VERSION = 23.0.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
