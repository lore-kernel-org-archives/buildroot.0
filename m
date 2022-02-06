Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89992C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40475402E2;
	Sun,  6 Feb 2022 20:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uwg0HHXH39ec; Sun,  6 Feb 2022 20:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A2E402B3;
	Sun,  6 Feb 2022 20:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 864401BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2B4781765
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_Xw97LTYp_j for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69CA781768
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:54 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnnFnd6Ghks1JGnnFnWGSQ; Sun, 06 Feb 2022 21:05:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177953; bh=058p9DWSzKS7jEGEqbFKajTQ1XkvtzMEOdNDMWlrLho=;
 h=From:To:Subject:Date:MIME-Version;
 b=SrsbWyVq0oBLZgie+Gm25yU7mVbR6GZ5Kt6CUt4H7tgbj6RNMWj9/2bBfX6/H6TGo
 dhGFSfzg5s/CUgd3ZwRxeh3gVfTXTqcu/iDfk+FKicSjMFw/hGGaQz9qdTLcxzlMRa
 GYSLc6lr8p8S6mnRyeHEcQYQI17w05BWGN372nuAEe1XYHe/4fhJ/girg5VKK2G5RU
 GRpAqmuMkGZWrsUX50/KO3HkJLRSG3CEpacEE48r4Db8X6Q38hQqubThwqihA6Jd4D
 hbo4ZdCllmQXYHaZUrYGyPAsQ30zuu+U7yRCJ8flwWUt+3iZWoFfJXoPkZUfbsXINV
 naZPQINytf9uw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:51 +0100
Message-Id: <20220206200551.2758572-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMR43AALAk+NuKuXREzXabBzLzap/Q3zRNWqvuCtkdN4/ATbdQHqHIWOnTqSSrqz5X8ddSkYHFHBzRIntl0hKRnYUXadoZH4rPCT/2ZJ23sbddqoh4+f
 hEMGyOgIRDGy414Nzi0aePHBFnPX6oECHjRAp+gGhYHvNqoyIuTCCNGksSnACS/sqqbKAPkj9sU43TFZ0NTzFdyY6nMydUSlgzR3LQRfNmTV2UA4L6AQqGbN
 N6yeyWtDo0zvMaBERz6FRYUsfqw0v68OXeARnl4roGspvfWUEwnNTwj/s2Uc8WK3eWxYxU1qFUV+3JYReQWIYXcvBOGU2rQDO/ghxPYDLDg5RVsA/wBDr0b5
 6GZCjB3p8k+IdpiUKYlF1MSAAMc6JMkVRT2PirbVcmScIlTZbZvUkwwuhKuILLR1JIrWd8ZJ3SnWiIrrW5yoiq5hMzoOpC661Vuo6YXTMR6tfLXV06SUdEjv
 hBcKmpqD8F5mXMyAPB/vuH8IcMceDA1Obk5t53rFegtvBU07plfyE46sYdcANb5ASLjw9ICf7TXrqkDfcc+deDWxwcUNo+O2SafPbfL9DUm4gRwiXTb3rzVW
 y6WGMCDQ+RVOqW/xNVx7Zh+U
Subject: [Buildroot] [PATCH 16/16]
 board/sifive/hifive-unleashed/genimage_spi-nor: add comments to particular
 partition-type-uuid parameters
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/sifive/hifive-unleashed/genimage_spi-nor.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
index 903e675a90..f5e8f188e3 100644
--- a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
+++ b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
@@ -8,12 +8,14 @@ image spi-nor.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 20K
+		# ZSBL only loads from this type of partition type uuid
 		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1044K
+		# U-Boot expects exactly this partition type uuid
 		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
