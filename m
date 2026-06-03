Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D5CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6524284E;
	Wed,  3 Jun 2026 18:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EvpeA8ouNl9; Wed,  3 Jun 2026 18:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BFB4288F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512921;
	bh=K1JW2IMNRKGzXQrfNS12IK1KOkbEN66DERThrnwfqjg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YQZBsRNSgT61kFESzDZhFpA1BMWgTPeN9fPIwtl5DqvGBM4W5EY4SNQOvkV0UpjAi
	 CzyeerRVKLKfoHbFa5pBpWWU95NriER55jdhp9GH8EWLZT4KCBJ2GS6cJetO3yGQky
	 CP4iXBh6zHQ0ssgNwZq7ikay+p3xVveiCC4kTKle7nKO0EDAtNcSpQ4YrrdpVn8WLQ
	 iTJuf8OlbixiMnYw/eJpHr7s+e5VRFoXEdw9idkX+lzT1siMRBB8DnOpprC3OlSX+6
	 86XElcGCtoaq0DsJ6yB4XTrMQeh8ReTnlEmqqTizUwC5N9EaEgNkRQtgfTkmz22hV7
	 jV90NxFY1rqAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7BFB4288F;
	Wed,  3 Jun 2026 18:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD54B2F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7770F81228
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQbO-zyeZD_f for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0EA581237
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0EA581237
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B48BF87992; Wed,  3 Jun 2026 18:55:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:50:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7255e1ef0cc29a9449a957231a06ab83161d7b94
X-Git-Newrev: f660c7bae3e0004958acb3a2518fb409c6315a75
X-Patchwork-Hint: ignore
Message-Id: <20260603185500.B48BF87992@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stress-ng: bump
 version to 0.21.02
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f660c7bae3e0004958acb3a2518fb409c6315a75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.02
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.21.01

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index 81123b3587..706fed135a 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1339cbc6ccbff7e2ee2177bf0fd67e7b94e8ff7b07fe89bcfaec0280d800cf34  stress-ng-0.21.00.tar.gz
+sha256  71502d31f77987c3bda6931d47b44d7b03d8ac689e8154bbda676cf9d42e2b4e  stress-ng-0.21.02.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 4181c5ed1a..59cd249291 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.21.00
+STRESS_NG_VERSION = 0.21.02
 STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
