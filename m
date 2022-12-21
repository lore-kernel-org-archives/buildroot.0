Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 14:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E396106C;
	Wed, 21 Dec 2022 14:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E396106C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oftHXA9USxPC; Wed, 21 Dec 2022 14:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FED61059;
	Wed, 21 Dec 2022 14:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FED61059
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D17F1BF5D7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574A5417B4
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 14:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574A5417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJhlQmGDa9sZ for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 14:19:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C107417AC
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 14:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C107417AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 395FA86BCC; Wed, 21 Dec 2022 14:19:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 15:18:59 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e57617fbce5bb6577e8d9a07101a0387ad7bc4eb
X-Git-Newrev: b7ccb8decc1ef97eb3dca967c1bf36de2e9dbead
X-Patchwork-Hint: ignore
Message-Id: <20221221141931.395FA86BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/docker-cli:
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7ccb8decc1ef97eb3dca967c1bf36de2e9dbead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Partial mitigations for CVE-2022-39253 Git vulnerability and other fixes:

https://github.com/moby/moby/releases/tag/v20.10.21

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c833234cb4eb46cf95dbc3d4f32e1d2d2dab23b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 153e0e5d00..d9477cf3af 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f4398ad858274605f8e4e55d4618b2f5bdff6969a4afa232842bb2417d8a98db  docker-cli-20.10.19.tar.gz
+sha256  f0f62ca1c80e8fd5b9e140ca64ef3e75dc7cf7a28040b3d10b260307128946e8  docker-cli-20.10.21.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 1fac21790b..a14edb2c31 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.19
+DOCKER_CLI_VERSION = 20.10.21
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
