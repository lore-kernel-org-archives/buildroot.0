Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03563C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 15:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F6F417AC;
	Mon, 15 Aug 2022 15:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F6F417AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5dEizvVMxuX; Mon, 15 Aug 2022 15:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3774179B;
	Mon, 15 Aug 2022 15:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3774179B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A48821BF3C9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CFC860FA8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 15:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFC860FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEhmHmfEv9Ii for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 15:48:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F93260F9E
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F93260F9E
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 15:48:58 +0000 (UTC)
Received: from localhost.localdomain ([151.34.232.41])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NcKloknb6TCpUNcKmowBpb; Mon, 15 Aug 2022 17:48:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 17:48:50 +0200
Message-Id: <20220815154854.17628-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHDB/JMXoIkEKRgU+qjqCa1kJfNP/6pfJu6fPtl3dwyOmEqfSEOTTL2JM6P93Emj5pa72xxsiWTu7wI+IkvbhTtakfn2YjA/HpAam7uYlct4PbXszm8E
 Z5H3t3Aqoka2t6BGWEp222ZoG4hpj4R2l1261HxdzHAwxx29mtNjqvAwcjqLdDLFYbFL/atzw5bRg6zx66TKI+Gf7IPqwewJQ0rDNfA8432FafkLn5ZBEwG7
 Fj84kkYLmf/+uEUobjcgYSd9En8/q9M86uBprTXYiMfccUxcuXH4WdXbxlGaosLH3PVlQFW1RMBcqQRMxgZbxfT7DQLun6oqpU1ynhvYIxsimGpvXnL//hCC
 H7LSpcujzBTRdMvd5TSK+/Xsb33p0//T7SKcBZEOc2SNivCCgnO0gqzH5vx0cuZuRvl7NSH9swOHLtyNoj9zSC6OTtA4Bg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660578537; bh=kb6q5S/dfvCEAPnJ1SSon3Fpo9Wj458mvGG2vSxhSwU=;
 h=From:To:Subject:Date:MIME-Version;
 b=C7IorY7TlX7RzJwOkzsm6D/qoXtnQDH4sc6XrZywTuhXEaUjpcoZNhfK1OtwDyG7j
 1FJtSmpy/jpLPG2OrCzor2vt8T+yxfdzYMwSlF1wbZkBE6Cq4A4NlgpK9ZYsVyLn+E
 zBdxnoL3kn8CE1R8xIDGq78JZ2+v4Oah6Gal+tcyCWI6uA6swO4bQEUo+PRStG6kmP
 3QGwXsIkDCgzyyW7MmbQ5Jtof1bP5pf/ZOfXMvn3flTP/z3fXR49z4r86zY3c6IEGK
 k8Ej2KI/p/YOYuSVWHIo9lgf//CtVR4JqvBnd3CTcDL8stEycZgKrbmSVOnDF/rk+J
 IJjZoxyHCW3AA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=C7IorY7T
Subject: [Buildroot] [PATCH 0/4] Revert wrong NEON/VFPV4 FPU strategy
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FPU strategy set to NEON+VFPV4 must be avoided by default.
Here[1] is a good explanation of the reason I report on
every commit log.

[1]: https://lists.buildroot.org/pipermail/buildroot/2022-January/634728.html

Giulio Benetti (4):
  Revert "configs/olimex_a33_olinuxino: use NEON+VFPv4 as FPU strategy"
  Revert "configs/olimex_a20_olinuxino_lime2: use NEON+VFPv4 as FPU
    strategy"
  Revert "configs/olimex_a20_olinuxino_lime: use NEON+VFPv4 as FPU
    strategy"
  Revert "configs/bananapi_m1: use NEON+VFPv4 as FPU strategy"

 configs/bananapi_m1_defconfig                | 1 -
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 -
 configs/olimex_a20_olinuxino_lime_defconfig  | 1 -
 configs/olimex_a33_olinuxino_defconfig       | 1 -
 4 files changed, 4 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
