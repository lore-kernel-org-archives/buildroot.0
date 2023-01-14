Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB44C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96EC260D58;
	Sat, 14 Jan 2023 10:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EC260D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5aiVFb6fwcY; Sat, 14 Jan 2023 10:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C583060D4E;
	Sat, 14 Jan 2023 10:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C583060D4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 133CE1BF863
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF5FD6061B
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 10:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5FD6061B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQ2onZWpLktr for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 10:53:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F37B6605AC
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F37B6605AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE3D687962; Sat, 14 Jan 2023 10:53:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 11:47:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0da2742abbe2123d8bafe30e307b94c2b72f94cd
X-Git-Newrev: de51efc543775cf32456c1090d1b396d0b67f9bc
X-Patchwork-Hint: ignore
Message-Id: <20230114105353.DE3D687962@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: bump version to
 20.10.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=de51efc543775cf32456c1090d1b396d0b67f9bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fixes and enhancements

 - Improve error message when attempting to pull an unsupported image format or OCI artifact (moby/moby#44413, moby/moby#44569)
 - Fix an issue where the host's ephemeral port-range was ignored when selecting random ports for containers (moby/moby#44476).
 - Fix ssh: parse error in message type 27 errors during docker build on hosts using OpenSSH 8.9 or above (moby/moby#3862).
 - seccomp: block socket calls to AF_VSOCK in default profile (moby/moby#44564).

https://github.com/moby/moby/releases/tag/v20.10.22

Signed-off-by: Christian Stewart <christian@paral.in>
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
index 36c66485ba..2a9b72ca78 100644
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
