Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751B7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF17402B7;
	Sun,  6 Feb 2022 20:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NGgMZQ0KZMn; Sun,  6 Feb 2022 20:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C7D44028D;
	Sun,  6 Feb 2022 20:06:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F5A1BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0414C401D6
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XV634tzaplXX for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D0D740186
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmynXO7a; Sun, 06 Feb 2022 21:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177936; bh=r6gwAYFbkJhP0mdbDOgB6MBlTNgi4m3kf5TQ1iwLn+Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=HlXt8W5KNqDWsbmMx7dSmENpP1u5A/2ESJbdS6AvhWC16nxGNcHMULG5IyWMfBttM
 msEPAp5VtMWzQbcJixGfkulYTVhJht6l2B53sNweR5c03Mujf1KgpyC3Dkhr8+9whF
 QMxhJCmjTFvvpfRCATRVK7u0Wf7XEz+T5FuwF3inqlAGkyemxRnBnr1lGZLS6mlL/i
 Ewi88kY4neoauFTm1THTrh5Gd5o4jHp23+4141d4pfpXPNa8+d+SEC3SD8Jo32DX6I
 zC583RJjW8Pq0ESIEmgO5ar6sTlOhrBdZA3fxWCkg5LHkpiY85NDzABANea8aAyrrp
 pYxJ7vUBi1KdQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:19 +0100
Message-Id: <20220206200532.2758493-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB3Upf2zi35+oH25euDDxMegtZZp+my+IMaOOqr4XpS8Vl+DIN02Zwz9rakzG0sK2pptMmdemsB9450XM7T8MOxRmxbWOq1nD5erkNrCvpGSWf2qcZya
 ZuBJVrlfxud4rp7cM9DwYOvdK0UOjzS4JdNOHdb4lzA4zJU8NAtcHAbdAfGUbhxGGRbebF6shBtN+STBOBNK09iIiWSkKqK8L41RHL7DVHjRxGJPix1ZosJm
 yHvCLJd67GJyI4o91r+0F38LHTMRWcbdWTN+ab1kFo/9SG4eUcTdVm9cYxrFsth/hot00UouSMu6g6fakUuBY/PIBIULIhsaDkqFsDm2hHXfgm1Atk1CFtky
 rdjAzyNKKf9qA0vkRUnGnDg9x8IF26g0D6AY9MSK0I5Vdfr8oDK8VsTXtVNIV0FYtCZjcsDXzbSva8mKJ3pSpLOq8kUowMhcEK/Z2wI8Ymf8YaTDISCjrkFt
 Az/DsFHz+CBSN1gsB8ibnEaIj8Cv0pQcUKyvHRPG094pyijB836FXc2lj6dnG+aWCounSb6A7ZvNdp0qrI69OsWrm9RapA8cslAgr68JDaa5B3v1IPzsguNs
 AxxGKdlanysQCus/mUE5/k9q
Subject: [Buildroot] [PATCH 03/16] board/friendlyarm/nanopc-t4/genimage:
 convert partition-type-uuid to single letter notation
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
 board/friendlyarm/nanopc-t4/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
index 98dc2f3892..272037c9f7 100644
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
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
