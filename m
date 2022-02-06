Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3D2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A433812EE;
	Sun,  6 Feb 2022 20:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wABx3NZzhA4g; Sun,  6 Feb 2022 20:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7C180C26;
	Sun,  6 Feb 2022 20:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6DD1BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19F35818A1
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5hvGoHpDVYj for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp1.osuosl.org (Postfix) with ESMTP id 510F6813F4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn2nXOB7; Sun, 06 Feb 2022 21:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177941; bh=DZV4PwEaHcHH8f+CGUuc9zgiWAAWbAkPWK//gnqI3Ac=;
 h=From:To:Subject:Date:MIME-Version;
 b=V46Pr5osawEdoBwPH363m9jjDjcq1TBcpxDttWvfpEoaJaiBD+YFM/mNdamTeIhH8
 5jlDzkGm/+mtI4vbqsgBZjNa1O5fVyPBh9v40xOu6C31cmj0SV1XffPngnMdGd/Q0j
 zDp2Op/CIZtnBKLXoev4gBNCEnVtLN2SbbNfJN63O9v8iu+WkzNcf3BS/usfNOOTB0
 g47gxCaz/kRfYf7S/bURjBLWTiDLp3xe+NdpCl9yWFICrDiSMA9idf6LUpDy/R2Zo6
 qXr2I7KDKVw2J4ToklcsWoBFdxgcVNFLa+9jbbDSgOo55PvkAWlfEz+ja5JzxYEDaB
 8l9F7TvJA/lrg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:30 +0100
Message-Id: <20220206200532.2758493-15-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMFd9eGOTLiOTMu7UKX34DgbwBq2rnAv3vHzdMj7pUEI6Fby0vA8VLM3EvHA+7ZF24TtmiyezfCiA4hNkakyQmFdXEleZ5E990Z6XdB4HzJJ6uYmH66e
 uCw8KbFmn+QKiDa06syPknmjVVIR2AjJGumh4cTeNS7E6LsrX53GT8sPFbNC0LCst/kMQGfLMtkmXynlvVs9ahYrGRuHCNmcdJbxp17ly48ooXvrr+0jljnr
 U4U7A4nv4jW2q2vtPO5gn64ACwwvpFpYHYi5T6ztxn1ZJvl3TcwwaSx7STDW4NB275+ovLRY/eRJdMPcMPSlXhnFo93szwKE8xCalkSIow+y+uqKihAXO+jn
 bk/240PwRMbjOaY7KRWA0npT/diKKXxu8AB+lLtV864/MXC+MEBEhIOPSJ2uT1+3yz2oeYRK4DI4wWwYzTA1I+NDwArhPhTuWWSYloGlYSDOeZRdd6+MR4KV
 gIP8OEb+KRsp20qPQ/ymY9en7vs5YFU29X9vAL/DBHB/VD10y/2RYr4QAIz1ZYTTs7q9lUeDX2y+/h1r86sc9PIb7+IZeVgG4Byjfihx/NKuyhRfqyy3zJU6
 tjhtwQ5HNw9OYgRWZE5U4v/r
Subject: [Buildroot] [PATCH 14/16]
 board/sifive/hifive-unleashed/genimage_sdcard: convert partition-type-uuid
 to single letter notation
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
 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index e66f221d73..b8bd787488 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -17,7 +17,7 @@ image sdcard.img {
 
 	partition rootfs {
 		image = "rootfs.ext4"
-		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		partition-type-uuid = L
 		bootable = true
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
