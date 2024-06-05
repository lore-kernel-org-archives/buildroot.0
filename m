Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0179C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CB980ED9;
	Wed,  5 Jun 2024 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztd0N-YkFf5L; Wed,  5 Jun 2024 20:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5161180F07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5161180F07;
	Wed,  5 Jun 2024 20:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 110E81BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2493605D4
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCxRU87NSLmz for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39AD7605D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39AD7605D1
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:49:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C8387B1B; Wed,  5 Jun 2024 20:49:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 22:39:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f576c3142257f3f8647029c72364411fcbe886b
X-Git-Newrev: 38669bbf0cb620c56b071177d3d58572a17db3c4
X-Patchwork-Hint: ignore
Message-Id: <20240605204907.21C8387B1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-compose: bump to 2.27.1 for
 bug fixes
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

commit: https://git.buildroot.net/buildroot/commit/?id=38669bbf0cb620c56b071177d3d58572a17db3c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 12e839c71c..2896eee40c 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  42e9d2a33806656bd145ec742a3ba00b64acc3f88b500793d3b78319c39e25e0  docker-compose-2.27.0-go2.tar.gz
+sha256  7ca8746c86ba25491f5bbdc44c41d5cf7f64defa69f4015c601e1a562f7f64fb  docker-compose-2.27.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 32b2236a91..44e27787ab 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.27.0
+DOCKER_COMPOSE_VERSION = 2.27.1
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
