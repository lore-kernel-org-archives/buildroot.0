Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE3BC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E612B61036;
	Sun,  3 Aug 2025 14:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDLCmzc7aEFI; Sun,  3 Aug 2025 14:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6803C6100E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6803C6100E;
	Sun,  3 Aug 2025 14:42:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A7C1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F31C44103E
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsmfWI-qFjHn for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD10E41029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD10E41029
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD10E41029
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:42:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7JzQ-1ujfJZ2zc4-003l57; Sun, 03
 Aug 2025 16:42:13 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Aug 2025 16:42:08 +0200
Message-ID: <20250803144208.195144-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803144208.195144-1-ps.report@gmx.net>
References: <20250803144208.195144-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jFWhI2URBgxQrGhqYr28vJUzowS7EdaQqwyBuO5KVnqOym+Y9OJ
 csLfSNTiSMtoUkF+VqPz3YsdsPYgy2smVzERIMEvQ2DinYVQuYqzW/Lg35/lUDiSuG9oLTi
 sVsh3qWvyWEjRO9SF4ccg5cygWgcty3E8HLmhSAhiLjAiZNuK3FqCYH6MvSJZTOtC2PGzBp
 C1WSq1NXUNOOB0G//14ig==
UI-OutboundReport: notjunk:1;M01:P0:f0p4ZkyCO/c=;1irS1G7/6Iiy8XlAma7EeeLz6+1
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754232134; x=1754836934; i=ps.report@gmx.net;
 bh=v4mj2z5v1vVLZn75bou4l/hcbIqdUnP1LRQRjr1RWMg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=dy7SHFumP/AZYHU7FKW/Aa07Lz3Gt3zxIlzjarPIaXWNp1G3pHczZEhg4z9tucUO
 Flll99hkxQ1RER5B9eWOEXUL26pgPBqqs6//xYb0gQddR+z0AflsD9puCragwx9By
 2m/N7EOGtKrrEkdiTW0fc7NTO+FZ0BtWW87BsNzd0pm3zoFfyKbUggkgB1T8axY67
 mw8OYZqG0BbeVE+19YWR6f5UtqfoUqrVQTVI77xXXruz5Jwd/BH0t6QuGzacKsilg
 YOy2vPIkDsZTBdjH8HhhtNmA7J5DtRcQW5J77I7kgzr4n4EHkLjgM+QRXd6U7rb2c
 Rr5d4bLR9LpIJjkpXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dy7SHFum
Subject: [Buildroot] [PATCH 3/3] package/brcmfmac_sdio-firmware-rpi: bump
 version to 6596d33
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - 4eec7f2 Sync with RPiOS 1.2-9+rpt3 bluez/1:20230625-2+rpt3 brcm80211 versions
  - 4c1789e Merge pull request #25 from HiassofT/fw-2024-08
  - e59476f Sync with 1:20240709-2~bpo12+1+rpt3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash  | 2 +-
 .../brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
index c20abfc26c..aba028ef6a 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
+sha256  d9835b33bea65cf15f41753e215a11e5eca818a6e3bfacaa750aeac12456c24f  brcmfmac_sdio-firmware-rpi-6596d332eaadd63e2413e3937715a084f61c39e2.tar.gz
 sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  LICENSE
diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
index 95707487a9..8c04b017e3 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 26ff205b45dc109b498a70aaf182804ad9dbfea5
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 6596d332eaadd63e2413e3937715a084f61c39e2
 BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
 BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
 BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENSE
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
