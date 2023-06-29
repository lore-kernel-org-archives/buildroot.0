Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D65AEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 05:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB23660E3F;
	Thu, 29 Jun 2023 05:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB23660E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3UL0T05qHX9; Thu, 29 Jun 2023 05:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FFCC60E26;
	Thu, 29 Jun 2023 05:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FFCC60E26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70B9C1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46DF681DEB
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 05:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46DF681DEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGmk4b6hEp1b for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 05:31:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C08E48143E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C08E48143E
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 05:31:37 +0000 (UTC)
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22ECB1C0006;
 Thu, 29 Jun 2023 05:31:34 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Thu, 29 Jun 2023 07:31:29 +0200
Message-Id: <20230629053130.3976-3-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
References: <20230629053130.3976-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1688016696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBYVP+fdTkJTJrd0WwCEppusOuR34H8et1iIdwsryp0=;
 b=hxX4xx9YFk1FoLQDN9EkI3YjteBD0v7wdgIXHeW/VdCCjG7u65fyMHnGd3VyI/QoBsLN/y
 5jKkReC3aMQiftLIyBAu/LEAjta5JknfnoAptdDuikriLSo6zB4ffCiqjsNsUlMJK1wi7d
 hwkEdxJYmNR8ApuvUqCUmSGDE+qyQmen7o0DIVF0KRGk/WNDj8O3oZGffqSybcgc4V6lET
 T6tGKEncP6wnMGkm+nPBK+Y3YmczbOAuv1Zrin0L8oUTDr7rRunt6yk2Ar3oap2AuMqG1T
 t/Il8haUGvRP2iTQaIym4GJJcL3WDEXLbIxr6ID22waR5tBQOSHem3tdvo6OMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=hxX4xx9Y
Subject: [Buildroot] [PATCH 2/3] board: add the qemu board support for
 mcf54418
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Coldfire MCF54418 needs a board to give the proper linux defconfig
to buildroot. Add it based on a simplified Linux stmark2_defconfig file.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 board/qemu/m68k-mcf54418/linux.config | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 board/qemu/m68k-mcf54418/linux.config

diff --git a/board/qemu/m68k-mcf54418/linux.config b/board/qemu/m68k-mcf54418/linux.config
new file mode 100644
index 0000000000..e950052061
--- /dev/null
+++ b/board/qemu/m68k-mcf54418/linux.config
@@ -0,0 +1,23 @@
+CONFIG_COLDFIRE=y
+CONFIG_M5441x=y
+CONFIG_CLOCK_FREQ=240000000
+CONFIG_STMARK2=y
+CONFIG_UBOOT=y
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x8000000
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40001000
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_BINFMT_FLAT=y
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_FREESCALE=y
+CONFIG_FEC=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
