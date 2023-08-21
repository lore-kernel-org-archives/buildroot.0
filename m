Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F290DEE49AA
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 11:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9968081F30;
	Mon, 21 Aug 2023 11:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9968081F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVBfQqVtGmGS; Mon, 21 Aug 2023 11:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CBE81F89;
	Mon, 21 Aug 2023 11:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CBE81F89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDE2F1BF361
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C526540134
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C526540134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PylWejQi11mX for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 11:30:28 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDB63400D7
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 11:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDB63400D7
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="415512"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2023 04:30:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 21 Aug 2023 04:30:26 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 21 Aug 2023 04:30:25 -0700
To: <buildroot@buildroot.org>
Date: Mon, 21 Aug 2023 12:30:34 +0100
Message-ID: <20230821113034.2749571-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
References: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692617427; x=1724153427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZLRY3vxoBH+nlrTnT5RIE7e+gwnJ+Q1libMDTKFmxk=;
 b=TX5hxxMwwE5fkjPHlxva6THDktseaFlRP7UetYefBWklk7ceaXHmzxip
 bW9MT5mRhodYqzGf/Ytu3heNAp4KTXc8+IqszRcPkZX2x4F5ib/ZxM4Dn
 /9icAgDY9BAnOlS9kUjk9bqHpzyr9wFrb5P87BZjdZv8kTXr4OAb95ZwK
 CJIGb1Kj2IYFYIZNPu8hT1TTzCYzGXMYa5vt7rqp6jB6fadJ3XDrBEbFb
 m/HIMWaF8WXv6gtvUoTi+U7A+DIUo2/YBtE7M4daS+sxwWq3FQfSqVRGj
 jtjJTi/FmGRS0TcErqK1r6/8oAtIH/HwvQXPsG4HAQsmFF7eU81Tat8I/
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=TX5hxxMw
Subject: [Buildroot] [PATCH 2/2] configs/microchip_mpfs_icicle_defconfig:
 update RVC config option
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

Update the RISCV_ISA_RVC config option to match updated RISCV kconfig
instruction set options.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 configs/microchip_mpfs_icicle_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index a3b3093982..54a4d55a5f 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 BR2_riscv_g=y
-BR2_RISCV_ISA_CUSTOM_RVC=y
+BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
