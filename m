Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BF0C0219B
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A2742C27;
	Fri,  7 Feb 2025 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DM14wE-oj4T; Fri,  7 Feb 2025 17:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9FA84296F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FA84296F;
	Fri,  7 Feb 2025 17:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 510D71B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CB5E812E8
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uhgk0nX9fi4D for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A89881021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A89881021
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A89881021
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1tQyBz277D-013b0w; Fri, 07
 Feb 2025 18:15:08 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Fri,  7 Feb 2025 18:14:55 +0100
Message-ID: <20250207171458.1127620-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:HGSWl+IROEyczfYwibDHT3RT6SvvnzeJuD3UBto209kpDaRuSsT
 GmiOGyUIA/+r+Q7C9rAPjdfk0zWRUtyj88UE5NDoDaNhERCiv74cP56CYSt26pwx4Q96Jbp
 gazOVLnxgzP2fE5gxjUMqXkm4aOCmOGOfR5HxeAdf8bnIMb0l2jGTr2fqY/d9wZMHpagY+w
 sKCcQsnsWfsQuVwjoXfLQ==
UI-OutboundReport: notjunk:1;M01:P0:hMoaeQuN3Wg=;IANlo/Qr8nbi/AuxLjCvzwXt3J8
 diqnDyjIfg9chMG2tUlY7eeAcRYIJO00tP/DKM48fWMpihdQqw1cPQXJkrJvieKSQsHyq4Hdw
 U5Gmal+ZqyRhuRbjmM3oUFseB5s2V4G8U5+nBGAvzBRvPQxw9pYLS7F5DKGD5s6hUh1NyMg7T
 vPTi/mv4UuEtzRwGuluZ52BHF8ETqNDEGqDRO2QuymtfkMSaMMF96U1Zxq3k9eNNnghZApU8W
 Uz8gQ/tYB7c3V1ZKS4XLLzdWyP/1kr7XfomdauXlZRoqcBBiHzFsrN6DjOuU9yAbLgDdZ6b43
 S4nq8JDqWx7ycLAA2WrYMM1n4u6XvgnoklMdWjCS4nFg7sj1LoZc67LDypt0WsvBd+IQMQO0H
 RiMeE0qUJ2ywO4ugjr7pw2emiDwcBbvdzwgkzI+rWIvUSg8fGbYsF0V5dn+X/Vq89Oh+lyfS+
 uUEnB11KjiUawl/iIn5mCBio3ob6xXY0762kvr+qkTUGUwmVbKoiFlzDBCdLoObCXm7gb+WQd
 2crHGkNgun3mcGDiZZl3jP/Q/mCxOY2SuYYAaRcVV839VR6rwHNDewzFt1b2U7Gwy5HrmZd1t
 aOSerPrUGr+PlWenQVAgwRj9EKo+yY31hRBVyX5usdTtRkCOlVj/KtDn5dXicBZ/1I2PwwMVL
 ZFM+Lh78bbdbqXcbJQcrxfHDwXLB2E/L0bsqtesEpu3rMF4WxH5bpqAxZY3nexUu15ZOq7LLc
 mjta1LONZWh6+sO/qWkMwH+hW3qQhH+a4Yu+qveYNJB8372NgnrC7fH9EVNHttjhNT1uhCnan
 T7NdN9wwdRLKLMl+a81ARLDZawpE+0JwFjycib/kZg1ez3dNfM1OJdwBBRjMuxEJicGSWj4Vo
 o4sSZjRDsK1BckenM14e0xkle/A/xOGjJr/9kjMFPbY6QyO/QRpGSR7PPN9B1pdC3e1w2U9ql
 JP1ByIZxc9iIPm5jHJrQEl2BAGo4+bDXmRQvBdsfHnxJgB4INrBS+0lN9NNAPRsIh56TyyzyG
 KcwsMqhXYWsrgG9RL/E8UXr4Mz1wDXjKj8j9rbRYhCfJJ4bEICRHqCpCgSeHVD0+hMWefwLbN
 vHFdZxQqAhOrkp2AEB32pGcpzeH+oW2WEMf3FA4yS8TWsZsk3U6ERtzGBwV9b3/PCxzfllIJh
 13hZgSdYr7StW2PvzhB/j+xJBkGRjaiEkr5dkA5FtOVx/la0nYIiUW67Q0huD1deHFSxUf9ox
 DE6RVdtg0Z7L2cM9Xi0Z3cPGVQ6l3/S530IKEaoa9oqKR3MCg4xWyMnWmpx18QxNZ8XE8mD+d
 fJKK3v0yWakffqgwE5+DFl7qKMws2vioofgG1g2ZImq3eTStO/hyaeqCFaW8h8c3mLXzaACwX
 IazI8oazHFFKbSxTjJTl6MuuCziO5wJVuPBFwCx0Z0qfeCh0w5BTi4Y8nA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738948508; x=1739553308; i=fiona.klute@gmx.de;
 bh=4JcLNNKPOfNsM0Inwx5AjyRBGKeFK6thTb2kgDK14kM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=svyR4PgobyskdJIp7go3PflVXguxUFgmyEfKzDNfpmC0R/t+OoEfz9qYg+FlmD0P
 6jpQUOViWFX7Ex/WiFRh73rm2vw8Zaaf47EJUN/fl4PhxX905bLYlVt4ZDo0n0TRN
 kdniIno3z5M2+Pt1lHFKsRDPmmRL9E2ZH5H83rcvtS4JvWkmeRefMMF/lE84z8hsw
 WAP90B4Hfjcb6aCX94Qd2N30PFFP/ILfkFmSIsJ57jt/13ZycCaMbmZ49VY830lKR
 3vuRk6eFVQ50rdzb+YfxNoKbGuh5k8enjRhJZ0Dy8R35hnjdyZaLwFzs0Wt8BvLlM
 0/kKFmUpy7foMYx6gQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=svyR4Pgo
Subject: [Buildroot] [PATCH v3 0/3] U-Boot on RPi boards
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

I'm working on a system that needs U-Boot to manage booting on an
RPi-based board. These first two patches make working with this setup
easier, the third adds a defconfig to demonstrate a minimal bootable
U-Boot setup.

Fiona Klute (WIWA) (3):
  board/raspberrypi: Support boot.scr for U-Boot
  board/raspberrypi: allow non-matching globs for DTBs
  configs/raspberrypicm4io_64_uboot_defconfig: new defconfig

 board/raspberrypi/boot.scr.in                 | 18 +++++++++
 .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++++++
 board/raspberrypi/post-image.sh               |  8 ++++
 board/raspberrypi/readme.txt                  |  4 ++
 configs/raspberrypicm4io_64_uboot_defconfig   | 40 +++++++++++++++++++
 5 files changed, 93 insertions(+)
 create mode 100644 board/raspberrypi/boot.scr.in
 create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
 create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig

-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
