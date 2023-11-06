Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6269C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 10:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ABFE41450;
	Mon,  6 Nov 2023 10:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ABFE41450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EoQaxfDWtmNX; Mon,  6 Nov 2023 10:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4245541465;
	Mon,  6 Nov 2023 10:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4245541465
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67E2F1BF316
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3ECB541465
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ECB541465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asne_J5eKCAe for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 10:26:35 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACB0C41450
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 10:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB0C41450
X-CSE-ConnectionGUID: TxuW0XA4TLihC0UmwVog8g==
X-CSE-MsgGUID: 9AUJ22lrS/KMYPK16L4FMw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="11251895"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Nov 2023 03:26:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Nov 2023 03:26:20 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 6 Nov 2023 03:26:19 -0700
To: <buildroot@buildroot.org>
Date: Mon, 6 Nov 2023 10:26:51 +0000
Message-ID: <20231106102651.2796878-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1699266396; x=1730802396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=haeE1h0aQvCr/ZYWg8y534xJIZgAvGz7IFiC1itjgNc=;
 b=DrvJwkvM3bu4Ab+7cehi2kgoD/5bobktV8YHtoBwGD4oqRYz2jA6xzGb
 L5yCHyyss3QA0jaGOoix5yg5grcLnboFV3+QdCCS0/XYt69boqPOXiMwc
 Opf9PiTePrzK2kZtaItC3QdhSsvbmDaLspQg0osiSbJOVTzusdAmi7sEC
 ToYNUuFgTqWv0/2rlkehwC66+nn2TnRSAwpF85oK0MlbfGUDstv37GBmh
 biLNxPBXFV7bgfCeUYk8Lna3/8pdItOpO1txJ2Ob85saKX30EIazG5MAP
 LtPLU8QA40PykDR6YTg57X5lFBIY5a8eIzv1lraiz3Cbmf61VOixs+bqt
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=DrvJwkvM
Subject: [Buildroot] [PATCH 1/1] package/microchip-hss-payload-generator:
 bump version
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>, Jamie
 Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump package version to latest release.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 .../microchip-hss-payload-generator.hash                        | 1 +
 .../microchip-hss-payload-generator.mk                          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
index 69e05e18af..f827d2b752 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  f6f69412caf886e88abbf26de0dee1db790c790b89571f2f0def1e2f3620f057  microchip-hss-payload-generator-2023.06.tar.gz
+sha256  447771d4219176acc69c6d945ff40a0f3d0c5cbe63619927bc61b9e52ab05136  microchip-hss-payload-generator-2023.09.tar.gz
 sha256  0b67b1d44bcad078580fc5d8e9580a48a9466b769db58aeb1631d4c5ef97e08a  tools/hss-payload-generator/LICENSE.md
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
index 63ae22ed60..4c3ca93dfe 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.09
 HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
 # Some parts of the repository are under different licenses, but we
 # are only building/installing the code in
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
