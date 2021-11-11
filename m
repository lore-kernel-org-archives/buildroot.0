Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F6EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D47A61264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D47A61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E597C405AE;
	Thu, 11 Nov 2021 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHbGdzEABgY1; Thu, 11 Nov 2021 20:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7D64059A;
	Thu, 11 Nov 2021 20:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D65DB1BF44A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7C54045C
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fl4pbTcgDcy for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AEAB40226
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661082;
 bh=V5qTwBHRAFlkZJW9385rbYij7r/d0BVJz5oDyLh0gOk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bJKTIptCjw2gOvCIQ4cNU3k9zEwRZ2+cO56L95gUaBCd4cKuSBoqvK2JGfiKu2xSP
 5KcKE1KkvQ8JCKrHt8fBoVLrA5kIA1nfE/o3WUtXxOmBMjHUy4PHMmMqRKo0XmYnN2
 3LcbRlaDOwfyt0D+K+m3DYhrf/Ak5fBBTr+0UP+A=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1mv7940E4C-00Gcrz; Thu, 11
 Nov 2021 21:04:42 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:38 +0100
Message-Id: <20211111200439.15379-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZX1NvW2Des5S8YOs5vlH2YEZM95N1xuUpkueDqKYv7w/zG8oWmv
 PyxrMq4c9wuzJUHndiU4rSIlTjXWjPIqlqnQaq14Xhdr0HC7Ix9uqH9cwD6+ABMbjBNb8VZ
 Ng3471FOrUMUHeRMo3Ok1htkrFR2WEBwMMIiD80srYnMdJ4Fq8+/rHRY6v7KSQurSBpsh6f
 V4pu36z30i5fRTG5WKlBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0OKvsnfy2UA=:A2PdS+knIHvHZ+ibvTfr53
 BjYkjQROBH7YM0pKcaEkdtU6U1pUxZOjdaGe8P5VsPZJMONcme0/uCwcFPh03hT0gNd2g0+Wm
 rtHhdSp/g0oM/H/aAuMJXUaXFVWVh9XWSfFrbhtCHI3HA7XQvI/kSa6wZBbnNXtDw3WFmjN1t
 gruVJ74AKm61BUqJdqj+d04RNSarGzz/Mru6lOi0oVF8deEpMhOvaPSPNYnI/d0sz7IZp2JBX
 ZxtuF9aFbUpQkBXbuloXCdJRIC4wqprgtd3f22pyP1zfkn0c0RkMF2scgcDilgZEVCQwgIiCu
 DQtZ13BNYLpqLydA++q+ngY4ztacmhQzxA9U5rWqaeQVz5YloPsnYiXCS7yFzecdKXDmCDar2
 qKvz5i8+bzKRXMEofSDrkDcCILRnlmi/NwWbadspOkkPJxy6bBshDSQ+EsFVWt7CVNEAgQCS0
 0+7gI/PgUuDbKTLkhCYdNZqhKrc+lu2qv+LNQhzPqJuopE8xZ5rwY3a4JPD+ieJyLQeBC3j/5
 bYDeDL5UEUygkEIvcWL9lG2c2C4tq19VfEi1l/Of3nXlcy+wcU2f3EIWBBH8HyHKGsm1NUZi0
 /mJW+qm7bbIBN3sPxC5KJFNrAczQiTjaPi13GdjpU/2FaHd3B9L5S4joPDBthVBp6aM94ZzpD
 NHUf5Z/IlDI2HIH84pgtJb8tqBCiODp13lQO49MQoGQi18HaW/QhPPqRN89CbwFXETSiebxAi
 a0j+e/QQkT5bOqknBoKVHNJIX9dsWYUFfQySACrMJmgNqrZ1CSLBbGfOYewR95qaanOPO+rly
 Y9+E/ZdwoBrd2rCtElgVRyWMj+G8nq0eLpAMmPNkptn94vaCb4lD1xIOW2q/KaKjE+C/MNlpS
 4wC2pusl/lCDwO0BRa1bQAFNFTh40rNVnmeFbrTvV8gxtMdKeJ2igDNrhV3VvIE/7rvQJIeQb
 XGXlbWEepTGstJnGmErVOzliHcsip3LVV8La29XzoYJoExwjLubSdZg12r/APGXeWYNxj09bG
 oIGJhCp3OTR++uTf9xwy8KRwKvD9HPltN8OMim9PUDIxxlkbwqu+4x60dKEdhIYQrpPFUiZSJ
 iIaeZAMgDimav0=
Subject: [Buildroot] [PATCH/next v1 6/7] board/raspberrypi/readme.txt: add
 missing dtb files
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add missing dtb files:
 - bcm2708-rpi-cm.dtb from genimage-raspberrypi.cfg
 - bcm2708-rpi-zero.dtb from genimage-raspberrypi0.cfg:
 - bcm2708-rpi-zero-w.dtb from genimage-raspberrypi0w.cfg
 - bcm2710-rpi-cm3.dtb from genimage-raspberrypi3.cfg
 - bcm2837-rpi-3-b.dtb from genimage-raspberrypi3-64.cfg

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/raspberrypi/readme.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 98c44d80a1..d20096b5e6 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -76,11 +76,16 @@ After building, you should obtain this tree:
     output/images/
     +-- bcm2708-rpi-b.dtb           [1]
     +-- bcm2708-rpi-b-plus.dtb      [1]
+    +-- bcm2708-rpi-cm.dtb          [1]
+    +-- bcm2708-rpi-zero.dtb        [1]
+    +-- bcm2708-rpi-zero-w.dtb      [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
+    +-- bcm2710-rpi-cm3.dtb         [1]
     +-- bcm2711-rpi-4-b.dtb         [1]
     +-- bcm2711-rpi-cm4.dtb         [1]
+    +-- bcm2837-rpi-3-b.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
