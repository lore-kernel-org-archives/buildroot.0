Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E116EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 11:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570B881F86;
	Mon, 21 Aug 2023 11:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570B881F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STsaP2ZKmzwq; Mon, 21 Aug 2023 11:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 981A181F7F;
	Mon, 21 Aug 2023 11:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981A181F7F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7184C1BF361
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D578149A
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D578149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJzWpnz_lKkt for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 11:30:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 892B78191E
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 11:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892B78191E
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="230871650"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2023 04:30:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 21 Aug 2023 04:30:24 -0700
Received: from jamie-dev.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 21 Aug 2023 04:30:23 -0700
To: <buildroot@buildroot.org>
Date: Mon, 21 Aug 2023 12:30:33 +0100
Message-ID: <20230821113034.2749571-2-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
References: <20230821113034.2749571-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1692617425; x=1724153425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6qzjA7NPZhqgGqZqVWur0wyuhgIk11Ok+TF64i7CG4=;
 b=dEottBXKIX9wsIB0aOt2luXBV+He7WJXUNCTbg+nT9xAL2AW1BoiU1DG
 AlxMRzjyizn0JONDkw/XcjO2zgKSkaGhNHjVmXY46kCgMDIA8kJyOCdsE
 rQUUpuMG1ZQ+hqq7FIBt/9r03X+vAxtnAXeLe7RYvX2ymmiW41PbF2RDk
 mkj29qSydyBm5VpV/69Jc0U4vqeJMSmZTolIHnV0Q2lAmj2MtHdeK+oxG
 n1FdaELS5DGFeuBjItDR5R6Vil55bdBhqaXrPJi5QEo+5tnOwwSby47fk
 9NQ3Tb4Ol3rq8sMVBY0XGWCGisCNZy7yp4w1EIXVpwPEcL+xICI4HFhmT
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=dEottBXK
Subject: [Buildroot] [PATCH 1/2] board/microchip/mpfs_icicle: update
 post-image script
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

The hss-payload-generator cannot find where u-boot.bin is when looking
for it using the config.yaml. Update syntax issues and working
directories. Fix the post image script to allow an image to get built.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
---
 board/microchip/mpfs_icicle/post-image.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
index 04b34bbd40..596bb21d78 100755
--- a/board/microchip/mpfs_icicle/post-image.sh
+++ b/board/microchip/mpfs_icicle/post-image.sh
@@ -1,8 +1,13 @@
-#!/bin/sh
-HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
-MKIMAGE=${HOST_DIR}/bin/mkimage
+#!/bin/bash
+set -e
 
-"${HSS_PAYLOAD_GENERATOR}" -c board/microchip/mpfs_icicle/config.yaml "${BINARIES_DIR}"/payload.bin
-cp board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
-(cd "${BINARIES_DIR}" && "${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb)
-support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg
+HSS_PAYLOAD_GENERATOR="${HOST_DIR}"/bin/hss-payload-generator
+MKIMAGE="${HOST_DIR}"/bin/mkimage
+BOARD_DIR="$(pwd)"/"${0%/*}"
+
+pushd "${BINARIES_DIR}"
+"${HSS_PAYLOAD_GENERATOR}" -c "${BOARD_DIR}"/config.yaml payload.bin
+cp "${BOARD_DIR}"/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
+"${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb
+popd
+support/scripts/genimage.sh -c "${BOARD_DIR}"/genimage.cfg
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
