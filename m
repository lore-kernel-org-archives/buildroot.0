Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542A0C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B70ED41625;
	Mon, 17 Oct 2022 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B70ED41625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0t8iJRTA5DF; Mon, 17 Oct 2022 20:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF1E409AA;
	Mon, 17 Oct 2022 20:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF1E409AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79AF81BF313
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54A0B82C7D
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A0B82C7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KUQ-_rgIrPs for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 20:18:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 082BC82C33
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id 082BC82C33
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:18:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kWYnoDy5SJpY4kWYnoLWa3; Mon, 17 Oct 2022 22:18:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 22:18:04 +0200
Message-Id: <20221017201804.995212-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
References: <20221017201804.995212-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPRpb0efSWopVc8ujvcL6ZQ1M2e25H0VzME4eVBmKc5zjYgsFepsvyLh7jdi2B7nV8gnOJxACnBUIHw4ibM9pkpbl3wdGeBAR9w2rYq7pZRlpnc29Sb+
 Y5CxFAu/+yldBWmJhVFU3d0cQ5GG4J13ufFdRAjAwlloa2rp76nO01+swZBPG8JX+izWrtX9XZkDB8pZI77hYgGpfd2Cqx798cetVOm3U8/kTX/OBfcbuX+K
 R3PZbPBbC+tpPrk7kCRa2GkgNwBfi10AImLvPh6ylMoAqJ+ouP5/jNW+t0gLgb0k5kU/+iHyQFPWCQqka2WCeOUuEJ/FyGvCDJSplLj07+U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666037886; bh=4Zf3rhqKFb4zQqbTzGOWNLX9dl0oQdmB1UULb7fInGc=;
 h=From:To:Subject:Date:MIME-Version;
 b=UGGzsHwRjipkJ5MsGDaarm/Pk4hybGKIv6MG8qMu4R/fIv1lGO/9PbQNa9l536sjf
 9Mdd1oUSkwuQs8cDfrJI+kN0wHFg6dF4yGlRrDRazdqKsaCYoM2e3LVD5Q+nzk+jLi
 xHX2K/u7kBjW29Rj25XZ46bpRt3KmXN6Wi1r+XS36F2jVqHQBSiRlznJhOIRF77bRZ
 3g/TMxzhU4/QUtSmW7MW+sc+oAg9693EKS2+h4Axyz6knwRD6jZ1bp0dnC0HiOx4fd
 fZpvH5FFxVVAODeVZYLx+jnQVryQuCwbJ0T9wRCkPyscrMkenOm4ZjeDU8MPpmUSFy
 Emt2S4SRBH3Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UGGzsHwR
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to rtl8188eu
 package
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b60dbc11d..c102ddc911 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1154,6 +1154,7 @@ F:	package/nfs-utils/
 F:	package/python-uvloop/
 F:	package/qt5/
 F:	package/rockchip-mali/
+F:	package/rtl8188eu/
 F:	package/rtl8189es/
 F:	package/rtl8723bu/
 F:	package/rtl8723ds/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
