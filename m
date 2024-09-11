Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9EEE49A9
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7145840162;
	Wed, 11 Sep 2024 13:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VpVRIhsrBEl; Wed, 11 Sep 2024 13:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5026F40DF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5026F40DF5;
	Wed, 11 Sep 2024 13:52:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 543371BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F9974022B
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYAN562tz2RX for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.44.123;
 helo=mail1.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F631401B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F631401B0
Received: from mail1.insia.net (mail1.insia.net [188.165.44.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F631401B0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:52:48 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail1.insia.net (Postfix) with ESMTP id 7E2DF3FB23;
 Wed, 11 Sep 2024 15:52:41 +0200 (CEST)
Received: from sb-dev-build.insia.net. (gw-servers.insia.net [192.168.1.1])
 by smtp.insia.net (Postfix) with ESMTP id B5DC55F497;
 Wed, 11 Sep 2024 15:48:37 +0200 (CEST)
From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:52:34 +0200
Message-Id: <20240911135234.2928130-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail1; t=1726062761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OUCCVE67dLmfVmuSF0E6v3PvLgtU78SudE7nfDmbV2I=;
 b=VrWrfGdyUHeK64HqV211NVZ+prNX5gt8L6r21G5Z/CVEP4ge4XfPcVcHpor9OssLUPQHNE
 Qs+pAZm5qpb+MkZJ68jO4AkeCxEfR9ecWAgDDBUzAObLK0apNIf+V9lSqSt/SrPYBwgWtC
 5+ad9ZeqMlgYZAVMmk3L84ykAcTexbIgh/qNkQE2rxOby3NK2YMjb5zhIZny//jWx1Qyr3
 S9HQ9vMCQxualNXaWS/YcmEGLj9h90VqUv639AC7KqKIYaoHiIf8cfLQBi9xnqVnTndC6m
 NgazYMpTDEcgbCUj8Z4HzzW0eye3jvFgU4uxs7a5DUIsLj4h/9era2EVOJOJJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail1 header.b=VrWrfGdy
Subject: [Buildroot] [PATCHv2 1/1] package/wpa_supplicant: add configuration
 for WPA3-Entreprise
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
Cc: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 984959f679..dbd8eea690 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -126,18 +126,28 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),)
 WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS
 endif
 
+# WPA3 configurations:
+# - CONFIG_OWE: Opportunistic Wireless Encryption (OWE)
+# - CONFIG_DPP,CONFIG_DPP2: Easy Connect (Device Provisioning Protocol - DPP R1 & R2)
+# - CONFIG_SAE: WPA3-Personal (SAE)
+# - CONFIG_PASN: PASN
+# - CONFIG_SUITEB, CONFIG_SUITEB192: WPA3-Enterprise (SuiteB-192)
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
 	CONFIG_SAE_PK \
-	CONFIG_OWE
+	CONFIG_OWE \
+	CONFIG_SUITEB \
+	CONFIG_SUITEB192
 else
 WPA_SUPPLICANT_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
 	CONFIG_SAE_PK \
-	CONFIG_OWE
+	CONFIG_OWE \
+	CONFIG_SUITEB \
+	CONFIG_SUITEB192
 endif
 
 # Try to use openssl if it's already available
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
