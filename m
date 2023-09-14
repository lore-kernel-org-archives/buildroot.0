Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B76EEAA61
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CD541FBB;
	Thu, 14 Sep 2023 18:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CD541FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYJRL2YtS7su; Thu, 14 Sep 2023 18:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7642641FAF;
	Thu, 14 Sep 2023 18:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7642641FAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124DB1BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED8D94183F
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8D94183F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZV1-41dIFkB for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F721402E0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F721402E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C9C6811D1; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 20:20:19 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: c4a7dee1c247073ece726943950a11147c70d0a0
X-Git-Newrev: 4fd72a713a96317bf73b9346999891371db8b533
X-Patchwork-Hint: ignore
Message-Id: <20230914182452.1C9C6811D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/docker-cli: bump
 version to v24.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fd72a713a96317bf73b9346999891371db8b533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Bug fixes in containerd storage backend and Docker itself and a single
new warning about old Docker image format deprecation.

https://github.com/moby/moby/releases/tag/v24.0.6

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9204d644a9e81bb51b938a4fe09f7ff9ea5e974c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 95050be88b..5d8c1b0f59 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fa32b5f3c2f85fba9ef6e1b5099a4b608fa20af45ba71b3da2194e8728037eec  docker-cli-24.0.5.tar.gz
+sha256  c1a4a580ced3633e489c5c9869a20198415da44df7023fdc200d425cdf5fa652  docker-cli-24.0.6.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 4c38e7cba5..53c9ddb6b8 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.5
+DOCKER_CLI_VERSION = 24.0.6
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
