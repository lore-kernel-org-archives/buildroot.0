Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C42C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A77260C51
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A77260C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5BC760768;
	Sat,  4 Sep 2021 18:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7j70Pw6EZfZV; Sat,  4 Sep 2021 18:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BDA6079C;
	Sat,  4 Sep 2021 18:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 432D61BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8BE4402BB
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5D3nWLZHfLZ for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EE214023C
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 68AE08834C; Sat,  4 Sep 2021 18:23:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:17:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cce9eeac8b70878cb0a0f6a990aa99e517529e10
X-Git-Newrev: ceb79e472da6d1a1b66d36530cd40ae76ce05ec0
X-Patchwork-Hint: ignore
Message-Id: <20210904182354.68AE08834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: bump to version 0.1.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ceb79e472da6d1a1b66d36530cd40ae76ce05ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Cage to version 0.1.4, which is a bug fix release that
supports using wlroots 0.14.x.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cage/cage.hash | 4 ++--
 package/cage/cage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 6e312bbf5f..31ae25bacc 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
-# Generated locally
-sha256 c28aa8230f937c89b564967748451c1eb15d8633a71a1ed6e22d532afa15462e  cage-0.1.3.tar.gz
+# Generated locally after checking GPG signature
+sha256 dfe27fb0c7d43db72d6c82f01e2736580a0791a23ba69d7b56285d08af98ad90  cage-0.1.4.tar.gz
 
 # Hashes for license files:
 sha256 e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 0950c70474..a661857a95 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.1.3
+CAGE_VERSION = 0.1.4
 CAGE_SITE = https://github.com/Hjdskes/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
