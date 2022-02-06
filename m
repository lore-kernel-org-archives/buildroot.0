Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DBCC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFF960B1C;
	Sun,  6 Feb 2022 20:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4j6y4KHuGgi0; Sun,  6 Feb 2022 20:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3BB60B04;
	Sun,  6 Feb 2022 20:05:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66D621BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 628EE401C2
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bYCklNQG6Pk for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 260FF400C4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmxnXO7D; Sun, 06 Feb 2022 21:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177936; bh=ZNvSJCaPgLzMtWDPS6u7k/bG100IUlP08fr9UBn3Nvc=;
 h=From:To:Subject:Date:MIME-Version;
 b=FV4DaoVJuoN54gystODjGqWQOQaJoDRQh1sXsdQVgLTHb70ZT9SaCARL0rBsrZVjL
 NBPTj/ICDASw6Z3+zOWtCXMHHcdqIi6JQfSC0sZhgqOQy7G9WEmn8Qw18/M/P+KQtz
 AhTDO/sHLb1JZOMxiLO/t0eJFzm452wSMEtbuF/vpEbofco7TAwxqyogTTiUrU/bXC
 bJKxlNMH81XhsgMouW57Q2aiy0a1GLcsMpj8/Zh2eO5f3ZCR4SEdeoQ4B8W1oQ//G3
 DQRwPJ4g8KQ+/OXgtFgcpJHc0Yrm6421IwGJdjruZWYZMGO/3kySmbg+Bci9OM/zc7
 xqlLMQshoGWsg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:18 +0100
Message-Id: <20220206200532.2758493-3-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH 02/16] board/beaglev/genimage-efi: convert
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
 board/beaglev/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beaglev/genimage.cfg b/board/beaglev/genimage.cfg
index deefdbc110..54f9118ea9 100644
--- a/board/beaglev/genimage.cfg
+++ b/board/beaglev/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
+		partition-type-uuid = L
 		partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
 		bootable = "true"
 		image = "rootfs.ext4"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
