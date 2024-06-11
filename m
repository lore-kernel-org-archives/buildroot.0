Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20418C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 676A86064A;
	Tue, 11 Jun 2024 18:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZnacvdQ5Zke; Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A55360A7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A55360A7B;
	Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D19691BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A91C860A3A
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78Kp8FTnhrbM for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 953AC60608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 953AC60608
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 953AC60608
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:43 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-70423e8e6c9so2941000b3a.0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128842; x=1718733642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vn95o9FvDaLC5ANqrpdzKUV0RHttB3XiRjEkEqs0sb8=;
 b=wrOrflE/CU++D4KCf9PpCRmBNgoIomJFth0q/Zz7yeVwHUwHUik5A5DEkXCTDLOc4+
 xGH2CVYRPrZr6gwrfLIKYBx8rxUi2RNsXhu0iFcEyGCDnscyVHoEN1jICJLirntYKU5n
 ABBOjmZnhGR3Yx7WaDf1XQ/QJREYnexH3SlH9xial/3fR2Gy0UzX3lkAfGhF8fkrhLRs
 kutoStlbvmibDoPBfHYB3jZhZBl29FAVqlUXvhfy7ThoHRNMVa4cbh6tDULMsR0t7pa8
 i+0ldmY2w3YAbQYfH22Uauab5dfyhJlQ9mhmHZdysORawcRIigRx0a7Do+SJjUIn20Ig
 /Ndg==
X-Gm-Message-State: AOJu0YyteuR19HLQ21u//HVOIpPW7TQ1RfOAueOxc1fCKjqsFzplQRCn
 iyqqx/vvUGSC9D1vPvT9ETEeLrVc+jwwHB6iBBRKW5dWVN2jyqkuafS1Vwe+
X-Google-Smtp-Source: AGHT+IEN0h1weNRdVgwFoU22TKP2WpLSBgqB8D66JcwtI3INRi2n6UUY9xiCAacLgKcSlLUuz9JOqQ==
X-Received: by 2002:a05:6a20:9151:b0:1b5:fd58:30fc with SMTP id
 adf61e73a8af0-1b5fd586324mr8727764637.41.1718128842293; 
 Tue, 11 Jun 2024 11:00:42 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:41 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 10:59:57 -0700
Message-ID: <20240611180007.2127244-3-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128842; x=1718733642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vn95o9FvDaLC5ANqrpdzKUV0RHttB3XiRjEkEqs0sb8=;
 b=eZe70M1OXvz4FNQjvPFVppNOVIL4q2RUXTNw3mbDnvFHe3UXUU6hNDIjEiFZP+zzsv
 45LxyAnMKOUxjsRM4vqwHy4D4IMQH1vYv4RZCd/rFQkvijURFU4lF2eiQ+h7Y+kgbLVR
 53vrDqWOQ4hpUNyOplpoNOOTf7ZvTNBjQrV9NQgFd22kzdbldM5LEhxxyp0HL8XWEv2G
 mxUgmme59S8KxvRLl7pXuGHe21MeeYZhlW7y5q6K4B2KLmh3jxVypqkO1pA6OWSB+2tz
 fenrwOgt6F0M0JE7M3VKzNsEkHwYekDrQKErnITbnQI3Vkr7Cs3dPRkfBoebRS441nyW
 qLig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eZe70M1O
Subject: [Buildroot] [PATCH 02/12] package/freescale-imx/imx-codec: bump to
 version 4.8.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.55-2.2.0 release.
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/imx-codec/imx-codec.hash | 6 +++---
 package/freescale-imx/imx-codec/imx-codec.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
index 8dab5a5c4c..666d38d001 100644
--- a/package/freescale-imx/imx-codec/imx-codec.hash
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  6bb54f91c3ca18567e14d95d3858022dc9be00dc86e9edfdb544d1240a3b2b04  imx-codec-4.3.5.bin
-sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
-sha256  fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
+sha256  b0744a91c265202a79a019c72f17cae01fd5b63a3ba451592b6c8349d95719e0  imx-codec-4.8.2.bin
+sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
+sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 2b7c346a6e..54ba6f126e 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_CODEC_VERSION = 4.3.5
+IMX_CODEC_VERSION = 4.8.2
 IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
 IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
 IMX_CODEC_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
