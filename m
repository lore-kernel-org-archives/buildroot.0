Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF72AC83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A12E66121B;
	Tue,  1 Jul 2025 19:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nms67kIoOrbu; Tue,  1 Jul 2025 19:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A77561207
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A77561207;
	Tue,  1 Jul 2025 19:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10F1F128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 030C784366
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x97w1Gl78Ico for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91069842CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91069842CB
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91069842CB
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgmvuUCdh8eo9WgmwuM2Fw; Tue, 01 Jul 2025 21:37:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  1 Jul 2025 21:37:03 +0200
Message-Id: <20250701193705.761121-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
References: <20250701193705.761121-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNM7FXeX9BVs6OmrdUjdkvdjK5vDf7NoZXFNYfM0U2YLAHoAss4K4ZJsfxSkMvFqZasYpGxZTg8T/OmMlXzJ6ZdvGaf8deaxjAc18aq/vz30SmpUwKMI
 wrQloefsk39aEkxmQq3tLjIO8Dh96KxgtVZU3QQXXz/Mla15HOrSaLGuYjQlcj2TTMtRNKtmYEoJdR6/F2jaYJ43Hw2uKtiOgz3hqhzRJr0nQvpTihfvQ217
 kIwfc9md7sbUbbYV9lAuqE1Tgt2TCDZLoJ2cj6hmuzy+zq/rfJgtBxesXRt9dUENadkxpv0S24od7ui4nwum1506RIhtDPvJEgVcEt7ORyWeeKsfkhzeFNbb
 qB8/jaJA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751398626; bh=EDPv8k7hfyFwj5d5LueOITKZ7q+wzFT+tSDzqOt5bcw=;
 h=From:To:Subject:Date:MIME-Version;
 b=nwKcewXnQFupJHHTDd+AsFLi/Q9PlOXEJDt2iuuOHyOWnuKl3vSHVg5FItLU6k2vC
 zOJkVVnPid2EmEM10fLMybEYB5MC1dJN6ci5HnLHEmcZX9/ABXGlmGPDLtj8QivWCg
 wJ5IPoKtJSuKeF+fJoxsglQBYWumQ8txO4V9+HwKBeq4lIYGrJ+PIPRH4Zs0ApFewj
 ITpzVQ8+c3WwxNFg1pCLRLGWluwh3FSLhqdAY129w1NdEp7PRweYoqdRi2aqrAOATP
 wSrqePY8SgId53nBnW8x0zVkHR49RXpHr1ZsLGLEiOWBNd4QX1QOXcpCh2jVR4rl8O
 PohF19CZc3iyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nwKcewXn
Subject: [Buildroot] [PATCH] package/rtl8723bu: fix build failure with Linux
 6.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Benetti Engineering just took over Larry Finger(lwfinger)'s repository
rtl8723bu since Larry unfortunately passed away[0](RIP) and there are
pending PRs that will never be checked as stated here[1]. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And of course let's update
package's URL due to the moving.

[0]: https://lwn.net/Articles/979419/
[1]: https://github.com/lwfinger/rtl8723bu/issues/206

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/Config.in      | 2 +-
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rtl8723bu/Config.in b/package/rtl8723bu/Config.in
index 7c624fc4d4..70d597d23e 100644
--- a/package/rtl8723bu/Config.in
+++ b/package/rtl8723bu/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_RTL8723BU
 	help
 	  rtl8723bu wifi driver
 
-	  https://github.com/lwfinger/rtl8723bu
+	  https://github.com/benetti-engineering-sas/rtl8723bu
 
 comment "rtl8723bu needs a Linux kernel to be built"
 	depends on !BR2_s390x
diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 236b9a6726..c0216dd1eb 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  357c78d6f86794d96530155f9ba102e56421efb6fa43eb33daa0fb57354e8215  rtl8723bu-af3a408d6399655b0db23c2c8720436ca725ca47.tar.gz
+sha256  e50ce66539a5216b91460b8278606874040f3c21ce8afbe1f5e84595dafa6868  rtl8723bu-523cb38e4c62bb181d6b95024884e938835cf8cf.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 0ce8b1afad..05447ecef9 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
-RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
+RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
+RTL8723BU_SITE = $(call github,benetti-engineering-sas,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
 RTL8723BU_MODULE_MAKE_OPTS = \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
