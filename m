Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C345EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65334174D;
	Tue, 20 Jun 2023 17:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65334174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z30QH_XGY6R3; Tue, 20 Jun 2023 17:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F1DF4173C;
	Tue, 20 Jun 2023 17:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F1DF4173C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73DBB1BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A54281DE1
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A54281DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrYAi3k_k0xT for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:09:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A027481CD0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A027481CD0
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:09:27 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-bd6446528dcso4917312276.2
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687280966; x=1689872966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IJs7NQp2399C1G739w4KXGiAC/7OJMNz4BIqkYIUOhI=;
 b=ifQBr6EdU3kG/v5YGeRuxiW14+5XatULSiqOCZODbjAB2opW5wk5U6ZfTv29AkIbJG
 5A48qAWeaxplNbhUhUiyuquhvYc/X/Sw8Lmk2Re/afHOHqiuoyzgMS5iGj+pldACEBvY
 3j3X+y4KP1gpNhE5c/UxUSLI/6tKHeh+bdURSE1G4jXCMZebhaJTjBB9X69+RvjU7o2O
 DFgw9Wd5kZMJhXu4UkLmS6JyAgsKFQGr/c1/84ZCJ21d8/osvylIn9W4lUr84YOENsvV
 m4C/r/jmb/fgGVmQhvaA21CmbWxZW14DiqvY6vl2ca8UYqkjoay/GXSJW2OnQPMepKTD
 ST6Q==
X-Gm-Message-State: AC+VfDw0odV4kWfhs8LsX/isEL9UIcclKSzpDOCGTrGgv3K7dIx8EaPm
 AXOJhXJLsxYIZzQKhXItBZacqft4290=
X-Google-Smtp-Source: ACHHUZ4HpqTi405pgxZ72eKym/jScpIidXYftzMkuXOeSQa/16TKb/6iPvisw8qhaAvSvERK/UmL1A==
X-Received: by 2002:a25:b296:0:b0:ba8:7122:2917 with SMTP id
 k22-20020a25b296000000b00ba871222917mr10111083ybj.0.1687280966186; 
 Tue, 20 Jun 2023 10:09:26 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 130-20020a250888000000b00bcb4ac1fbc6sm466713ybi.30.2023.06.20.10.09.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:09:25 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:09:22 -0700
Message-Id: <20230620170922.3722-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687280966; x=1689872966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IJs7NQp2399C1G739w4KXGiAC/7OJMNz4BIqkYIUOhI=;
 b=DegSBYyrE1YadnLopY6cTuWHJSFrqEbkiNGpe1sV3ZwLaEm4ATYWcH8znlLfUWSwMG
 E+N+A99zd/qXbadpjEGX+x9p7zHX1m2xlmqB1N4PoOPcH07BtWlKiRzgI9zrENlsp/Ih
 364cZBgudn+/5lhTpQ0EPG6mmEvwCr08g7KanzKrF7vaRiEnyp1O+OrteclznNJbCL/f
 Arp4VJr0enZtjrVIUGNQysRUKeWoHTHPGZOj4UvuaBnLjm52PCO7dF93cbYGOloeRNtv
 3eFT0nf9mbjUwHpJz0JDH52t0Uxd4m2QjCchXRkesrrV3jNvTWwscZXtCadegXJx22Ko
 MG2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DegSBYyr
Subject: [Buildroot] [PATCH 1/1] package/firmware-imx: ensure the linux
 firmware is installed first
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There was imx SDMA firmware in the base linux-firmware package at
one time, but the firmware-imx is updated with the latest versions
from NXP releases.

This just ensures a dependency is set so that the imx package will
always come later in case an overlap occurs again.

Signed-off-by: Chares Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 99fe71a91c..4cceb67019 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -14,6 +14,10 @@ FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_INSTALL_IMAGES = YES
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE),y)
+FIRMWARE_IMX_DEPENDENCIES += linux-firmware
+endif
+
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_IMX_DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
