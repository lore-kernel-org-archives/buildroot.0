Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDA3C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:58:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8841D60F59
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8841D60F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E73340387;
	Mon, 26 Jul 2021 21:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dQZNsvrRIMM; Mon, 26 Jul 2021 21:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1FFB4033B;
	Mon, 26 Jul 2021 21:58:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D103F1BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCB1A4033B
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaO3O0FZYfPd for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:58:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C2794013B
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:58:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B7EAE89049; Mon, 26 Jul 2021 21:23:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:57:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af58830d0736cf60d0bb65b562c6888f633318d0
X-Git-Newrev: 7332bc6eb092a18c506e614fc950c5b697ba1114
X-Patchwork-Hint: ignore
Message-Id: <20210726212334.B7EAE89049@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: fix sources location
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7332bc6eb092a18c506e614fc950c5b697ba1114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change sources location from bintray to github since bintray doesn't
work anymore.
Use commit hash for version instead of git tag to avoid breaking
existing source caches.

Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htop/htop.hash |  2 +-
 package/htop/htop.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 647feabb8e..34d95eb7a1 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19535f8f01ac08be2df880c93c9cedfc50fa92320d48e3ef92a30b6edc4d1917  htop-3.0.5.tar.gz
+sha256  123476d56a5e6a219654eebb6b2ec747dfa364f39c01a6475bf8030a25c81bff  htop-ce6d60e7def146c13d0b8bca4642e7401a0a8995.tar.gz
 sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index aa2ff24750..bb2bcb29ae 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,9 +4,15 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.0.5
-HTOP_SITE = https://dl.bintray.com/htop/source
+# This commit hash corresponds to version 3.0.5.
+# htop sources were moved from bintray to github and the sources tar archive
+# was also changed (the build process requires `HTOP_AUTORECONF = YES` now). We
+# use commit hash instead of git tag here to avoid breaking existing source
+# caches
+HTOP_VERSION = ce6d60e7def146c13d0b8bca4642e7401a0a8995
+HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
+HTOP_AUTORECONF = YES
 # Prevent htop build system from searching the host paths
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
