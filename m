Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB634CCA480
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 22:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E8060F49;
	Sun, 17 Jul 2022 22:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E8060F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jbTfk0q1z9w; Sun, 17 Jul 2022 22:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E6F60F88;
	Sun, 17 Jul 2022 22:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E6F60F88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C698B1BF59E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C6F0416A5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C6F0416A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTAml-zh6xwc for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 22:45:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23DF04169E
Received: from delivery29.mailspamprotection.com
 (delivery29.mailspamprotection.com [185.56.85.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23DF04169E
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 22:45:49 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se29.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oDD1E-0001FX-OG; Sun, 17 Jul 2022 17:45:48 -0500
Received: from [95.111.54.43] (port=34674 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1oDD1C-0003Oh-NQ; Sun, 17 Jul 2022 22:45:42 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 01:45:23 +0300
Message-Id: <20220717224524.8771-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+o0CivCVD0I6HCyL2oHld6PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRUjhyqqOUHE9W5eb
 CWE0sjxTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 Cmsi3JsXLVveoVoX3FIZv8wq4YPAgTtUp75uqlx0KezvZHWhsZuGzvf7iY516LQplXQ7h4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDDGcfMcpylyxhs
 01KruaxB6s0aI7mWLxFqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgHPUbw7CVpNolc
 zSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthFMM8nk05yyC6RHKTXWL4VlXMWW
 gMO2i6jdIAg3eM8KnDYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zw4HUoD+cIWUzsqPTs
 oNyo6vdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErbJFPCX7X6uLCQ
 WGN9pNli3DC1GSGWeova9JDgpRb5nc2ELFzMZnC8MrxOtDBCJR1d+7sOniG7X+t1TW39Ja77LGPp
 OwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlSOIcPxmo87wug
 keVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1bhC8OG6CHeS+X
 Mj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pRB/8iy/gjgfvnjjBNSE5V3qhQlYEG0OBE+0OCQMovU=; b=XxTmW+q+sf4+Q4Ms2Xgc2cHVyf
 uoS3t11bug3MiC+g/AgvC6wG3eUSsVBKFnAPZ6B+z2qzzmG2GAUDXPgb/qN7Ee7jnG2aSFaO7/Dv/
 8nILnTnUNWVaIHVqYx3Ph6oleHCQVaifkNCgg61/O1NsvD/c95gf0A35o9bhlWa6/eL9Xuv399VDC
 DBa5eCV9WDqApZ2n8XTAW9Ftpr9DAqHZmNDGK3XAYqAkInWGdwfUBcKgHSkd+Nu5HsSsnKrhgj2+e
 g8K4GQ5VLZ0Oz88EHCCeAeHC0tKuXuikFOpCWvPT99M8qn7N0xFcO4CCLayHvuV3PpCTaaNL+w6KH
 glK+8OyA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=XxTmW+q+
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: [Buildroot] [PATCH 1/2] package/wolftpm: Update version to v2.4.0
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
 package/wolftpm/wolftpm.hash | 4 ++--
 package/wolftpm/wolftpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index b9a9628b68..d24df58eaa 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,4 +1,4 @@
-# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
-sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolftpm-2.3.1.tar.gz
+# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz
+sha256  31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b  wolftpm-2.4.0.tar.gz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index a4a9edce85..c5ebeca18e 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 2.3.1
+WOLFTPM_VERSION = 2.4.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
