Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDA8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769D680BAA;
	Sun,  6 Feb 2022 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ql9_pyytGTPr; Sun,  6 Feb 2022 20:13:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B946D812DE;
	Sun,  6 Feb 2022 20:13:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1E91BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57684402B9
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRcp5aHf49Pj for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:40 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885894029F
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn1nXOAD; Sun, 06 Feb 2022 21:05:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177939; bh=l2TTZwvrV1MNAR0yavARhInq7pbMZSC+xyEK9DgLnTE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Q2RSPQaPI66ED8jnq62H5FW+jxCjtXVy2BZplXTROsdFeAbp1sydpO0O2R8GTnM+j
 aptNh+rgSZajgjAq4XdP91kyOsbdhX0Oor6eMcibhts4DM92tXcjBN3/OHBFZ3RDkk
 fYMqpcQgToOpJ0bXgYslOcbInOSqqGtegYYVN+0XJvkfH2E+D64ZxwN3mNDAuOTi+O
 UXtLy8HQcNPJxrecc7tl1xDB8s0jUT+DsrAmH4c2kwgqj09v/gYUsyQuyH5oTKo+Gk
 KX2SeuisH1Fdl4+Ik4lFn272vzZ2N5JbuV+EhXpg4OGT5b3LHr68LZi+reFlcodiNV
 DORt4arAMIs9w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:27 +0100
Message-Id: <20220206200532.2758493-12-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH 11/16] board/radxa/rockpi-n4/genimage: convert
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
 board/radxa/rockpi-4/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-4/genimage.cfg b/board/radxa/rockpi-4/genimage.cfg
index 68cc4d61a8..3c3bd8b7fc 100644
--- a/board/radxa/rockpi-4/genimage.cfg
+++ b/board/radxa/rockpi-4/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
