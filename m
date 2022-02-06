Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE15BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91E628190B;
	Sun,  6 Feb 2022 20:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6QjzvRMIIUD; Sun,  6 Feb 2022 20:13:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67CA81A29;
	Sun,  6 Feb 2022 20:13:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23DE01BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B9760B04
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znfqXL8bfkeL for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43476607D1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn1nXO9v; Sun, 06 Feb 2022 21:05:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177939; bh=wNWrF5qOmv4DbOaQSC5n+7HZp5WFcEIJfG5TWpIP++Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=OdTc7strCKbP3m2Wij2bIxFMBSTBINcB/u6ecwvwgsBGMCYbvtPs2FZStYXO+mreq
 7pqOFtle5NnDzEq/xntWDj6+4vTSwMgbXAmDc702+HbNfthgnL6JcW79JJvp3ZZJY/
 0Jcjs+9Ebbf5K5azwt52a/i1oomtdUWmCGtMRuzj8KI8CVNYgoD+ceKos7VDy/jw5C
 zdj96AMYD4ia0nsmdY2k62xsiGxGiAiDM1Y9te9vGZd/DeZIABBWwFriZgCPNgkXUp
 ZnVGAqc4WCNnrVkPUVD9ElekFHaokzDD1H1eSItJhDBQemGyiFfC9mqmDdwvB8wo/t
 E4en0OWnWwoNQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:26 +0100
Message-Id: <20220206200532.2758493-11-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOMFAeP/6r4YMoph//JpOD0vr4YIHpIZPI2NPS1vTCDC3M2/tsbYOhSG3io+NUcfv332xDNtQZS4xYAsZzItgjuEUjDREZyowfCr3eoie/Q+zwSQK1tJ
 73zK8hLarKaSZaXx94xx1/nY1NSdgyZVVF+STOyCcFpnOlGjwjn/6H0keVmsEASi51tW5Ib3NyGsukrThwJ5c82WcNpNUulqrIraEfNQ71z4dLcvquYUIB0n
 O8jph+EIi/eZfjRYFrQyaYqJ80wymzp4/zVwly1CmOKeJVzNhmAcKKowXcefUksIsPfJehdtJD8C2qTPrzA2ZbO8n89J3XcumCjctvC7yzuUjR3CjTGUqoKq
 20TKbZ/e24OUgqhiynj1aRiLv9ooQDajKZAVCSifuvT6rYp7CZCpPg/IA0csvammrEN+OW2GL1o2YktXlu+vHEqc/tj5mw6TzOx/D3R6jvyjKxZJS9GqnSnw
 w5/+dzTYiVpPl9oGwlWlyayS2Sfd1ejtj8tnpJkYJA9eF52Uw4T5DvxfACFyIZlxNGIGc5I/BW5sd2CNouUNnM2/NAYZHZVPO/UCga5+LuqD3EH7cYHXIwEO
 rNz3IkIje6E8sPCI8MRaZY7I
Subject: [Buildroot] [PATCH 10/16] board/qemu/aarch64-sbsa/genimage: convert
 partition-type-uuid to single letter notation
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
 board/qemu/aarch64-sbsa/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index bdf8a89d75..629f4e07b7 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -19,13 +19,13 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = L
 		image = "rootfs.ext2"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
