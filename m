Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318ABC4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 08:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D683C83684;
	Fri, 26 Apr 2024 08:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J1-E1Yg5GrK; Fri, 26 Apr 2024 08:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE9E0836CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE9E0836CE;
	Fri, 26 Apr 2024 08:51:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 971621BF59F
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 08:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90B3540168
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 08:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sa4PPiyVNa3F for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 08:51:39 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 26 Apr 2024 08:51:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98A51400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98A51400C7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=83977bf83=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98A51400C7
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 08:51:38 +0000 (UTC)
X-CSE-ConnectionGUID: akXh0zdvQmKg1sDpvwuMnA==
X-CSE-MsgGUID: LiBgy+zPTW6viH1eEb0HgQ==
X-IronPort-AV: E=Sophos;i="6.07,232,1708412400"; d="scan'208";a="22777762"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2024 01:44:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 01:44:03 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 01:44:02 -0700
Date: Fri, 26 Apr 2024 14:10:58 +0530
MIME-Version: 1.0
Message-ID: <20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com>
X-B4-Tracking: v=1; b=H4sIAJloK2YC/x2MQQqAMAzAviI9W5hlKPoV8eBm1V42WVEU2d8dH
 gNJXlBOwgpD9ULiS1RiKNDUFfh9DhujLIWBDFljqcXEa2Ld0Z36uHijj2GVDV1Hlo23xlMPJT6
 KJ/c/HqecPzyuovpoAAAA
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1714121499; x=1745657499;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=vGgFtQp9W9fkkwVHLq085AzWa50Aucp9UDLSBD/SQMA=;
 b=znQI7yQ8ojhdd/JXPsseFe5HVBHITiNHV5lzwwnzASpAwx5He2tEhR/f
 pTKpgJaIryGAMkc4ypewYKGe5MMiTum/UQzBiOE9J8UuK7IAopQ9tm6vC
 yQNx/mlol2zAvoUXfrTUQ3W74OE34BFJv6CBlzo/lGqx5wWiY2paaAiHZ
 h32T48qI5MvufRsshUuoTvf4sPULufOgYZuBiXh6U3h+BtKKjI3BJvIDt
 pK8YfwzehlyPTj1dyG83HvoJ+L56eTJ/awc+tjqQrTisA9vs1tEH6MwRp
 SfBaQOS8txxa/wb1WnovLF0/CHHHCWGTX1ota/aaqqHRIx/1znchavjwq
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=znQI7yQ8
Subject: [Buildroot] [PATCH] package/busybox: refresh busybox.config
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refresh busybox.config to current version (1.36.1) default values.

Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>
---
When `make busybox-update-config` is executed, the config
CONFIG_UDHCPC6_DEFAULT_SCRIPT became empty. But it's updated to reuse the
value from earlier bump as mentioned in the commit d68b617993bd
(package/busybox: update to 1.36.0).
---
 package/busybox/busybox.config | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index cfd16172fa..2c8e51cd6c 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.36.0
-# Tue Feb  7 12:34:02 2023
+# Busybox version: 1.36.1
+# Fri Apr 26 11:38:40 2024
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -336,7 +336,7 @@ CONFIG_TEST=y
 CONFIG_TEST1=y
 CONFIG_TEST2=y
 CONFIG_FEATURE_TEST_64=y
-# CONFIG_TIMEOUT is not set
+CONFIG_TIMEOUT=y
 CONFIG_TOUCH=y
 CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
@@ -969,6 +969,7 @@ CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
 # CONFIG_TC is not set
+# CONFIG_FEATURE_TC_INGRESS is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y

---
base-commit: db37b0e27d3c54d27b854edbc3253d29f512a6ee
change-id: 20240426-refresh-busybox-config-b724e0c40c29

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
