Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9422C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CFA882097;
	Tue,  8 Aug 2023 18:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CFA882097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMVNV0DkNUqc; Tue,  8 Aug 2023 18:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A575682083;
	Tue,  8 Aug 2023 18:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A575682083
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5DC91BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BD7361192
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD7361192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKtHKg_YoVsQ for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:10:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9245561191
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9245561191
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MVeMA-1qLpt6125k-00RX47; Tue, 08 Aug 2023 20:10:00 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:09:58 +0200
Message-ID: <20230808180959.28091-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y/48aWYiZlujzckq68gQ28pjVyslhyHZWF1DuzCLeLwtC5w3x8d
 yQUHyT6uy4Q3lQGo+2CQOjVCj4ngIdBKYBf4cyFsM78nScsY1/qo3mdsXi22Nz466x2lY4B
 fmTQ2SQG4GK9tb4aMFKQsCh+0To4HUXzt0DxIOlZCrID61/eb8Y2Vu1dgd6XsIkmUBGK61K
 g+egr5pH7+WzsXJiBYV0Q==
UI-OutboundReport: notjunk:1;M01:P0:ZQdTDSy3vUI=;wjPzYSaG5DGx+DE8SoDmzrl9Xaf
 6MED8DeChpVhm7CIRbI2aHRjTs9ocJXY7smnU4cdJmX4IOmeW5JRnuuAonPyGYTl5ammHcM1k
 0hIsnNdVAazjzud0jvcC4s91GielcvZojGm3E7cYF3HCV1ty7E/rRJpuEnqZTYMs5a3TOGh4M
 M4jMmgDnApUNh9sstDXZMs70z4GsKMkE5S+6B6vCF1Ai+zU3F+EbJlPkwuWjp5r1DaDVqR1kK
 uJp4Fl3c/ubLCxYPerNp0XGtVbgyMWMIl28PcEw1LewGgTGBnG5LyLzN2i4BvUtQYEn8l7nxi
 Cdzjt6rhoWJG9f7ZRfU/322vUunAInlfkv/OJLpW2mzHY+VwunFGC1UHs3NImy+gLRcFr0seq
 OOWgEU5HE7qT8bxKUUOOCYjV1adjZw28pKZ8WDsaxRnVaFa6Tt3B3/51B0Rd7xW9r5y8rIc21
 O83xPSrzyLSIWeNnoyWAcQE9tVLY64M6b9Ev9g7dQjWA1o4BpOo1tBNzZR5q3GNdR4mbaBsX0
 77Ke/g79YtumHQG7gpbua2Xg+A88RSqU+7Xoncd8kSSFn/znBWokD9XC9qobOp7oHpFJx4Ukv
 MJASGFQAmgdCEE2zqYGtTL3YcTQvKcKDSizG7IaeigL7ADe7Yt2llZhpSz5skh6q68D7qukpQ
 HfJiqq/IiW5l/G0/AKa2JV8dh44uZgsO/0Oiju4uYTpFHu2jMYkn4NX73HriTwBxi1lySeArY
 /MlnDRxpf1z6GDyKmY1yInnauoIha8RfDRiNKRF4uHLEwJhsWyLWnbNLeNYHMqVdrKqA6BF9o
 gCo6hYxct8AUCB+VkvkXinrTgrSZPewA11vxYxehuNr2ClZRwYf8AnCGNFNZpSqPue2DvfaSs
 b94o+t6I34gWQa2eV1fXi+qHhGbEcaZEls+v1pctMO99dt5MF69FBtZ/SkZ7bi+TjA3TgTtAF
 BmsJzeGs7lDfDhIBrj9brAAjlJg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691518200; x=1692123000; i=ps.report@gmx.net;
 bh=FwMAhFuRHUlhLPxXhAiP3GR7gQxz4RsPsfMDgvGG9EM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NSAh1zKTz4LZ1qC+a8lI9hiszyl4PGj74ebhSDORpYApJ0pDbcaCDJHyXBNerT3zPFvygLZ
 ycXw8Un70UH8nR5QvePFwdfTARP6otOk3gZujJrZl1koSqFhV8NqAyo+r+Tq1y9lLTuJfBmp/
 vkXZNhNvH7MWVu8e7t9SCbzbpusuoE9UqFIP10gnlfZLKTXQEYdWNLn5cJ0aEaQz7glTF9TGK
 Hc+5GGr7bqroK/TJ7AL1u/ABrNE/4byMQX0hU/JD1AjsaXPBv9Ho2k7+Dmr35er6gU0dFh3Lz
 Ag3+bCEnQ8mCv3IZImYAG8amVJWdNfQUZ0yEbKi0PLyDNAZwHf9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NSAh1zKT
Subject: [Buildroot] [PATCH v1] board/raspberrypi/config_4_64bit.txt: remove
 testing dtoverlay entries (vc4-kms-v3d-pi4, imx219)
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove private/testing dtoverlay entries (vc4-kms-v3d-pi4, imx219 and
commented out ov5647) wrongly introduced by commit 689b9ac439
("package/rpi-firmware: rework boot/config file handling") [1].

[1] https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/raspberrypi/config_4_64bit.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
index 41c7e97e99..4a77fb3f1b 100644
--- a/board/raspberrypi/config_4_64bit.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -28,9 +28,5 @@ dtoverlay=miniuart-bt
 # enable autoprobing of Bluetooth driver without need of hciattach/btattach
 dtoverlay=krnbt=on
 
-dtoverlay=vc4-kms-v3d-pi4
-dtoverlay=imx219
-#dtoverlay=ov5647
-
 # enable 64bits support
 arm_64bit=1
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
