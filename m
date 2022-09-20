Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B953C6FA8E
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 22:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E518941938;
	Tue, 20 Sep 2022 22:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E518941938
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LYJYRXnA5yyh; Tue, 20 Sep 2022 22:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017FA4192D;
	Tue, 20 Sep 2022 22:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017FA4192D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 048111BF377
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 22:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D23A44192D
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 22:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D23A44192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQuacwzV07Hu for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 22:19:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100C141926
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTP id 100C141926
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 22:19:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id alaZo1mG8RkRWalaZoCZ81; Wed, 21 Sep 2022 00:19:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 00:19:34 +0200
Message-Id: <20220920221934.100111-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPDkz0ruAPjGnugu4Bsij2OOeq86F/GO2R+O4ce2aquE6o4HgbaT5ZQ2CB6vcoOhdKpUmw34maKzYevfqp1BWLKHWn/H/q75Bd2fYNVwIRWxG6ylBimT
 B35MmxHR4h4m64Q+X0SDNz5NHDg2ZSX9eE/ETWOLBqB155efCzrKYDQIH2g42CG7NCnt5chu7VrYy+ASQwU+10WnaXlZrByP+pD9sKxACMJ6kKoRq+wh7W9C
 K3tNrHVIh0ozUe1v6Wz06ILbazEpYXF2pMeoHQAvBDhiJMa8JNy20OOwymZbRfu5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663712375; bh=BIT70jNNaJWgGFGhl+EIw+ggODejgK9N6vDJYzHdKRQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=FobgM1H/pi94V2ncH2cVcE7waLrSLtJGIGQ+5RRpgHmZk2gL85Xq9MQQjEB7/up1l
 uWGZPgLtR/ZIPL+ZVNYjzUks7kGh5nQ73t1RXZRSkQCDjGQIviAAO0bUPrsZ7hkSPV
 mzthGUCBKRpJMpGxtqRKFHrnFNfC3gP3VdyNfnsXc+f+FruUPBsHUxPjDATz3p6Zd8
 IKENeNK6fQk/+VQZhfCzX11AoX4gCVdg5xpXCZE8FMsYAM3IxGXUkYwZgzY+GyyRtu
 WianQwlevJ3Pe1KtiHI7Ocn7nnEYMlq848TR3atI62WjGsQLUZlW7L5UVkQb8OIthu
 OARf1DMcTadHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FobgM1H/
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to mmc-utils
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
index b6df50b31d..3de63ea72f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1146,6 +1146,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/mali-driver/
 F:	package/minicom/
+F:	package/mmc-utils/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
 F:	package/rockchip-mali/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
