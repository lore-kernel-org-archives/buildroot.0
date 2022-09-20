Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA1C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 22:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97EE41928;
	Tue, 20 Sep 2022 22:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97EE41928
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDCeUyRBV2Q7; Tue, 20 Sep 2022 22:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83DD341920;
	Tue, 20 Sep 2022 22:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83DD341920
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EDA91BF377
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 22:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F86829F2
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 22:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F86829F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8PkizW0NTgK for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 22:15:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A906828F8
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A906828F8
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 22:15:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id alWaopQQqRFZ1alWaorUmZ; Wed, 21 Sep 2022 00:15:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 00:15:27 +0200
Message-Id: <20220920221527.99863-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBWfacZYSvJ5tKIkOhSWW+eF1e9Ku9s6XelcIdX0FSrbbv4lGocQ8dYWNg3lym9BVGYO2WaFcr2Y/BqgGupPQEh40sTnWuQTVIBZg2F4o4schsqgXytF
 04pOYoyg417amcBDG6Epx6O9ajjQ4IWK/HCCsDsV+XIvXZvW8KQiT6SSrqfp0sUY7TpC3PnoPVVDUJ0AwZn4kaEz2Aq8Nj3KXbKcd/tVSNv0QQWkLCKYOWzV
 XtyFNjOzWlGQCFcJtk+hw+yYeSJixHJNylisyMsv2qIj6+Id4278bp10fakh9UJC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663712128; bh=s7TL9qYtHs1yXVBywTGscal6on+0pig6LeCbbU1Qi2Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=dW/lvB8Jethy14+koLzXh36WWnjEizpT1yVP684BClr2EENysaFAy907XYZl5oqZI
 qeY0dQwBdQ7U6oUyqD+LkidRNFE5CjzOfkeYH72Ih6/m0qY9YDS26csnljV0jwa+Sx
 sdSO3nStzun4TzGHBMjnq5ew0meHB4iJWbGk1Z7Bua6LWLuQF9HHzWxXt8sfQAvyBS
 uaaTVqDWsKzfRvchzaqqIBKf+EOd+BBUM7GDJnTy6fe62tkht6M4mvJAhl6/vM63Eu
 FfUmoe0cMBiXxPxTlx4yb3L+I9TDRaSfgL+8QDyq4uuEQoU2aNYyvyU5JvKjGdQ+jW
 2IcNAjK4E33vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=dW/lvB8J
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to rtl8189es,
 rtl8723bu/ds, rtl8812au-aircrack-ng, wilc-driver
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
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 14b91fca8d..b6df50b31d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1149,11 +1149,16 @@ F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
 F:	package/rockchip-mali/
+F:	package/rtl8189es/
+F:	package/rtl8723bu/
+F:	package/rtl8723ds/
+F:	package/rtl8812au-aircrack-ng/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
 F:	package/trace-cmd/
 F:	package/udisks/
+F:	package/wilc-driver/
 F:	toolchain/
 
 N:	Graeme Smecher <gsmecher@threespeedlogic.com>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
