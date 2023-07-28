Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51E7C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13EAF8453A;
	Fri, 28 Jul 2023 19:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13EAF8453A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_TGrdXtIrd8; Fri, 28 Jul 2023 19:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 204B684542;
	Fri, 28 Jul 2023 19:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204B684542
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15E9C1BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F4142171
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F4142171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ri3Osr212dTh for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:17:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF60F42172
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF60F42172
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D22783810; Fri, 28 Jul 2023 19:17:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:16:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 718c4972c6f58fd8ac401fa4a982a9d8514f9dcd
X-Git-Newrev: a9cd24738a70205a919a3dae1a7292b6d6811111
X-Patchwork-Hint: ignore
Message-Id: <20230728191726.8D22783810@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 v24.0.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9cd24738a70205a919a3dae1a7292b6d6811111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fixes & enhancements.

One major bug fix included in this release: The Go client now avoids using UNIX
socket paths in the HTTP Host: header, in order to be compatible with changes
introduced in go1.20.6.

Previously docker commands would fail with "invalid Host header."

This supersedes two other patches to back-port this fix to Buildroot:

https://patchwork.ozlabs.org/project/buildroot/patch/20230717041047.1510851-1-christian@aperture.us/
https://patchwork.ozlabs.org/project/buildroot/patch/20230717041047.1510851-2-christian@aperture.us/

https://github.com/moby/moby/releases/tag/v24.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 3f1b9bd459..061999464e 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84f6196fc58ae263376a4ce25b5136d567a93aa82e723504a29f0415bd1fa4f4  docker-engine-24.0.4.tar.gz
+sha256  837d7d667fb64508bf6e53cb5915b4b5ef356599294ffdd5ca8678168230cb38  docker-engine-24.0.5.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7c19e0dc52..22cd2c58ed 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 24.0.4
+DOCKER_ENGINE_VERSION = 24.0.5
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
