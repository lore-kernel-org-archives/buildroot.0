Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD34DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:19:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A822461371
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 12:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A822461371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=blach.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C4360783;
	Wed, 20 Oct 2021 12:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxfePNw-wm1w; Wed, 20 Oct 2021 12:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9FC60605;
	Wed, 20 Oct 2021 12:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5D0B1BF951
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A19AB4055E
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 12:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VOFwtTViunM for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 12:19:13 +0000 (UTC)
X-Greylist: delayed 00:15:31 by SQLgrey-1.8.0
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net
 [188.165.48.182])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B352340185
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:19:13 +0000 (UTC)
Received: from player734.ha.ovh.net (unknown [10.110.208.120])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id B966123A69
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 12:03:39 +0000 (UTC)
Received: from blach.pl (unknown [91.239.249.158])
 (Authenticated sender: grzegorz@blach.pl)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 6E19823426F75;
 Wed, 20 Oct 2021 12:03:35 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005f4fb0d77-c71f-49cb-8519-a69978954198,
 EDD450C2C7A68EAEBF079434699523C23CB289E3) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 91.239.249.158
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 14:03:24 +0200
Message-Id: <20211020120327.5768-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 403916593268801855
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedggeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeejgfetgffhheevvdeifffgfeeltddufeeifffhtdeuleefhfeiveeutddthffftdenucfkpheptddrtddrtddrtddpledurddvfeelrddvgeelrdduheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH] package/rpi-firmware: Fix config.txt
 installation
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Variable PACKAGE_RPI_FIRMWARE_CONFIG_FILE is always undefined,
so RPI_FIRMWARE_CONFIG_FILE should be used instead.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/rpi-firmware/rpi-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 8a6a435f63..0929d6af1e 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -28,9 +28,9 @@ define RPI_FIRMWARE_INSTALL_BIN
 endef
 
 RPI_FIRMWARE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE))
-ifneq ($(PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
+ifneq ($(RPI_FIRMWARE_CONFIG_FILE),)
 define RPI_FIRMWARE_INSTALL_CONFIG
-	$(INSTALL) -D -m 0644 $(PACKAGE_RPI_FIRMWARE_CONFIG_FILE) \
+	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CONFIG_FILE) \
 		$(BINARIES_DIR)/rpi-firmware/config.txt
 endef
 endif
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
