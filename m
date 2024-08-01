Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1646AC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 19:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6FF282096;
	Thu,  1 Aug 2024 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Lqd1cdYRqgn; Thu,  1 Aug 2024 19:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBA182097
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFBA182097;
	Thu,  1 Aug 2024 19:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 587441BF401
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4451D82098
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7x4AgQDaTsX7 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 19:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADF2C82096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF2C82096
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADF2C82096
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 19:28:05 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 15B8BB005A2;
 Thu,  1 Aug 2024 21:28:00 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 21:27:50 +0200
Message-ID: <20240801192750.50064-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722540483;
 bh=u13jFd2/5jtgVZLccXE7VBKgb4cgjMs/q9VO/GKqkYE=;
 h=From:To:Cc:Subject:Date:From;
 b=FUvnLwBVn38nYwO4dSlgljkIYwb7dYvkkmHPjm8mlZFHqS9pti4c3Z/rbYnFhHh3M
 k5gnB5pLfpaEbICR5ezCk7p1iVRwNo2KHJBoLRxGafSV41uWnwCkbQmSmvlouqgeB7
 npIQBRYZq6m7Hl+got8ZYRg8MGwv6IRx0D2fxEexeAtDPAp6oAHd+x9JHSKBP6VC9w
 7IYTbMR/9LgKo38Zw/H9le7dAT4uP4FpzH9MAfjTamfsyKzyjZtU9eXw2Axd2icUW7
 JH1z/ELMlyfMkNuJ26zPa02LH64ug+tlIF59O3bQBCA52TI0l2nIZFQBYgj5FTIArK
 QNdzrwYWxFQYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FUvnLwBV
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-sc-firmware: bump
 to version 1.16.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version is aligned with NXP Linux BSP version "lf-6.6.23-2.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v39 August 2022" to "v56 April 2024".

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index a5bbe11268..955879eb43 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1272ac5c31a88017ef548721f3acf930a7eda6ac73aa9f41b5f0cade9d5c0e5f  imx-sc-firmware-1.15.0.bin
-sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
-sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
+sha256  23327c38ffc746321697528b2c4c726ed5c3ebadf4b312592d533664719595bd  imx-sc-firmware-1.16.0.bin
+sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
+sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 55b6fb00e3..5c9ec59d8a 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.15.0
+IMX_SC_FIRMWARE_VERSION = 1.16.0
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
