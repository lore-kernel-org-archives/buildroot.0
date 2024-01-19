Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74441C47DD9
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 17:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160BD42893;
	Fri, 19 Jan 2024 17:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160BD42893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaanWV_I2bkI; Fri, 19 Jan 2024 17:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7C14287C;
	Fri, 19 Jan 2024 17:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7C14287C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2811BF319
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 149474287C
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 17:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 149474287C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNDmt4oiSUbu for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 17:16:02 +0000 (UTC)
X-Greylist: delayed 1124 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 19 Jan 2024 17:16:02 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92244286D
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A92244286D
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 17:16:02 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by instance-europe-west4-kmlp.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97.1) (envelope-from <dimi@tpm.dev>)
 id 1rQsB8-0000000BOzk-2qvl for buildroot@buildroot.org;
 Fri, 19 Jan 2024 16:57:16 +0000
Received: from [78.130.168.74] (port=60748 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.97.1)
 (envelope-from <dimi@tpm.dev>) id 1rQsB4-00000000PPW-32XA;
 Fri, 19 Jan 2024 16:57:10 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 18:56:59 +0200
Message-Id: <20240119165659.155158-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - es87.siteground.eu
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tpm.dev
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 07c4c9e4d8d140d336f92bf4d776f572
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=7175XLmNP1Tb9eNLqTr5xJSG5Ak9dYyLiaiDdO6lUuw=; b=TlotYvnKBW4QCfNNJQ5ZnEpq1V
 GUDXm5HyTR5iYz74Bl1jYkWnKEJ38W50AsskBiVEmcEyNNsiZohSma05VdXnwcXh4+7yvziLxathg
 Ty9BMHE0bvY8oC+jTtgfDpnh1nzOJ85R41hBdE4lsA2rORDNrzrkBurHHw4sfjTWhM3lVWYWDxHsG
 jK0JPGMBHNl95X6m5z8HVRj55C7laXpfua/1E3Ep3+OIJwKi3welOs5yo2gW6hQjD6WTSwiRJ54TX
 t/e/j3zWxWDH+AZqOGcYBuD71LyX74xHamUWHxHZe+GPX5b9DRxV0Lvw2D1p/3YgBUOmaK9Mkjtgr
 xty2+IKA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=TlotYvnK
Subject: [Buildroot] [PATCH 1/1] package/wolftpm: bump version to v3.1.0
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/wolftpm.hash | 2 +-
 package/wolftpm/wolftpm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 3329528095..33d0aa2414 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8e06e77893f104be7eb9421cac50518552ad9c5fc7fe8a9c1cdfaf4f11b92df  wolftpm-2.7.0.tar.gz
+sha256  b4f6c090cad7fdbd4fd976f1bd8f271694669459b240fa14bec60a89b749dc1b  wolftpm-3.1.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index db332712f5..4d1d459801 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 2.7.0
+WOLFTPM_VERSION = 3.1.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
