Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998E0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3451404CD;
	Sun, 23 Jan 2022 10:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cD8zElHJ19a7; Sun, 23 Jan 2022 10:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08B8B404BF;
	Sun, 23 Jan 2022 10:39:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D91901BF47D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C71A281842
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KCIZY7ZppZF6 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:39:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C7881490
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:39:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BaHMnKRmdX0z7BaHMnVzbn; Sun, 23 Jan 2022 11:39:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642934364; bh=a5MMfPJyaySz1PCpHiuvKi0kJE9DSRw1QskK81BPTDI=;
 h=From:To:Subject:Date:MIME-Version;
 b=SxqhdxDZrUDVPUmC14pI2x/IkA6OXn7E7Sn68m3/nGayJWjMoRVxP4Q6f4tBOq5hE
 3VqRz8OHMvmeajV9nZgAZ4lFD1DPyZmV7ZLmvIKzG2G0urs65O8VYg9GBK3Vpmz8hQ
 yfCHexsVslxNmmQX+91kHVd/2rI7LjibcDI2bssDtEfsMnRrORPmkNZpignAQ0XQh9
 yMvx+uuaTrSuk/DDbM60cH0m4WtCkWSbn8p0O7IQBoDiqVMK8I/UdBcJTehZP8Pb94
 l9RaY6kteDivLoXLgovRzdIwVBEN+39G4X2vmKQ4dA3aM2VNaI/hwUDApBnoCsCY2N
 35jU1Ng/ZrWAA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 11:39:22 +0100
Message-Id: <20220123103922.1928118-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP259YlCMAVitVAXGCXrGM0dGSCDjywqyxE9IhIAwLC25DGgWu5v4Wf+2WtD+uEcctVTcqLwVtmbwtszvThzDEOOZARgWq1T8P0wFDevrTEUJ+D1UbN7
 sYc0Iw5bGm2Ys3EglewSqsYd3TJ+ixdjkjlcgKWLrExeFosPXYjmqN3sjSAQmD67LmAKH8CqnIwvPuNtUnX2RhYdb3xOc/nF//O3eq1ItI6wOg94K62TpEpE
 kxbqgOh5RtMDdU3R4OCJXVONFu79RGKcmbekx3i1/FisseLvJPtxnhRn+1yy9b/kg2i0E5/2zAcsVIrTT5q5L9d/XzQNKUQIUsXWO6GlGmo=
Subject: [Buildroot] [PATCH] board/orangepi/orangepi-rk3399/extlinux.conf:
 fix label name
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
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RK3399_ROCKPRO64 has been picked from pine64/rockpro64 but here we deal
with orangepi-rk3399, so let's change the label to RK3399_ORANGEPI.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-rk3399/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-rk3399/extlinux.conf b/board/orangepi/orangepi-rk3399/extlinux.conf
index 5109625160..157c6a715e 100644
--- a/board/orangepi/orangepi-rk3399/extlinux.conf
+++ b/board/orangepi/orangepi-rk3399/extlinux.conf
@@ -1,4 +1,4 @@
-label RK3399_ROCKPRO64 linux
+label RK3399_ORANGEPI linux
   kernel /Image
   devicetree /rk3399-orangepi.dtb
   append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw rootwait
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
