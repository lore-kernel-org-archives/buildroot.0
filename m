Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF7CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 18:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD9AC81431;
	Sat, 14 Oct 2023 18:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD9AC81431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPiajWCRt09h; Sat, 14 Oct 2023 18:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A2C8145F;
	Sat, 14 Oct 2023 18:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A2C8145F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0151BF2C1
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 18:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F4EF60F6E
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 18:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4EF60F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhVHd95wwMFN for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 18:45:27 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC52560BFE
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 18:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC52560BFE
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rjdaq4W1N6PZFrjdaqdTIZ; Sat, 14 Oct 2023 20:45:23 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 20:45:21 +0200
Message-Id: <20231014184521.87527-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014184521.87527-1-giulio.benetti@benettiengineering.com>
References: <20231014184521.87527-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP3uFE9lBYn7ozXDCAdxlsKue+/BLqvnzFV8ZyRVBXSpTxOQOPtWnheE1y0GwoudObEadVLUMOdH8unQzjjTWhp36hFS3UmJhXFSlOQpLzpsqvRBxHIv
 nS/jINq9xesXXKuu4ZsSKwjclIl77SwPsGJUrcUWteiNIw/hYCjCgh6glgQZzHz7sJQPZq0Th5kj8M+wkJT6oNJdsP9imR86SxXzLPctjeQOVgV/r+ofhWdw
 u5V9FaC+M/8kIeBsv86wg2o5seL5ZUHibf+/7+EKnTxDSczp19YrwqG9vvxYyyk3sqojJkeN1U26LjK1ZBSHa3ssrOrVOycsn5IXIiFwa+JMXuMBgv+18IfN
 /XDHo9M0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697309123; bh=g2FDqLK9mfVeVZF5y6K/mj0T42jMBlwSLIUdXKP1+co=;
 h=From:To:Subject:Date:MIME-Version;
 b=aeV2SCzxdQajgIG2N2whbutgappGAAVvhnQE9IbPdQzE3TNCVTrUonSMlIOKiJNZj
 Q9FuqIXJasjFuvCDzdKE2N94uMp83xIYfr/mlupp7lgU5KT+tAWOSi0wIQ4N12ihBW
 2LPD24XUr6oio066U8xkMTm7jkebMexk8xDaBC3D+eqZYktFZ0S6Uz58ggwpeCkA1y
 +Av7UJ1LAozc7/o2h5mmLWM4ktDtmykuJhlbGsCPVX5KqqiCD1EMFC0tR/bNolUM1f
 jBm3zVJIALJ5k4JKxuZ8kGb4DU9PxPg4xhMDp3sfXJqMlC7m0YEgprTykYWIk1eEWA
 fJ89gE0fYfoBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aeV2SCzx
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti for board
 Rockpro64
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86496f6cc5..4d0b9debc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1200,6 +1200,7 @@ F:	board/bananapi/bananapi-m2-ultra/
 F:	board/freescale/imx6ullevk/
 F:	board/freescale/imxrt1050evk/
 F:	board/olimex/a*
+F:	board/pine64/rockpro64
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m2_berry_defconfig
@@ -1208,6 +1209,7 @@ F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
 F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
+F:	configs/rockpro64_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
