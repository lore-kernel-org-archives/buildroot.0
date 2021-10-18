Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ED0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:57:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B93F661038
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B93F661038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B04740494;
	Mon, 18 Oct 2021 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDZq0W9EsYkN; Mon, 18 Oct 2021 19:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A7884048D;
	Mon, 18 Oct 2021 19:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC9931BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E95EE40635
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HirUljsfcJ7 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E60540632
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E947687799; Mon, 18 Oct 2021 19:54:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:54:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d53c7024196782128a147f143591e67b83eb8852
X-Git-Newrev: ce45136df09657998e8069844e91190504fddebe
X-Patchwork-Hint: ignore
Message-Id: <20211018195414.E947687799@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: security bump to
 version 20.10.9
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
Content-Type: multipart/mixed; boundary="===============4303582883539012392=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4303582883539012392==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ce45136df09657998e8069844e91190504fddebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-41089:  Create parent directories inside a chroot during docker
  cp to prevent a specially crafted container from changing permissions of
  existing files in the host’s filesystem.

- CVE-2021-41091: Lock down file permissions to prevent unprivileged users
  from discovering and executing programs in /var/lib/docker.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============4303582883539012392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4303582883539012392==--
