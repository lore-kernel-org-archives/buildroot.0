Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEAEECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 18:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7018C6FADF;
	Fri, 16 Sep 2022 18:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7018C6FADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVqr7bCQdZTH; Fri, 16 Sep 2022 18:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85EF16FAD7;
	Fri, 16 Sep 2022 18:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85EF16FAD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6326E1BF3E9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 18:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E04843C4
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 18:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E04843C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODbPN6W8q0IW for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 18:51:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E34843C3
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E34843C3
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 18:51:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZGR8oUcNby85RZGR8omxJf; Fri, 16 Sep 2022 20:51:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 20:51:37 +0200
Message-Id: <20220916185137.462176-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJxCEFpWH8y5ag5GUOiT3W58yVaE5b6BqeClIHGMNO1QJoDPA0KU3pCIKrp3XfpUjoSYRoT2LXb+5+VQVAn3NZ5tLivf2E8ufNDYIzyhJJea4P6CpdbX
 6yzrikcEmD0zKoFUr3BdEGM3K5PHOWZVAhcmqt8JIh+54WpQ9KcXfMz796u6seM8KL6e/cYXgCqM7HXkMyBFY3w9OFwgnw4tuEa6kxtmHIyF/daqb9dtmTZS
 WJgv3vmQ6dcqf1/4pO8ffjtX/LJ4YoCNHyjh4wzrfiRNzZV35x8/Mwk+S+WepxzRFPWle38iRK3jgL7cR3Ce3w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663354299; bh=RWpXp2gGlbnbwc3dvaFauz+uhmGnAH/3DlLlDMGHqHw=;
 h=From:To:Subject:Date:MIME-Version;
 b=kAVcdZ0jVS7cDMxJHu60g5x2QmJJV3NQF3Duy790CYfUvXiaLakvKaiKutjkruQ4k
 eN1nnYhuZuik1KEWNvaZPrGm4MEA5Ccfln5NMiSdz/LNnMuP3XXgcgueIveZsgs5KR
 CR9ClHLww3gDZISryTdPriCu/S8HeuTxQPmt/JcO4LGRiN6RorR2VGOHK8ZXuj9VXR
 EC4D3/6iOBReYAMB2AIcmzJP/geSd7h/sQ98sI0BbCmyC2wDcFhrjFH0KBLbUAy0dp
 LedpMk4vGR79E/kMUM73TUzMrEh2RuZZhGne0x90pjMzPCgY2yT2nm5DdpFb8DXwkp
 BVdme7/4UX4Tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kAVcdZ0j
Subject: [Buildroot] [PATCH] package/rtl8723ds/rtl8723ds: fix build failure
 due to missing Linux CONFIG_MMC
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This Wi-Fi module has an SDIO interface so we need to make sure Linux has
CONFIG_MMC(that include SDIO APIs) enabled.

Fixes:
http://autobuild.buildroot.net/results/1bb/1bb71019b7edd7f195223a85c81f70e5a60518f0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index da25ffe9a7..8598f906a9 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -17,6 +17,7 @@ define RTL8723DS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
 endef
 
 $(eval $(kernel-module))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
