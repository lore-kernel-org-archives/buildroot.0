Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0FCECAAD5
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 13:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D12A610CA;
	Wed, 31 Aug 2022 13:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D12A610CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bbzLwJ-B3awZ; Wed, 31 Aug 2022 13:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76ADD610C8;
	Wed, 31 Aug 2022 13:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76ADD610C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71201BF356
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 13:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8098B417BF
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 13:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8098B417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZMnd3vR9PaT for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 13:47:18 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D77416F4
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13D77416F4
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 13:47:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,278,1654531200"; d="scan'208";a="314415705"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2022 21:40:06 +0800
IronPort-SDR: MQSr+R8Sz/haHGRpxG3Z/YN2q4wysDjCPPFLQaZXIQTt/IBpExQpDY2hhTq0xCiYFhddOwj8zr
 KgpoibTfD37APBfiSpqy/GcoFb6p36DO+fXpVTK7A2HaeXUr28N5wPSQoUO7gy71etTO7o/rvQ
 hs0EtkkS9kPQD/HU52gwvtd5QEfccGG5PRBx+mr+slyz5gvkK1zRUF2kjUqtsTV2hwtoTWribq
 eAiZAh7nhng3dRVQUU7pOfENOizEyPvdQpF5I2Q3PrrweZT3QsPXbMyMxyPhyrioqcIjnbnG7m
 Rv0bBOb7FwUQ4BOwA5OMEqkv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Aug 2022 05:55:13 -0700
IronPort-SDR: Ib5+wxFWrYO4dAg5lse14m3KcVw6WfKwOAwC1J0uXLkyzyAYKUqzo+kr9hFcR/rpaonm0RFP5Y
 rQp1T7KM3Ml0Mv6rvZF/MDlthVYxvZ+GWNqvfRkOsbdzSV0Tc8etCHk0oWTrRYJvcuHOjLQC5m
 Czh2MnqUBqdSAgh1VVp2/U+PkJqM8/jDxxkM0RWD8ljfberlwhPIoKJj3rZxLptdAmrlVyESYY
 9j5tS0XsmWP9ka8g4hXGnxsDra1wfNjeHYQ1Jpa38JHs0CBl606dLDvuou98Hvc2KYWbhSgHNh
 X/o=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.167.76])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Aug 2022 06:40:04 -0700
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 15:39:51 +0200
Message-Id: <20220831133951.905279-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661953638; x=1693489638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WCq7GPJGTahQMRCSF8B/JRmUzoPd/F6wyXXUnUSalMM=;
 b=TjJfosdZDTUUoHFxGUFKXAKMKIK8NWfdRjPFKLwzFhT/YRgmFrb2q+jP
 avcj/BIPirlaVMKifwP22MKSljH48VoZiX9sgB/pGWveUDx712FUyOYiN
 BkGnrmf/FC5f/Wh6jOmnQxZZd51iMBh0zHoYMoJkGK3cxyheR1jdDPXAK
 DR+yTLRKt69f5k/9oKJuIGogCz2euaYSFqQnBPtn+m7I94R457LRB0jwZ
 gQIQ+Tw38pWmOhDN+9WFHXebwBIGrqIQNqMO9ubunb3HL8uR184ASggvE
 IkuvMuXHZjmYEQtub2mniEf/S+B/0C1qZxGhnkcN32NxjJdhSvGaWjmdA
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=TjJfosdZ
Subject: [Buildroot] [PATCH] package/qemu: add support for RISC-V
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
From: Alistair Francis via buildroot <buildroot@buildroot.org>
Reply-To: Alistair Francis <alistair.francis@wdc.com>
Cc: alistair23@gmail.com, Romain Naour <romain.naour@gmail.com>,
 atishp@rivosinc.com, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QEMU is supported on both 32-bit and 64-bit RISC-V hosts, so let's
enable support for it in buildroot.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/qemu/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e960a062cb..15d6c7d6b5 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	default y if BR2_mipsel
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
+	default y if BR2_riscv
 	default y if BR2_x86_64
 
 comment "QEMU requires a toolchain with wchar, threads, gcc >= 8"
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
