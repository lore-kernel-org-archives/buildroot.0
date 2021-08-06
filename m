Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B7FC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:03:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0A5611B0
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA0A5611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88B6D60AF3;
	Fri,  6 Aug 2021 21:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_IXBTGEFsJi; Fri,  6 Aug 2021 21:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C93EB60B02;
	Fri,  6 Aug 2021 21:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5510B1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40AB083ABD
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JX5Wbvmkgec for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:03:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C71F83A5E
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:03:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 989518C990; Fri,  6 Aug 2021 21:02:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Aug 2021 22:05:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 736f6ff61ace16eeba90b505d3aaf163e0d1f180
X-Git-Newrev: 3727d7175c90411ba37cc646cdeede401ed5417e
X-Patchwork-Hint: ignore
Message-Id: <20210806210246.989518C990@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/htop: fix sources
 location
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

commit: https://git.buildroot.net/buildroot/commit/?id=3727d7175c90411ba37cc646cdeede401ed5417e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Change sources location from bintray to github since bintray doesn't
work anymore.
Use commit hash for version instead of git tag to avoid breaking
existing source caches.

Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7332bc6eb092a18c506e614fc950c5b697ba1114)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
