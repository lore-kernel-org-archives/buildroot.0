Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B3ACD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E9D847F0;
	Wed,  3 Jun 2026 20:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SJFcoCvMIOQ; Wed,  3 Jun 2026 20:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 029E7847F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780517195;
	bh=DO9t2sWwNE9MhtOjX6KJUHk1jaFPyjB6O4DWKxZLw2c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GLAe1OYtF1+ImVoTl/CpO2+TbP8oFAPJSwBQ26ou4cFRc6o5tEd30spODd6xfvQbo
	 9iaIae+qRiDc6FtJG7yjztQbgbo8f6QJB7KcyFLXXeavJJcpiKRkHcBAbgeVvYEH4n
	 xvtdX2pyao4UrfahQM6tuP4q5MAFpODIGmNP88ENmiv1mqFtgh0p57JK0XCFaJXe9W
	 /YUs5vo14QtroUpnKO8iNLISUDH093Ijb13MYZWPKlhYUlvFFzwITSaAbz/DAbzQYl
	 RzHd2v/gYOIzr4t5JUbSv0eP4PYpFC+ZDk4kultDJpD/nc+uwTMbaSQuldHtPkA8ba
	 1cSA6noI5FAEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 029E7847F5;
	Wed,  3 Jun 2026 20:06:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 639D6DE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 552B34231E
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SX_gyHuROwls for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB8A40077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB8A40077
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 471D98799D; Wed,  3 Jun 2026 20:06:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 22:05:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daf49629376b0f61aeb330e4f25dee495d398bc5
X-Git-Newrev: 831335ac71c8fd366c1dbbc34a9a11d26f32df97
X-Patchwork-Hint: ignore
Message-Id: <20260603200617.471D98799D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: security bump to
 version 28.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/831335ac71c8fd366c1dbbc34a9a11d26f32df97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issue:

- CVE-2025-54388: Firewalld reload makes published container ports
  accessible from remote hosts

  https://github.com/moby/moby/security/advisories/GHSA-x4rx-4gw3-53p4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 5d7bc51a6a..7f305b6880 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4828e32e474cef1b78f40278211648300071399c7498252dfe0b96e789b8a31  docker-engine-28.3.2-go2.tar.gz
+sha256  3727c8963ab4bcff12291e99e4d4a6b9a29ace5236fd245717bbff648f15f8cd  docker-engine-28.3.3-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5fe225fbbc..2df260e1e5 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 28.3.2
+DOCKER_ENGINE_VERSION = 28.3.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
