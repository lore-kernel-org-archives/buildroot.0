Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7582EC001E0
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058E684535;
	Fri, 28 Jul 2023 19:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058E684535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4ZneEQTUYUs; Fri, 28 Jul 2023 19:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45AE28453C;
	Fri, 28 Jul 2023 19:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45AE28453C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFDF11BF995
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C510D8452A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C510D8452A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKDsTp--FUqj for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:17:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC35C84528
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC35C84528
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9706083811; Fri, 28 Jul 2023 19:17:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:16:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9cd24738a70205a919a3dae1a7292b6d6811111
X-Git-Newrev: 007d3e2ffc9bf9238c8b18c7c1a1bcee82b6c9f3
X-Patchwork-Hint: ignore
Message-Id: <20230728191726.9706083811@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: bump version to v24.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=007d3e2ffc9bf9238c8b18c7c1a1bcee82b6c9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fixes & enhancements.

One major bug fix included in this release: The Go client now avoids using UNIX
socket paths in the HTTP Host: header, in order to be compatible with changes
introduced in go1.20.6.

Previously docker commands would fail with "invalid Host header."

https://github.com/moby/moby/releases/tag/v24.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 2ccf1d98b9..95050be88b 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc1d025fd16b113a1a7e2a5d34c30409613d9c4ec313937f17bf34991caf597f  docker-cli-24.0.4.tar.gz
+sha256  fa32b5f3c2f85fba9ef6e1b5099a4b608fa20af45ba71b3da2194e8728037eec  docker-cli-24.0.5.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 9b657093cb..4c38e7cba5 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.4
+DOCKER_CLI_VERSION = 24.0.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
