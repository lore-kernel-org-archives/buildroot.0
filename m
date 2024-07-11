Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62814C3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11ABE41121;
	Thu, 11 Jul 2024 19:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_ebalczkXcP; Thu, 11 Jul 2024 19:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5DA841138
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5DA841138;
	Thu, 11 Jul 2024 19:15:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76D3D1BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6373D4168C
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBL2Ij0HMlrQ for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:15:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F47A413CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F47A413CC
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F47A413CC
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:15:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RzGVsHNZ1DrVnRzGWsxTma; Thu, 11 Jul 2024 21:15:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 21:15:39 +0200
Message-Id: <20240711191539.90650-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
References: <29a51211-e273-4b28-ba3c-648df58b83c3@mind.be>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJapfKzf1U04KysBakeCZeuFsg1zzFBWWKE+xm7xbkN7FYgIfm9+tozlhmAzIY7vcqH7qb89ff7bZcyNmtFVZIKBzytxR1zYDbLDQLwKGelspswqERtY
 se0OQkkyZ2NRbOZccadE04KMn8USYzVg4qq8or3QFgYunuRZcUDXvXP38resy+xFqC98Y+mPntjNyIfhKk5xkSFNo39rbyO2cdJ88S22kPeM/CHumP1ufsnK
 RVO2tN/LbidR7snuJFQ5MrXN2GX6vqQcdC11KzizMhbRM8QvcKJVtsSXYVl+FjdyZui+HyflPdjK1cC18hVZqt5RZouiVk+47N2ToT2XvBzAQBeyIrDmYppj
 LFy+4sHr12CwLFl35za5YwMWloTeQUbprqIjczFCcYcRnhXWNRI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1720725340; bh=ZzTS1NDMUFP/sHp+UoKbVl/7MV/asonRB6kbI3/QW0E=;
 h=From:To:Subject:Date:MIME-Version;
 b=FabsROZt4Fxe9qXif/BsR49dY//rmsUg+0d7dmwbtTAz1xTbiaphDCSVzEEJSr2uS
 8D9msaf/47N5WTCIFG4CIEMpNDKJCe8FH5BDAK/7ZPAFVB6bf2LHWHs0/wgl3IQwES
 +qK5k9SPLXz6/OjKuNtDKGyKDkkybSy/Ns9iiw4m/tcRMxmwoVFtWO7olUjL6qGP/e
 FcXz8FwMehATzaQRD+aT6vPSuzCeXtUwXZpMVxqBJnOH/H2F5fQhDH375WhuqHMHRW
 PDhfjix4jU58VX0otoh96a532HPzRuRYkzVr0fY3fguAHZpmJpgUJFmR7sBJUxiWs2
 D6OfAY/fjv2ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FabsROZt
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump to
 version 2024-07-11
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version provide patches that can be applied with fuzz 0 and this is
now required by Buildroot.

Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index be27a85970..5f3e001325 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f2e5e671575d9488fd19b821d70e59952b6dbbb5b2036ea5462f811eec819370  sunxi-mali-utgard-driver-c4bc3e229c0e5f30c24c20ff1fb8db0e4a450c0f.tar.gz
+sha256  151a56eb6a47efee19369a1c08b7aec506e48f983683a3cd05c5494cedf0fb69  sunxi-mali-utgard-driver-ad7e98bc1e81c7ac9c897f854c1a429d33e45d58.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index b8a12247d3..ba7c50718d 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = c4bc3e229c0e5f30c24c20ff1fb8db0e4a450c0f
+SUNXI_MALI_UTGARD_DRIVER_VERSION = ad7e98bc1e81c7ac9c897f854c1a429d33e45d58
 SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
