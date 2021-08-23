Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB50C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 18:00:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE1E61262
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 18:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BE1E61262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D452260778;
	Mon, 23 Aug 2021 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVEOHJ59JwiN; Mon, 23 Aug 2021 18:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D0460760;
	Mon, 23 Aug 2021 18:00:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF4A1BF215
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 18:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A10E60760
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 18:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rkz8wKhghxVN for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 17:59:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6EE26059F
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 17:59:55 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.200.254])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 78B8FB00515;
 Mon, 23 Aug 2021 19:59:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629741592;
 bh=YKbV4PDsRDURJ4KntgFSXXqmRVwIhqFUUiDH2Qh2/wo=;
 h=From:To:Cc:Subject:Date:From;
 b=OS63BGomoJ7JtxgMtW8Aa+RCTa9MvXZJIdYCxi1cAc5M7xIOMwxhSSpS92nazH5p8
 HrHg/YI71y+bHnr3q6jKkxf6zMRuEsXNRw7pj7pEp+cANldb8QZLww8mtOXA2gk17t
 85dNJdkhc98kNZT8WOSH8X6gITM+5iCpcoLlZAhYq1VBA/8+sjJ4z9VhbhWpjD842L
 b5gN2XF1NYBCJ4aIveiX9lqfARLS3YvggeY+USwou4nkG3hPtrj12wSO8kYBQ2mJ8L
 559/0PZeAUmgTQaVuqOPzMl8jjlDnUbpUOKc0HfSj+AmTDTrDfKAeMg51zoTiKSIh6
 T87e0C1FXqL0g==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 19:59:32 +0200
Message-Id: <20210823175932.577233-1-ju.o@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

For change log since v2.2.1, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.2

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 08a19e23f8..65e19438d4 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c56660f23f6c406b36646cc619fc2d2a5265d1d3290e79bcef4505bcd985fdd  fluidsynth-2.2.1.tar.gz
+sha256  695aedbfd53160fef7a9a1f66cd6d5cc8a5da0fd472eee458d82b848b6065f9a  fluidsynth-2.2.2.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 1355c06c4a..ceb9e574e8 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.1
+FLUIDSYNTH_VERSION = 2.2.2
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
