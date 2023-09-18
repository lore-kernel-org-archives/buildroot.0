Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E55CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 618AC414C4;
	Mon, 18 Sep 2023 06:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 618AC414C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SzQ5LTalv49; Mon, 18 Sep 2023 06:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A12DB414C1;
	Mon, 18 Sep 2023 06:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A12DB414C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A89921BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A2F40446
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A2F40446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3U3Uu6oOQY8K for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:48:28 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EB354148F
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB354148F
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D94C11814B9; Mon, 18 Sep 2023 08:48:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 08:48:00 +0200
Message-Id: <20230918064806.2998824-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1695019706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=ryb+mO9RknS477MHfBfuyJfVr9+WUWdEohIn78FUcMg=;
 b=JwfRSbakKBRxENEDUoRSN/riGGWv+gt4k6rHA/dA9GsJXtDZkbSPjkP+MAlXMefve9XQQC
 oHlkZp8Xx8oOFSyPfxM977gPiJiGQBIvfHEuqRwuEHOWFzgQEb/aSOubcNvKlDyFrtHRkp
 L7GwSbXZMi3CXJcevCBB/ifnUDruvcs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=JwfRSbak
Subject: [Buildroot] [PATCH] package/catch2: bump to version 3.4.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index b533792f8f..88a6a06df2 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d90351cdc55421f640c553cfc0875a8c834428679444e8062e9187d05b18aace  catch2-3.3.1.tar.gz
+sha256  122928b814b75717316c71af69bd2b43387643ba076a6ec16e7882bfb2dfacbb  catch2-3.4.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index 6e4af3d670..580ddca5da 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.3.1
+CATCH2_VERSION = 3.4.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
