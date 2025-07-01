Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09280C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF0134191E;
	Tue,  1 Jul 2025 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfK0nbgXLZKU; Tue,  1 Jul 2025 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A88418F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7A88418F5;
	Tue,  1 Jul 2025 19:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9704128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C710D418F5
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS5_aw1311Ri for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:37:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9148E409AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9148E409AD
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9148E409AD
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:37:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgmvuUCdh8eo9WgmwuM2GA; Tue, 01 Jul 2025 21:37:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  1 Jul 2025 21:37:05 +0200
Message-Id: <20250701193705.761121-4-giulio.benetti@benettiengineering.com>
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
 t=1751398626; bh=cJBcgTQ6AW6SBHWa9oMuxO0+ctIhyGemMPfYqIf5p6g=;
 h=From:To:Subject:Date:MIME-Version;
 b=YZmheJBNL6vu9DZjNNgbU9a5xmmtoIlTms/qDb6G21F3tSAaZlxslpj1QSuRQGBvk
 OdnRybV5KAO/w72lC7eGMPJ9Hfz7yBi8MiOeIb8Nr9CCh2rISesL5uoGp+r2DbzVBU
 ++qBrgVLYq1gj3i6ZfALNP2qUVK2dT6JzDlqVOdv5pkHeQFes+XtX1r6uI9IVf5cZA
 gQN4xySBQ4n2Qp64C6Vmo+rSHPplMVo7CVRFRPL2lSzaJ9VT2M0p/XLHjx77w74ZfH
 lad3nF5z94fVMsJGAg/6rPX0k31P+HmP0RU+7EVpoTRi9oECnwdvmpPv03xFqjT85s
 Slenv2q5Sb8pA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YZmheJBN
Subject: [Buildroot] [PATCH] package/rtl8821au: fix build failure with Linux
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

Benetti Engineering just took over Larry Finger(lwfinger)'s repository [0]
rtl8821au since Larry unfortunately passed away[1](RIP) and there are
pending PRs that will never be checked as stated here. So basically move
github user to benetti-engineering-sas and update version with latest that
fixes build failure with Linux version 6.15. And of course let's update
package's URL due to the moving.

[0]: https://github.com/lwfinger/rtl8812au/issues/32
[1]: https://lwn.net/Articles/979419/

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/Config.in      | 2 +-
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rtl8821au/Config.in b/package/rtl8821au/Config.in
index 3d7bbf643d..66e7334148 100644
--- a/package/rtl8821au/Config.in
+++ b/package/rtl8821au/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_RTL8821AU
 	help
 	  rtl8821au wifi driver
 
-	  https://github.com/abperiasamy/rtl8812AU_8821AU_linux
+	  https://github.com/benetti-engineering-sas/rtl8821au
diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 56e5609ebd..e79e32ff3d 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fde8ca9735a6c9c4c907fb6f565185a59b04bcfa78feb2309941cc09d49c4ac7  rtl8821au-8ea0ed9da764448c7310a27744ab5814289f35a8.tar.gz
+sha256  fd02814e2ab5435cf4213aaf876d28dedccc0bec8c91ed768336727276c5eae6  rtl8821au-d0a49ba401a8661ef0cdc4cf8850bc7c927a062c.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 9a92696437..9ecbbbb0b2 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
-RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
+RTL8821AU_VERSION = d0a49ba401a8661ef0cdc4cf8850bc7c927a062c
+RTL8821AU_SITE = $(call github,benetti-engineering-sas,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
