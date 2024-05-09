Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B41C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 06:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 504B683CA1;
	Thu,  9 May 2024 06:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56Ne6KVjA_-o; Thu,  9 May 2024 06:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA1FC83BDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA1FC83BDC;
	Thu,  9 May 2024 06:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 225A41BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C97B401DD
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 06:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hztr763EEola for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 06:00:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8524e0df5=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2EE240114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2EE240114
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2EE240114
 for <buildroot@buildroot.org>; Thu,  9 May 2024 06:00:13 +0000 (UTC)
X-CSE-ConnectionGUID: Edk3MpZhRWqFRRFASg7uJA==
X-CSE-MsgGUID: 0aC3izV3SPWNh1NLWysmsA==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="255097911"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2024 23:00:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 23:00:10 -0700
Received: from [10.40.56.22] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 May 2024 23:00:09 -0700
Date: Thu, 9 May 2024 11:27:01 +0530
MIME-Version: 1.0
Message-ID: <20240509-refresh-busybox-config-v2-1-71a4c8061ac7@microchip.com>
X-B4-Tracking: v=1; b=H4sIAKxlPGYC/4WNQQ6CMBBFr0Jm7Zi2VoiuuIdhYceBzoKWtEogh
 LtbuYDL9/P/+xtkTsIZ7tUGiWfJEkMBc6qA/DMMjPIqDEYZq6ypMXGfOHt0n7y6uCDF0MuArjG
 WFVlF5gZlPJWeLIf40RX2kt8xrcfPrH/pX+WsUSM1itzV1aV7aUehFMnLdKY4Qrfv+xfevJdLw
 AAAAA==
To: <buildroot@buildroot.org>
X-Mailer: b4 0.12.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1715234414; x=1746770414;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Sp2hm2CWtp9d3snU4zCRpf9hPaPMQkvc40MELrqS3Ks=;
 b=bBMJpXmvcomAKVRXPnDhUYuzwOaGftrdDJhPOkqndIQW/uYJUVvdugdY
 5eIKqVlrQXXmq0O8sNc+/Ss5DnBBp5GS0Az/7EcOU7/LAm1kZKwdnykTg
 ITND8GnYw1HwmGSSwOW5ynbVnaTu7EZYF4hgz00/RGs6CCNboHa5IuEy/
 4izcCDbKFFol0Kn2OXUCjyYQh2cR4/EJ3ntUbB5N8Tq5/FlITnjOX0QUK
 S79CDEYh42YmRw/vRCCJqqiGwC2cxj/5Tkqe7vqRYI0oZwCdogMk0bCwR
 +HsfRN/h+PKl7yzgm+AOgchCmZzpkWG7bYdvY9JEV4V0Qs3suVMkQPP/E
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=bBMJpXmv
Subject: [Buildroot] [PATCH v2] package/busybox: refresh busybox.config
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
Changes in v2:
- remove local custom config
- Link to v1: https://lore.kernel.org/r/20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com
---
 package/busybox/busybox.config | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index cfd16172fa..35c01181bd 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.36.0
-# Tue Feb  7 12:34:02 2023
+# Busybox version: 1.36.1
+# Wed May  8 17:25:31 2024
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -969,6 +969,7 @@ CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
 # CONFIG_TC is not set
+# CONFIG_FEATURE_TC_INGRESS is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y

---
base-commit: 121c5f7b422bf393f51e0e873e7ceaef55b0d3d3
change-id: 20240426-refresh-busybox-config-b724e0c40c29

Best regards,
-- 
Nayab Sayed <nayabbasha.sayed@microchip.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
