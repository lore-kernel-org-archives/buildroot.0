Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B62BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91A160F91;
	Wed,  2 Nov 2022 22:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91A160F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHB0fWPrUWe2; Wed,  2 Nov 2022 22:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F00D760F74;
	Wed,  2 Nov 2022 22:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F00D760F74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2D391BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E92B60F74
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E92B60F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdB-07OnklCt for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:53:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB82160E6B
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB82160E6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BACBA87B19; Wed,  2 Nov 2022 22:53:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 23:51:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2ad7133517c8f2085c7a29e639afa20c5ad15d55
X-Git-Newrev: f143ebb585cbcedc777630581b7da4ef04335c47
X-Patchwork-Hint: ignore
Message-Id: <20221102225337.BACBA87B19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/docker-cli: bump
 to version 20.10.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=f143ebb585cbcedc777630581b7da4ef04335c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 231e4922173ea55032b91b2d068610fd380afb78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 8af47adc63..153e0e5d00 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  87ba64f76d3bb98666fa44552c3eb0b1c10e5e9c43010e8dbc180ba22690413a  docker-cli-20.10.18.tar.gz
+sha256  f4398ad858274605f8e4e55d4618b2f5bdff6969a4afa232842bb2417d8a98db  docker-cli-20.10.19.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 707069512e..1fac21790b 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.18
+DOCKER_CLI_VERSION = 20.10.19
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
