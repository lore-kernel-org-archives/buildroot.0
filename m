Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A438C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 17:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27FB182242;
	Thu, 24 Nov 2022 17:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27FB182242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yX0B_sMAaJIt; Thu, 24 Nov 2022 17:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6584981F4F;
	Thu, 24 Nov 2022 17:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6584981F4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA571BF5EA
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 17:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FF6782242
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 17:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF6782242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5k2xsiEpBFMm for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 17:45:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D0481F4F
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65D0481F4F
 for <buildroot@busybox.net>; Thu, 24 Nov 2022 17:45:31 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 0A23C4405C7;
 Thu, 24 Nov 2022 19:42:43 +0200 (IST)
To: buildroot@busybox.net
Date: Thu, 24 Nov 2022 19:45:17 +0200
Message-Id: <0930eb42f01f1754f95f7382fd59b359e3d8fa77.1669311917.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1669311763;
 bh=9j3/iXQ4VpuKPqLQcUEsNc92NgEF4AfzwR6tmSmP//Q=;
 h=From:To:Cc:Subject:Date:From;
 b=r2E6wUacMKh1vN4Jq7gfmALUQb8WqvRMXWkrkFchJCasAA2z9cEk51oAJ+LYvWB9C
 f31J9Ygc5KOG1DDGvZvuB1OqUUnX4fjPaLmcw4Lh95kDj2U//asGV2okPVnf1hVx++
 toSvtmEPCmCDu/MHrZvEdcQVNVS4IBgQQ8sMD5E0dOlCI0KzudJ0Dl2hln58gojZan
 yFTWxY9oTnt6PPJx/Adlfxz8Ou+Z81QeA0pQL6wDvx2qxqZv/NYYN6R/1e3JmGiLIC
 DuUFzYE4ZCUXBUgXG/cRafZjaEPhsttSicZTS2UGGwm6jIECiM8eH8JyDZG+/7gxyv
 AqUY1fiNjVqXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=r2E6wUac
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2022.83
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DROPBEAR_DSS is now disabled by default. Enable only when
BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is enabled.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index ff6e312fde24..8f6c49c62b86 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1  dropbear-2022.82.tar.bz2
+sha256  bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b  dropbear-2022.83.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index bfb80345ece7..36eb7898bad2 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2022.82
+DROPBEAR_VERSION = 2022.83
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
@@ -64,13 +64,9 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_DSS 1'                   >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
-else
-define DROPBEAR_DISABLE_LEGACY_CRYPTO
-	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
-endef
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_LEGACY_CRYPTO
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
