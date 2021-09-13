Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD843C433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83ECA60EB4
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 17:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83ECA60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B25F80EED;
	Mon, 13 Sep 2021 17:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjtC8WwNyKYV; Mon, 13 Sep 2021 17:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B7F780ECB;
	Mon, 13 Sep 2021 17:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15B101BF983
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0589F402A6
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOJecv129aS6 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0864F4029D
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 17:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E820D8A58E; Mon, 13 Sep 2021 17:45:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 19:30:10 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 18ef18b1b3055c39c71986dfd3eaf1c81d6a504f
X-Git-Newrev: eb4f027d55307582febefc0c31b8dac5ea94751b
X-Patchwork-Hint: ignore
Message-Id: <20210913174527.E820D8A58E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/systemd: bump to
 version 249.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb4f027d55307582febefc0c31b8dac5ea94751b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ecd20b16332661f77be030605e38d6d2fa9cd049)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index b419dce445..baab5304e6 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  69ca802ff87e316a216f4bf5e5fd787dd9810c8c8c5076917ee817e52bd6c3a9  systemd-249.1.tar.gz
+sha256  f3df809bbe777fcb5ffe2b29aaf6f871de764ef22706940960f88b8a850e9278  systemd-249.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8bfd407f81..5a76f2f246 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 249.1
+SYSTEMD_VERSION = 249.4
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
