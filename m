Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB741C54EBE
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 00:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C4CD41B36;
	Sat, 14 Jan 2023 00:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4CD41B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeuCfYPO10h3; Sat, 14 Jan 2023 00:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9152641A55;
	Sat, 14 Jan 2023 00:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9152641A55
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F43C1BF3C3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07BB0821B9
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07BB0821B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0kcqQzprs0h for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 00:25:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB27D821B3
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB27D821B3
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:25:54 +0000 (UTC)
Received: from localhost.localdomain ([88.149.186.89])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GUMrpoumVBXcMGUMrpPbdV; Sat, 14 Jan 2023 01:25:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 01:25:52 +0100
Message-Id: <20230114002552.1427592-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBq2wMw53BI+8i1cI7LPbI21PApPUAXjg07JqrfSnwKD+ZicTOP2FHvmyYuRWzplO/ZIyTzXQqtd0Sa/Jj0bUcLGasMrQkpJPraE1a6mItnCYv2pDVKF
 6v2AXSUJiH/BEJGXDYLpuvlnrs4yYF/kWEQkKOqmYaO1rX69Gf1K6sVUbfNcsCQmfjys66HL1D5FYXGEgwdaMAs0B0YoMNcfQgIs0ebrlOAqH7VrFPzkM3Ex
 lHP4vYOEzdgOr4514vj9ERCTtzPG1D8X8lkHrATYo+gQlx/V9rBIEcnBkGgwhTC2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673655953; bh=bUSKBZaJnK4FpSwFaAM665RWxuY1IHQjOqGVf1B3BSk=;
 h=From:To:Subject:Date:MIME-Version;
 b=NFWY2D8Pztr57k5//AxFi5sq7K3JIcH6D7AaN2c1hv5r8k+q2GSrETT0Obm8V0T5N
 IyZ9LuDOGElyey4mn7lTLHykPDJ3dJBWk6R5LnnSF4CGC8QiobW2pnqU7svyUiBQZb
 hKaRihbJld1wgdDZa81t09SzgyfHbFRw0CUFa9c/dTa5BWi3Li0UVvfvlcECamD41j
 70rpC4HhuR4ISpnCGDkCrkfJrsSkRUqHNP7kFFTelWwh/42rQd3OwpvKDEFgj0Xdq9
 jFADx5IUfXi4ZFJ3rcARY73o4UebufMsQ/lljuu2Nab4gLvUzLMP7QAkLFL/GrwyjP
 9X+y9Y9eUx3UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NFWY2D8P
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 rtl8821cu
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d3db78b6cf..ffdec76314 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,6 +1162,7 @@ F:	package/rtl8723bu/
 F:	package/rtl8723ds/
 F:	package/rtl8812au-aircrack-ng/
 F:	package/rtl8821au/
+F:	package/rtl8821cu/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
