Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43175ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 13:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEBEF824DD;
	Tue, 20 Sep 2022 13:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEBEF824DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVcB-LElrl7R; Tue, 20 Sep 2022 13:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C4C8249E;
	Tue, 20 Sep 2022 13:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C4C8249E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6881BF2FE
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 13:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C5E8249E
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 13:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C5E8249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FNNXZA8SB4C for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 13:32:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 856B381991
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTP id 856B381991
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 13:32:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id adMPoHbnhWuL0adMPo1wYj; Tue, 20 Sep 2022 15:32:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 15:32:24 +0200
Message-Id: <20220920133224.3290270-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFyWrSWvMiQoA751jTL1Q7UKTLisbNRdbmM0BrGz6XIMRHjG5xFPx/oGUS/p5LshHI+w5GrUlYWIXIhwmpLwhDtjU60HH/Z6j3/XEQ8BZfPbjOOpMI5p
 COjRrcI3ouRkTz3G+YTY34uSQA72HBzxWU/cCZ2WL7LWjviGWfM8mDgXhPdy57OEZarzmdPkYxLivFrxW7rGyVDiXPqYYsLIXrrYKRqb+I8W6Ey0jvyv5eq5
 fLmurD4oKlup2G2N4KESOJkioKifNCzm2s9pXlUvOdIhHYV2grpH1tZtExAvexW+IDmdg4XLqMgAYrRQ2Hyk7A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663680746; bh=77sOpz7uciVSxp18fg1Xy9mnR1p6Jc+kY0Lx7vAdMpo=;
 h=From:To:Subject:Date:MIME-Version;
 b=g4MsJex2MOz9iIFRtSM0qdWciGBDMT4Mp7MzH5+8vr/ddRMzfTRw4VP+errhd6bK5
 itur4Xf/JCmELhqD4r66sV0STtWTHjItpM8RTvYz0tdxQN6D8z/0XpIS/SrmBslZD0
 6Tbjj82SQktUJp3jODjb4UBIh0R4eqW+P+AkHVHzfyA0cfSJbd3H+bLpN5oMk1ieRZ
 JSRlIZ2wv6syrM7oRWoPsSE+xRP0rwNHVBS7rSeOC04bDaiTrFVkGqwmgml+P9AS5P
 ZQNv5K7ZC+M/FsWVlqacGonkHBYX8WtU9Y33a/taHZc9gWBa+08Yo3itKEr8An0nQT
 k5xXDS/ZERxbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=g4MsJex2
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build failure due to
 missing Linux options
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable Linux options depending on the bus has been chosen, so:
1) enable by default common Linux options:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_CRC_ITU_T
CONFIG_CRC7
2) enable for SDIO bus:
CONFIG_MMC
3) enable for SPI bus:
CONFIG_SPI

Fixes:
http://autobuild.buildroot.net/results/d8c4f0f959dd2ec110db8a75980f13172c3c116c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wilc-driver/wilc-driver.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
index a89af30e29..a7a902b6db 100644
--- a/package/wilc-driver/wilc-driver.mk
+++ b/package/wilc-driver/wilc-driver.mk
@@ -13,11 +13,17 @@ WILC_DRIVER_LICENSE_FILES = LICENSE
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SPI),y)
 WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_SPI=m
+define WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SPI)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO),y)
 WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_SDIO=m
+define WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO_OOB),y)
@@ -25,5 +31,15 @@ WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_HW_OOB_INTR=y
 endif
 
+define WILC_DRIVER_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_ITU_T)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC7)
+	$(WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS)
+	$(WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
