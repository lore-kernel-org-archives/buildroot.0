Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC507D5CCAF
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 13:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D6CF608A6;
	Wed, 30 Oct 2024 13:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LE9ApxkCzuau; Wed, 30 Oct 2024 13:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB0A5608AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB0A5608AB;
	Wed, 30 Oct 2024 13:34:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2760B494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1623D608AA
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvMXKKgAVWLF for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 13:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=194.117.254.33;
 helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA726608A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA726608A9
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA726608A9
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:34:36 +0000 (UTC)
Received: (qmail 3088149 invoked from network); 30 Oct 2024 14:34:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Oct 2024 14:34:34 +0100
X-UD-Smtp-Session: l3s3148p1@isgtw7ElStnAwtcC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: buildroot@buildroot.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Oct 2024 15:34:15 +0200
Message-ID: <20241030133416.505410-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=dDi7nlFvayZ5P1
 t3TdqasDMo/YOpkx7nvkxiPrWn/Ro=; b=LFY4Esfg/Qs14gZDrprtUq+Tw2jQHF
 xjFElG6shIyeas/1zd3xubfBj0eko9MLcICjmBBiTJnq1lwkstA2tiIeWf2TSIaf
 KgPwbDfCKB1QH91ss7efPM2nQWtdYqLKSDmNNHAxJbBrBbkic1HpQQZNsCaKdEpH
 n/wDxkuHnIu7kphsjmY50wL9JY5cSyQqsZUDGwZFIijaIkNFZzfdtkHy2n4fml1N
 YAg3DyZbquEiSZOdLBp3OG+LpAWfv97gBF207NfO4Jn/Ijo7eLyNMltUSCYzH1Nb
 d1mqyrSlMZocoMgyoGptUjfZbbLY5LzdjkAsJILYZ/CyzMl4nVeMXrtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=LFY4Esfg
Subject: [Buildroot] [PATCH] package/rtc-tools: bump to version 2022.02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Now I subscribed to the list...

 package/rtc-tools/rtc-tools.hash | 2 +-
 package/rtc-tools/rtc-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtc-tools/rtc-tools.hash b/package/rtc-tools/rtc-tools.hash
index a3f3bdcc11..edf65bf968 100644
--- a/package/rtc-tools/rtc-tools.hash
+++ b/package/rtc-tools/rtc-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  68b6820aeb8132b3f034fb79cf761c4549373d67641afb05b58641f1d32bb69f  rtc-tools-33ef4aa1c92b0c92a351284d93d1ac5570de9cc7-git4.tar.gz
+sha256  bc5f025b9d326513f8f0cf3c5afee7d18fa0898b53312881a20f7c099b83f5ae  rtc-tools-2022.02-git4.tar.gz
 sha256  7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  COPYING
diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
index 2882c88575..a2adc82a9b 100644
--- a/package/rtc-tools/rtc-tools.mk
+++ b/package/rtc-tools/rtc-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7
-RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
+RTC_TOOLS_VERSION = 2022.02
+RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/snapshot
 RTC_TOOLS_SITE_METHOD = git
 RTC_TOOLS_LICENSE = GPL-2.0
 RTC_TOOLS_LICENSE_FILES = COPYING
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
