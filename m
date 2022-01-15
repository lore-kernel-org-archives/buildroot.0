Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1723C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C0982980;
	Sat, 15 Jan 2022 10:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnowTZUC-DQD; Sat, 15 Jan 2022 10:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B95826D5;
	Sat, 15 Jan 2022 10:39:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40CBD1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AD1960AC0
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBkMqQlijEV2 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A94960AA9
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 73668826D6; Sat, 15 Jan 2022 10:32:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:38:44 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c25e90cb3b4b52968d8bcf0d2722329a073e3bcd
X-Git-Newrev: 71786cb620d61498676645fc9087e9518d8b85d6
X-Patchwork-Hint: ignore
Message-Id: <20220115103230.73668826D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/docker-containerd: security bump to version 1.4.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=71786cb620d61498676645fc9087e9518d8b85d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The twelfth patch release for containerd 1.4 contains a few minor bug fixes
and an update to mitigate CVE-2021-41190.

https://github.com/containerd/containerd/releases/tag/v1.4.12

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-containerd/docker-containerd.hash | 2 +-
 package/docker-containerd/docker-containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 82b9d00d8c..ffcbeee54b 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  d42bf6d4f303061166fa5ec2657726a443d978fe13cf08ed13532df5216a61b2  docker-containerd-1.4.11.tar.gz
+sha256  85a531725f15e2d136131119d42af4507a5389e0947015152075c4c93816fb5c  docker-containerd-1.4.12.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 80f621fe7c..08c189525c 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 1.4.11
+DOCKER_CONTAINERD_VERSION = 1.4.12
 DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
