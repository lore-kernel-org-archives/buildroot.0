Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B89E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96498605C4;
	Wed,  4 Feb 2026 16:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa54mG1NhD0K; Wed,  4 Feb 2026 16:54:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A162460613
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224058;
	bh=8clfEcfqlk8HUx37S+2EAjo/4vU337qKjn8Dr+H4H0A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ljQdB1MwE0+JtYqyfNx5XCxdydaCWIlIU2LMbHQl68K9SH3vtyO8cM1eh5tplyQIf
	 ySl6tCOKkPaD9CHksienwDR+ImJ3ppZrIdsF5JL/7dosIYlqd57KypeAChuTkdSbMG
	 khm3FOG+FWYInxtOJr0KgxKpmWov9kYYBV5nrTibutwR0/Qq/jQ3LnhtmjENBePg2k
	 hqJr6op0jpRaKvE0efqnxitsJUdrS+ERrvGqy2U8qmyLXdDBHR6+A+MTMX+mxInJwf
	 da4XTSlATLWzoYZ11oqeBpxVO6TmONfe1oZuVl70fZwsItvmxfiC/vVArFrp4Rrqaf
	 etnjgPNS5ElRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A162460613;
	Wed,  4 Feb 2026 16:54:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0807F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF3A822F3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8vfTNqsM6Yx for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:54:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B616822A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B616822A0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:54:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 572C18695E; Wed,  4 Feb 2026 16:54:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:53:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 944b0ef086dab217eb2d38bda132eace3006d5cf
X-Git-Newrev: c10c9c2283b731f59620172ba882f6ac070eb9c5
X-Patchwork-Hint: ignore
Message-Id: <20260204165416.572C18695E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azmq: disable tests,
 drop Boost.System
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c10c9c2283b731f59620172ba882f6ac070eb9c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When bumping to version v1.0.3-54-g819b24035c in Buildroot commit 7d5bd5ecc0
("package/azmq: bump version to git v1.0.3-54-g819b2403"), two things were
missed:

- the parameter to disable tests was renamed to AZMQ_BUILD_TESTS
- the commit [0] was included. It removes the need for the Boost.System
  library linkage

Fixes:
https://autobuild.buildroot.org/results/2e7/2e7fe61cc349b843604091190fa7346f95dd0d56/

[0] https://github.com/zeromq/azmq/commit/b8b2a1aac47f8da70bc4d2d1c2f5d9a9ceaec748

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/azmq/Config.in | 1 -
 package/azmq/azmq.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 7bdd07ebf8..75cbeabf53 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_AZMQ
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_RANDOM
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  This library provides Boost Asio style bindings for ZeroMQ.
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index 99fb3212df..bb918bd529 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -15,6 +15,6 @@ AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
 AZMQ_INSTALL_STAGING = YES
 AZMQ_INSTALL_TARGET = NO
 
-AZMQ_CONF_OPTS = -DAZMQ_NO_TESTS=ON
+AZMQ_CONF_OPTS = -DAZMQ_BUILD_TESTS=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
