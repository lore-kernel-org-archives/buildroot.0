Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE2DC64EC4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 12:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B986F4118B;
	Fri,  3 Mar 2023 12:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B986F4118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJt9vM8QwM_8; Fri,  3 Mar 2023 12:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D4144118A;
	Fri,  3 Mar 2023 12:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D4144118A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F6B1BF239
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE00E4118B
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE00E4118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teXWfOSZRxOZ for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 12:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C28940242
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C28940242
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 12:23:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,230,1673884800"; d="scan'208";a="224726808"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 20:22:56 +0800
IronPort-SDR: ZLE3bQtb/jJR8dJnwHHCPjw3NzphxS2AJ/3BX+RJzTfTGaVEtFwaRT8QDZ5YR8RAMSAglC+Oay
 kGNa7FTRR4r3gRZKFBpkhAGIDmaHAME/jnanD3Tu5609Jwzs2IOcUeuFnrCXnKKSyq5pga8Ygo
 Rms35bo9vFKsbUPwHbgTiqMO1lNl+6+uJ4W7DHyANzEj1Semy/FqDhB2k5kRaX9hEcVDfKbxSi
 ct90+VJNZvQXuhB7Qaftt4w9VAf2t778uVclmi4nQ+th79Z0A1Hb+o118wpQ9e/ccqHHYsIY0X
 EZ0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 03:39:41 -0800
IronPort-SDR: KaOKG4dxxrlkxRl2e2lrVQ1stkdrlwWw/eu9yTcU1Tx6+0VsBC8B2zKWqjc3u8XrgDNA4/+Cm4
 3KmVfxoOQYoJiifUvsv7ll69HXz3QehL7W/hQSwu6HyUzlIdGLfWj1isuJPQLmwG/GDpzEqw9T
 A5tb+jvkL5u82V8tXRhyrZjfGNvyETYxvH+lWCS4ytkvxeEfjvu02wxLtcF+egALKP9Gljofla
 vlaWNrLr6GvS9FrU0/PIeS5civ+MX6h7coV4IHJSA79nOQMK1draXHTtwZCiUcO/If6fne+61r
 nSU=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.35])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2023 04:22:55 -0800
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 13:22:48 +0100
Message-Id: <20230303122251.3392998-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677846179; x=1709382179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XBdCwhWOqS9iS6Ci5nhGKmLmK9DEmXeQlCBn1a2h4pg=;
 b=gdL3lwTTZRMbnxgb9l/wPnOpZkGw3HlOwrSC7HwGISm+8gv45ID+Fi+L
 30+rZW04wEBGAdxDxNkRHE1izJ8Vpqq8is2F2tGjzhqjA7Ga69i7vM1Bd
 RFu4brmnh6hahZIsL60NOe4sVEsXpzAnWo6gitAarcW8f+J2aff+qIUWP
 yHbw/aPd61kdZL9jZUzrSzHE9LTCUQygFzuL0+h3MWytNoQve8hoG1A91
 +FkPKe+TCO3i7+8Nf6+D/XpZAA15GpdENjVVg/bVqDHcsroTJlFn0X4IQ
 RnkcfLXT+sifuctOo8gOJ2BRs4dHS6v2EDYo9jeFVySXuuV0HUYGaQDh1
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=gdL3lwTT
Subject: [Buildroot] [PATCH v2 0/3] misc aarch64-sbsa cleanups
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here come some small aarch64-sbsa cleanups.
Please consider for inclusion.

Changes since v1:
-Modified test_edk2.py to use the same kernel config as
 qemu_aarch64_sbsa_defconfig. (Thanks Vincent.)


Kind regards,
Niklas


Niklas Cassel (3):
  board/qemu/aarch64-sbsa: use PARTLABEL to specify root
  board/qemu/aarch64-sbsa: use the default console specified by ACPI
  support/testing: use the arch default kernel config in test_edk2.py

 board/qemu/aarch64-sbsa/grub.cfg        |  2 +-
 board/qemu/aarch64-sbsa/linux.config    | 68 -------------------------
 support/testing/tests/boot/test_edk2.py |  7 +--
 3 files changed, 5 insertions(+), 72 deletions(-)
 delete mode 100644 board/qemu/aarch64-sbsa/linux.config

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
