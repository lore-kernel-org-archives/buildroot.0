Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F3FC35FF3
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 17:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDA281DE1;
	Mon, 17 Mar 2025 17:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eGfPH0te6Cz; Mon, 17 Mar 2025 17:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E83E81DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E83E81DFD;
	Mon, 17 Mar 2025 17:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F30916E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA02A81DF6
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd2UzMQj3wQK for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 17:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3D7481DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D7481DF9
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3D7481DF9
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:52:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 84FFD5832DE
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:40:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFF7644316;
 Mon, 17 Mar 2025 17:40:25 +0000 (UTC)
Date: Mon, 17 Mar 2025 18:40:22 +0100
Message-Id: <20250317-bootloaders-menuconfig-v1-0-8f893d3bcf5f@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIZe2GcC/x3MTQ5AMBBA4avIrDVpUX9XEQvawSR0pEUk4u4ay
 2/x3gMBPWGANnnA40WB2EWoNAGzDG5GQTYaMplpmatKjMzHyoNFH8SG7jTsJppFqQqd16Wxtqk
 hxrvHie5/3PXv+wGekcryaAAAAA==
X-Change-ID: 20250317-bootloaders-menuconfig-6145386cdd98
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Neal Frager <neal.frager@amd.com>, 
 Alistair Francis <alistair@alistair23.me>, Anand Gadiyar <gadiyar@ti.com>, 
 Bryan Brattlof <bb@ti.com>, Dick Olsson <hi@senzilla.io>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Lee Jones <lee.jones@linaro.org>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Simon Dawson <spdawson@gmail.com>, Xuanhao Shi <X15000177@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektedvtdfhhedvveeiveffheefffejvefgleekhfelueefveeiveefhfejtefgveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhisehsvghniihilhhlrgdrihhopdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgrgguihihrghrsehti
 hdrtghomhdprhgtphhtthhopegiudehtddttddujeejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1742233227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uzo2K5i/d+oHSUrkaG1O5e7tcNZsOhQf41dmNH5P3xg=;
 b=RVUXwtopaVrrL43vikELh5zSA6ovbsYQnE9g1j2idWM1CsCWGt9quZy6b3xT0F89Yk4Qen
 9E4qmStk0v7TG6bCk63/0gYGrc4/hc4ENyBC4bcmRTBYTGv2k0HWVe5/1Mh6nB+PhFWcB5
 FKBhLIl0AKTXrSha4FQE3ZF7oyAXlBjVaToECRxQxwgQbe1XJTkx5KcncYkKEZ+dj6/MQu
 /g+rqjgx+uMjedpbMSHhNkgUsTgJZWIAAA7M4nGhV/e06Pe7BaEEblyQRGSJz7vXMNkXVE
 3I/hS5X1g+lZAf7kSO8zTFJGptU5cTtn2tEwQlytZR0F8TsET0splnVUJuuBcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RVUXwtop
Subject: [Buildroot] [PATCH 0/2] boot: improve menuconfig visualization
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This small series makes the visualization of the "Bootloaders" menu in
menuconfig more visually intuitive.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      boot/xilinx-embeddedsw: fix menuconfig visualization
      boot: move package options to a submenu

 boot/afboot-stm32/Config.in         | 2 +-
 boot/arm-trusted-firmware/Config.in | 2 +-
 boot/at91bootstrap3/Config.in       | 2 +-
 boot/barebox/Config.in              | 2 +-
 boot/boot-wrapper-aarch64/Config.in | 2 +-
 boot/grub2/Config.in                | 2 +-
 boot/mxs-bootlets/Config.in         | 2 +-
 boot/opensbi/Config.in              | 2 +-
 boot/optee-os/Config.in             | 2 +-
 boot/syslinux/Config.in             | 2 +-
 boot/ti-k3-r5-loader/Config.in      | 2 +-
 boot/uboot/Config.in                | 2 +-
 boot/xilinx-embeddedsw/Config.in    | 8 ++++----
 boot/xilinx-prebuilt/Config.in      | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)
---
base-commit: 873407b46c2b6b9e154be97bfdec61c9c8349229
change-id: 20250317-bootloaders-menuconfig-6145386cdd98

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
