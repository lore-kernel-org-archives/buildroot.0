Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04736C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38EC0411EC;
	Wed,  1 Jul 2026 20:08:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fh0_XaGGILv4; Wed,  1 Jul 2026 20:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 305C7408B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936486;
	bh=arcbKkWyl4VwzUuhxJoXdOyB7URnSsF2et279EyNYfA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i2Lh0TMi4KM4KCex2cY3C0idicQaQThr+TeKJhBYTIvPupnfVH6JUpcWcME0BY2Yh
	 q3+jEZekRBkSt2ISWJLmhcuQkIHcDwQuiHnsvwMOZUScwPTrnq3viv8JhUvH3OiPLk
	 FGGbeuSy3SaM/emB0Mwr6L0wEIoLnys9y6+Bi/PmuuP7bZOJLe3A9uySRzKwwD6KFg
	 kLlP1fpLEWjHrzkZIwJCy97QdWIlKguw3eJWZdGR1NLd9KordnMlcwQUObUt5vSqsr
	 mfFLgJRaF2d9FoyxImUda48Siz01buSPsASTXmXy8LH8+9r8kAWtgwuCY2o0/aW0Nw
	 /3pESPVzKQ1IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 305C7408B6;
	Wed,  1 Jul 2026 20:08:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED29F316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D38A561046
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5A7lXThm99r for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D806261043
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D806261043
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 489B387A0E; Wed,  1 Jul 2026 20:07:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 22:04:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f1c7f7db28595cc2ecc9345a296501a7797ba12
X-Git-Newrev: 411055ed371ebb56fb8a21c9ea230ac67a572cc9
X-Patchwork-Hint: ignore
Message-Id: <20260701200735.489B387A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/411055ed371ebb56fb8a21c9ea230ac67a572cc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index e78cf1f188..70456a4fb2 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  029230b29c3745924ea850c7046efd1db74b863fdfead8b1aaba3bdd5b0cf895  armadillo-15.2.7.tar.xz
+sha256  f781e9d935db7e8b9a64c58b6a817354d38a1769e179b477364f5e6414953f6c  armadillo-15.4.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 756a3fa8ab..b806b0f1d1 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.7
+ARMADILLO_VERSION = 15.4.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
