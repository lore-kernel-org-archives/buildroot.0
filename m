Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9F4C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1BC641553;
	Sat, 12 Aug 2023 21:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1BC641553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZg4bTzoL7mi; Sat, 12 Aug 2023 21:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40F4414E2;
	Sat, 12 Aug 2023 21:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D40F4414E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 034C51BF5DC
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D028560E8A
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D028560E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqmKnCFDjdQa for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 21:20:38 +0000 (UTC)
Received: from smtpcmd03128.aruba.it (smtpcmd03128.aruba.it [62.149.158.128])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00CF960E7E
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 21:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00CF960E7E
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Uw2CqCycR3M36Uw2Dq5NvC; Sat, 12 Aug 2023 23:20:33 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 23:20:32 +0200
Message-Id: <20230812212032.349673-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHGjYBtbFHKY68b8vBJwxrUzCW93awBLT1mM2NocGawBGXTEF7bXw8eLKPEPdMF6KI1oUItWDzBuZzdFxTVKQ7f9I08zYjiXIRvwLLsQjP4jjmiUNDto
 wW58wbUDHTauuHcgiqaE2raGnhRcGCUr7GecRyin33FkS2jeJC8duYS85FDOCHyz+YtUm7dIJUB5H28heDItAAZ0VRTRwA006VZSJILhwxpehswEa/YRME5m
 sluphZ85ba8ypa30gmhsKzcQI+TA2GZWEdiIYZRHbAI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691875233; bh=uOHx0UjK8zx9yZEc6N3wp+154hX2sFpxaYY/1jWgeLg=;
 h=From:To:Subject:Date:MIME-Version;
 b=k61y0nVGCe1MBBApQhceEdcxQgIuVGfX/wTkzL66NKFVd9hTu+1mY+DecFUX+p4es
 TSzKc2cl6V6B3o0aVrHky9dFo2iQujTA/EP7vJChSgp1XNI7FS3ERKCxxGqtkRbMCt
 QSYsKxeh4wKMLhtgZUsBI7qj9wTpAbS7CcIZnGfG1+ZrbV+kQV4ncU1gfTySBVFz+2
 alJ3d/fuksCgFS7eDGlwV4hAGkLaaub81t4B1B1RN06RBVO74AeW9TryPlv565do6E
 8w5HjBqPqpgebmX4ZsMhzbS9hI6144hE3zaM6V0vNBgQyNvMnk6sV0hB/Hwi63tn4M
 Vpbw7ePMplnpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=k61y0nVG
Subject: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
 missing CONFIG_SPI/MMC
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depending on the interface chosen we need to enable Linux CONFIG_SPI or
CONFIG_MMC, so let's do that according to BR2_PACKAGE_ESP_HOSTED_SPI.

Fixes:
http://autobuild.buildroot.net/results/cdf65ad07aba1d86f195576a2317c83aeb3dfce2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/esp-hosted/esp-hosted.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index dcb0b3bd70..7491c46512 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -17,6 +17,9 @@ define ESP_HOSTED_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
+	$(if $(BR2_PACKAGE_ESP_HOSTED_SPI),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SPI),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_MMC))
 endef
 
 ifeq ($(BR2_PACKAGE_ESP_HOSTED_SPI),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
