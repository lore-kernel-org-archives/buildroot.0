Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD079C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 10:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DB9041464;
	Mon,  6 Nov 2023 10:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB9041464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zVGU7yPOfytq; Mon,  6 Nov 2023 10:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EAF841465;
	Mon,  6 Nov 2023 10:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EAF841465
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 352221BF316
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B2CF60797
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 10:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B2CF60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSpZDkffok-2 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 10:48:10 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5824F6077D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 10:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5824F6077D
X-CSE-ConnectionGUID: ee/JmXCfSpiOJ5BOop9muA==
X-CSE-MsgGUID: /S3D4endQci+LchUPdIdzQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="241920207"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Nov 2023 03:48:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Nov 2023 03:48:01 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 6 Nov 2023 03:48:00 -0700
To: <buildroot@buildroot.org>
Date: Mon, 6 Nov 2023 10:48:38 +0000
Message-ID: <20231106104838.3248519-1-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1699267690; x=1730803690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DP9k96tj1NR+QxQnqpniYxck3kfDT497gPAz+UnsJVk=;
 b=Za5YGbrd3moYGiRFsvEj0im0oKYi0mLtZWupc711erwRLnwOJwS/Uwif
 X5si1SCw4fpWwCT1CBnKkrmicn3kK5EZIcU4AbVeK14Kp3BUVQWiiQOX4
 QeK6ugJrhObUdQaSNkTE5xcvYdEg7CiEp108h0KYD1jCS6PfuBxljVsHd
 utRsCtE5wwa/rXzng3xawFdlpW/yf16S6K3buleExDmzirCag8dlchORw
 gGsXO1+SYFDQsM6ojjZwrw9qSJB3nDpw67L/lBUxkW5t8kS979molAtHb
 VF+rpBIDhBAyFk7fQ+difmqdzL3505rNMGBjUy0BYj9hGFUwr54qjATxt
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Za5YGbrd
Subject: [Buildroot] [PATCH v2 1/1] package/microchip-hss-payload-generator:
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
 .../microchip-hss-payload-generator.hash                        | 2 +-
 .../microchip-hss-payload-generator.mk                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
index 69e05e18af..b9015fc961 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f6f69412caf886e88abbf26de0dee1db790c790b89571f2f0def1e2f3620f057  microchip-hss-payload-generator-2023.06.tar.gz
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
