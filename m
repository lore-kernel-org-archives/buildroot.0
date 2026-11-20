Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3508860A260D
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OkM51vmg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=ePTp25JL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA125816F8;
	Fri, 20 Nov 2026 17:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHb6oYVYuKD3; Fri, 20 Nov 2026 17:50:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2E586816E3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795197038;
	b=YpgXdydtb7x6HFDYRcAKixLWCsvJIaxV11ztFTkKyloFjeVMrKqCTUZQzqfQ0mPXdT/l
	 mqiBgZ8bMt5cZ9YF9MpJJ5b24R24Fa6arLtGo/ZkEnCKcDcm8TQmYDb6QX6FOICzbQcxw
	 5iZVS8oKEtAvZy/1/Hdgb7MvJUwdGZpLW6GceJapalmnzBU6g2TVPbncWWxXMK76HBNm0
	 yZbMcAdA/Ai9s3EKDUvfvgxIUAl35r/++jSDK53t+kn/sGA1FTFg94lIOJ67Yag0B8Wed
	 2YTH9pYqpqOiZNr8qLShnveVmwqm9+4sg5TntR+Y7AGI9R71Z3BKRKVsxcC/ZBfGl4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795197038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=R34TiqlBTzxQRtOW1TU1K/EPiNu6NnVytiCaWGjWwiE=;
	b=r88hHsuyT+aAKA2vmgq4Xiy3Rj7gAO2i/ZeWL5bG3BSIaP16WsWH39JgP7Gwm9kXB7Xi
	 cnJkmMOPGjlHPchsSmD+enWqxmB9NRpjej/DiBiXgV6YUXAhzmMzenFjbQJISuSuHUVg4
	 0edo70N4d4LERuxcuFOdub/sx4lKK4A0Y3pm5FcbydGcPRjjay7YvHAH+PNv1fbBN9qYw
	 EvWh2oXdH4AFMI3/L+4C60bXRrLmUstGmVmz0yaayyMRnfgK7EZ6opPzurFZoe/UGHb/f
	 333x1hsf1Q64MHQELeasd+ES//H/EdPrDsHSXdyQPnq/HK0ey5vwgcOq+TsknLe+GKw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795197038;
	bh=R34TiqlBTzxQRtOW1TU1K/EPiNu6NnVytiCaWGjWwiE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OkM51vmgS8APu+pcZLjdHaPXskNKt2u0q1KBrJxa2ekdFMc+hqOt1xCDff2W26Tp5
	 O7YNaNN/JwQoPw/VmE4MAPJJgRUF6qIZPj+rt4XnSHAWJbyr2AqFNjPHMETdms69GN
	 7ujEYpCdVAPmXTS4oJCXLcUX+IvlVUu/aSeRWU2gGkPmaNjHJnVgdbKLx3HVVeEPn6
	 wXefvGOAZJIuzXREnenx0oPZM+axVsE7PiBT7zoTv56nCxksOfUlVtckRZr/QCeNMR
	 n5Av1YPXgVzO6ThBY/7etC8AmjTXn4Xry7OZ+5T+KrXfwL+6u8igKozK9sc3HuUNrX
	 xeNHpOIRSayoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E586816E3;
	Fri, 20 Nov 2026 17:50:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FEB5E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61073407F6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2hKLT-4zt3Y for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 17:50:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E04C34078E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ePTp25JL
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E04C34078E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 17:50:33 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id USknxGbvwmlDxUSkoxfqJ8; Fri, 20 Nov 2026 18:50:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795197030; bh=8MWOv7jEoQS86D21TD1JuxGhamnxxBXci0PuQE+opS0=;
 h=From:To:Subject:Date:MIME-Version;
 b=ePTp25JLgFb834FeCOExoEzhAPG5HT2R1r/Ofgnx28QAF7rOc7XdKDvMl/eInGdG2
 PXNAJvPvrfAXyHPwNnpm7oc83F+Sm3d7Wf8JldZ1VGGk82X1N+skESDNqQd6hIwVoM
 wN7LXx77b7EIBYCq7AWujZhz86HiiSX3IV/1d4i5TNI7QieyI/RaoxXa/Dx3N4d/Oa
 EepK+wQdBOHFUukY4oa4LTEIvFUYCnx+1ydFKc26Mp/U61KBK6PEnEgkcc0yOuJm97
 Qrr6jX81FAiPg+wBlUURN/bkqw3gIaITiZqerlVY5Hx6cZc11aQqbAKg42VGxn/zqz
 /dIRo6dsb59eg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Nov 2026 18:50:29 +0100
Message-ID: <20261120175029.173721-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBPW20s3pVMImn+0MN8WzfUFZQ+OyNjwuwBzk3RQb/QJjzVMO6IbwWf6UnwR3agaP4QUyzPmJAQpRDxhBrpTi3T9uaXOdbBGpj0mOWUfymglqF9tO7hD
 mBgiN/6cIsGIrRTBWMbZJ3K3bqnBxH8N0CnwWntwgTIfXYmiHCzNj/UbtEkOMvTMVB3DhIdch8V5aiKlBtWMA/Bqi5qxTsvwqFnagiOuX5rKphNy376hdqbD
 GuY+2kYWhcrh3ibbIpc9I44cWrBtndySfOUvRYsE1TjZUZ+Ry0/KF5S06qIKXINdoGbUNxGIcjtheTiJK02Mmw==
Subject: [Buildroot] [PATCH V2] package/rtl8188eu: fix build failure with
 linux 6.1.188+ and 6.6.157+
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump to version 2026-11-17 on branch v5.2.2.4 to fix build failure with
Linux 6.1.188+ and 6.6.157+ due to Linux stable commit 8b7648962d41
("USB: core: Use device_driver directly in struct usb_driver and
usb_device_driver") that dropped member drvwrap of struct usb_driver.

Fixes:
https://autobuild.buildroot.org/results/6c1f9024b049d74e556e1a6790be40c620c2b8b4

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix RTL8188EU_VERSION to 3baea5afbb67da6078fe1b4931e44d119bbe15d3, the
  actual commit on branch v5.2.2.4, since 806f138bec59 doesn't exist
  upstream, and update the tarball hash accordingly
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 0fb5fd45bd..39cc6ecc74 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8c941d91f1ae70edf053e0550317ee36f7944328844710922e1a482d5f63a407  rtl8188eu-db2131b227dd439587f37ea38927178286b980b5.tar.gz
+sha256  123bb495c4bc1383a0065d47a58088b6f00e49b240dc253f11751365895449d2  rtl8188eu-3baea5afbb67da6078fe1b4931e44d119bbe15d3.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index ee7fe2b796..37332b95af 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = db2131b227dd439587f37ea38927178286b980b5
+RTL8188EU_VERSION = 3baea5afbb67da6078fe1b4931e44d119bbe15d3
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
