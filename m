Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B386D40301;
	Sun,  6 Feb 2022 20:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mB88onV4HTeR; Sun,  6 Feb 2022 20:14:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC1E402F6;
	Sun,  6 Feb 2022 20:14:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB6941BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8698813F4
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ui5sRsKPPYHx for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp1.osuosl.org (Postfix) with ESMTP id E18E8814B6
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn3nXOBP; Sun, 06 Feb 2022 21:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177941; bh=XnTSk46aZBXRwvFbHEWIppdfQCFVhoDovvUU/4DIW+8=;
 h=From:To:Subject:Date:MIME-Version;
 b=SFxfyk0RfNoXo5ioT25kpSXcB2j4JzVi+FgDPUm0274dMyaSkIRcbVJVVJAu4dW1t
 MjfAOQuxOH0mBgN4LSBlTVYRxXE/pwA4fUM0yE/goV/4Q6jgvohzU0O0YEwpei/6AX
 4R36qvmS3aPgh8DdSPC24RWfVqUQDvDF9Dr/MH8C7zg8NJZnHi5ubqgpnzoqJKnOjV
 BxzqUJ3sc14OMpe1Cl7hFkOy3rwPm7SapimDUjKOqL3sW3p1YjZQpnWvklmvxH7r0T
 4A8tFfEdxMzyV1c3UD8ftY9NTc39S1gNpK7Q3wAJYKU1x6x20aGrRs92E+asQH9xxl
 KIOMMOiTOsbXg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:31 +0100
Message-Id: <20220206200532.2758493-16-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH 15/16]
 board/sifive/hifive-unleashed/genimage_sdcard: add comments to particular
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
 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index b8bd787488..47e59a90d7 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -6,12 +6,14 @@ image sdcard.img {
 	partition u-boot-spl {
 		image = "u-boot-spl.bin"
 		offset = 17K
+		# ZSBL only loads from this type of partition type uuid
 		partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
 	}
 
 	partition u-boot {
 		image = "u-boot.itb"
 		offset = 1041K
+		# U-Boot expects exactly this partition type uuid
 		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
 	}
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
