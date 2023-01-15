Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBC8C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ACA941744;
	Sun, 15 Jan 2023 21:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ACA941744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8AwTIPrCXMG; Sun, 15 Jan 2023 21:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C9E4174E;
	Sun, 15 Jan 2023 21:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C9E4174E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB67E1BF3EA
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4620409E3
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 21:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4620409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LQ99CgkzUOi for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 21:02:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D644E409D7
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 21:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D644E409D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF83C87B77; Sun, 15 Jan 2023 21:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:28:11 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e1be0eb4be7b1de06c322558dbfab4739a9f4a63
X-Git-Newrev: 400edb09a85640a57225b1890805004e0bf47f1f
X-Patchwork-Hint: ignore
Message-Id: <20230115210241.BF83C87B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/docker-engine:
 bump version to 20.10.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=400edb09a85640a57225b1890805004e0bf47f1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Bug fixes and enhancements

 - Improve error message when attempting to pull an unsupported image format or OCI artifact (moby/moby#44413, moby/moby#44569)
 - Fix an issue where the host's ephemeral port-range was ignored when selecting random ports for containers (moby/moby#44476).
 - Fix ssh: parse error in message type 27 errors during docker build on hosts using OpenSSH 8.9 or above (moby/moby#3862).
 - seccomp: block socket calls to AF_VSOCK in default profile (moby/moby#44564).

https://github.com/moby/moby/releases/tag/v20.10.22

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de51efc543775cf32456c1090d1b396d0b67f9bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 10e9727a08..d15b1359cb 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61f4c3a2d0426e1bbbda1b0e5dd33ec203776f7d99d1a61522c77c04c4ed09fe  docker-engine-20.10.21.tar.gz
+sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index da6d7aecb4..459030f59a 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.21
+DOCKER_ENGINE_VERSION = 20.10.22
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
