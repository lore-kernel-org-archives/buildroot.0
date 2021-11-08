Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3CBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:19:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AAC6128B
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8AAC6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CAF80D66;
	Mon,  8 Nov 2021 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGqvMs_dPeXf; Mon,  8 Nov 2021 20:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F121880D3C;
	Mon,  8 Nov 2021 20:19:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C93101BF3EF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C534E606E7
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWDkkLmv8OcG for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 20:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CD3960638
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636402781;
 bh=INV2UeFSszeG/4R2YjdQWJuhT3liA8PTvHbpY2kVGfI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Nk1I8zYQXoyQW4z6ueCL2APHyWoyRSKFh5AU6uW53jdfFrPO3NCGtp6NYG5kvIjm/
 GZSNHK7JoDheBl3TAVnR1MBOiY2nJS0q9T7X+1Uw9saNZ0WOEjY9jktzi/HNgOWvjD
 +CodvBvj/zHe82D5BowWxGGl2Qokw+zfnCzVozDs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.202]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MiacR-1mGd7T3on9-00fm6x; Mon, 08 Nov 2021 21:19:41 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 21:19:40 +0100
Message-Id: <20211108201940.17754-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:EThlAriw72GKv2RktSO0490BkzHuxrtzHHyX2ILi0kWcoQfElsY
 bqTCliQK/xsom4vcoNTc/hFEVzJYbVZK7A3NjvIfWHSo6GNSAbSQPc32ZlTWrDiv55U+DJb
 cB0qOLEOZHtknaCqO7KtNmxyIEwgc71mDZjxQoj8zFcKGICUuX1uWPvRjYrFhp1M08OjWMN
 AYcjPgm4tPUhrvQtAUQ3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sfohyn9bVk4=:q0GrLyJ5lV/YHTwDD6oZ8x
 PF+yrs4ghvNvdq9zDp9EI1pLjYuA+e8F/sFQQMNtLF8yRQ4tMQAPV/AoIlD5TI4/Y517tgYBa
 z9z0XZymw5IdGdCOihbx73Kdh4IeIV4NoaqWjq3hVXQtb4HMIGoEVuHM7D8d0iZBf/XWi/x/u
 pMoWwRDoZzMwod0tIxrU/PkKjUNtJpyCr15sMfXrzg2v5d9YArENF7iLrihab1G7aA3KHxMEX
 cZ55myXzmVbTzmPqkehx+pbbhdYigusTbA0u9tmRMc1hQ7GP0xHYoCaSx0PH8YvB3HEX1fpEY
 KvCWi0gM3wBS3aTLimqH5rPB38ANOKdf2XERUEz0XiHX1woAqz/bSM/5KYxSl0dAPWgJxBECn
 JRpF9juTAs4YnRj3FHv4a30xJGUF7+913F61zrMWDInveyY8G2ZLMAb+AmBbzL5MT5lsHLiLS
 5mJjvwHnIvhLLgLuW/n1eQH2uyCmLb9fyPfKDc2rrBj3AgQ32CUZofa1AQtCgBwtLNVvVLF6A
 rkUfk362bMt6o6CoGPry9f5/J4+iNbymoKGX3byH9AoNIYngGHceervkl17oCvTElwzmTkAhG
 9P1k+rwuzD8SZioOLXPkD7EOr5/WBQUTtsrs9+mg3SdXOi6kzaIjBZ9I/lgpn1mlS03IujRzy
 NEsKEZ0Ygy6ZQP3Yi1W5q3WhkP1SQEwO1LqCUVD1wYQp9AetjeUDMwRwYYQFpxqHx69iLENwa
 lh8K0h+3ZaNGdBTL/H5aAUyoU24yfNcBEgF9WusKeI/nMmQZhDueUlG+Ib8U1GiElzsZscJPS
 WGytTxOIaFSPqlKv10rTSFP9JzG2UpMVxSlIZZVwxMUb3vKxuzjoV6QPb8Ybw1ClPYm4oDvgb
 pF+oqlijQ5+GFMttKsdf53Ng4db0nGDFHI/0sy1KBubSii72DxFkUTHI4M38EHbiOFmzDeDzR
 V59z6d7AVmblVjElIy9W9c1b9vBkmCNgWlaQETU8cFiVrg0C38PnMj5Ls4u+FH1OJL/Xd2xIp
 G8P8IHRXoE1BMWJWqwi18vt7BlkOoci6AGt6D+PrEnGjO0nrK3heoxJH8er7FzqAxA3TC2jf9
 Aji5nvWFsMO/nQ=
Subject: [Buildroot] [PATCH v1] package/iproute2: bump version to 5.15.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lore.kernel.org/all/20211101164705.6f4f2e41@hermes.local

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 2837edb09d..d8d619cbda 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4  iproute2-5.14.0.tar.xz
+sha256  38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff  iproute2-5.15.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index fdf442a429..4162e38eb7 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.14.0
+IPROUTE2_VERSION = 5.15.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
