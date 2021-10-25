Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D59DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D149461076
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D149461076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE8980D8F;
	Mon, 25 Oct 2021 11:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkbXYgRKFtgz; Mon, 25 Oct 2021 11:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5F480DD4;
	Mon, 25 Oct 2021 11:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC84C1BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B91EF40277
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rwb7_9Xks1dB for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:46:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1850F40243
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:46:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4448788717; Mon, 25 Oct 2021 11:43:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 13:42:47 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 499161d3dbb857dc629a96c22632012e37bd5060
X-Git-Newrev: 05138836654a29397bb56fd8e3be902af2d2c935
X-Patchwork-Hint: ignore
Message-Id: <20211025114311.4448788717@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/docker-engine:
 security bump to version 20.10.9
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
Content-Type: multipart/mixed; boundary="===============5458363316978992779=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5458363316978992779==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=05138836654a29397bb56fd8e3be902af2d2c935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2021-41089:  Create parent directories inside a chroot during docker
  cp to prevent a specially crafted container from changing permissions of
  existing files in the host’s filesystem.

- CVE-2021-41091: Lock down file permissions to prevent unprivileged users
  from discovering and executing programs in /var/lib/docker.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce45136df09657998e8069844e91190504fddebe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 07acb87864..5e15842859 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2505d00032f5d40ead5ac779c2840303dcead04713c93ba974be4c19b3ab8d0a  docker-engine-20.10.8.tar.gz
+sha256  359e8854d0d51bc884d434f182f64ca62f25fbbe7b9c6a336eb09f212fe8cc9a  docker-engine-20.10.9.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7d338a5c0c..84366d9334 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.8
+DOCKER_ENGINE_VERSION = 20.10.9
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0

--===============5458363316978992779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5458363316978992779==--
