Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471E3C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 21:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E76441990;
	Thu, 16 Feb 2023 21:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E76441990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tztJVvdiYDv; Thu, 16 Feb 2023 21:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ADD34199C;
	Thu, 16 Feb 2023 21:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ADD34199C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B419C1BF42E
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D05C820B8
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 21:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D05C820B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-SQOBEXogQ4 for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 21:25:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85738820B6
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85738820B6
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 21:25:58 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SllKppmOEySOSSllLpIom3; Thu, 16 Feb 2023 22:25:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 22:25:53 +0100
Message-Id: <20230216212553.2591068-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
References: <20230216212553.2591068-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHperI59WzQ736Ve4Z1rZvJp12pHe+ezBYv4Su6mG/j7V5S2bcMgeD4lH0w/71dplylf+GSHeIGMtWPCdMd4RHfdMa5A5Qd+rHGgHPBDOcoU72CUTlik
 A2m4f0rwBJshgM66+4uwArJFu01V5vIaBCk7upk7uIUBrOJvQN6e71u2sWXqB56rqqcSJ/gaVbT8JM5AzraAyjbQBD0QlQGS+0uf9OhkzzjhA9PCgJOVBBN6
 DG3i7TGYRay7jLsBWHK8ieO0beVP6OuJZO6D+fE3P2ABrjeL+plbnHB+q8lie5Ccrt5wa8bZcYvrj1IF6rOk5YJO8NpDtlokudgYrgHb1eccdvsY5zbNSC+o
 995l6Yfa
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676582755; bh=R/shSJLVLidmMZ8QAbJkRqN9z4m7ifDSNFhFlMGNl9w=;
 h=From:To:Subject:Date:MIME-Version;
 b=ckwAUyj2e6Rdz6pGjie5Ja82Cc8FjzOQivbsaT4A3ZBLe6zRuCewsr+hBpOq/fPDM
 IgGp1FlMXTXIjPW6XHRb3CrgTAKu6mNGRv0fXVdgIPqv00arxE1uXIjAox7TGIBQdn
 WIN9X1rante96HzrGpuQmwETrNIp0VCecm/FwrpG4UHNh+yLtT7xkHYFiC7TBDpTyp
 qGH4nuOp67KbdEW9Ip0+EZP7Jqd2tLgIeSRLvo1Vi2lLBJTS4M3/UlJbcVv+Z+8XgO
 MRntniaiXbb16l496/mERnQRvPa3Ic7IkcfVMW9seq2lDKKZP2oRm2h0JqvwQt2jdq
 IeBzLadsRNrnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ckwAUyj2
Subject: [Buildroot] [PATCH 3/3] DEVELOPERS: add Giulio Benetti to board
 imx6ullevk for both mainline and NXP(Freescale) versions
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1c6f2d447..840455ccea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1136,11 +1136,14 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	board/bananapi/bananapi-m2-ultra/
+F:	board/freescale/imx6ullevk/
 F:	board/freescale/imxrt1050evk/*
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m2_ultra_defconfig
+F:	configs/freescale_imx6ullevk_defconfig
+F:	configs/imx6ullevk_defconfig
 F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
 F:	package/at/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
