Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561C5C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 19:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE62881E1B;
	Mon,  7 Aug 2023 19:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE62881E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQS2Ibpa5dtu; Mon,  7 Aug 2023 19:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7E881E98;
	Mon,  7 Aug 2023 19:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC7E881E98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6F8B1BF951
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFA7A409A0
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFA7A409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFPTmDW7e_JO for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48C4C4098F
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C4C4098F
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe501e0b4cso18233735e9.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 12:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691438330; x=1692043130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mKoYTBMvQ9RCVHxhnni4ajLsYg+QpywygX67eCTpYi4=;
 b=KAmJn93SYVb6aIC2ap3oL2cF5byjhjAGZt3zNjJz+pnknS3wyVuBHRiM7Em9jWk4/M
 3li1mTIdB5zPShoTI949YjRJqJHqDlnLMYVzGbtWMgSv+2nNtg1qw7e64YiyjdKKXKsg
 5nttKBGOtS5b23hyR6tV7x5z0cH6uJGVeL/s3hgzoMyE9MxkGeropjuYzkyHuRg/Q4qZ
 +A0EIQCKOutOIV47CertJLJm//JSb77mQ1he/0/6Sa5/7Ct2FoWxD/aqmIGQtwvEQTXP
 COcIRwGtMFKFmFdR3ijhea56CWBXAEJaHUTQOzzNM8e/FC2jhVDdVw+ePQLtW73kXPYF
 TzZQ==
X-Gm-Message-State: AOJu0YxrgY06erlUJhQnPl+OkJejtPiWiFKfx7iIR5vW3ozdgn2NcT2s
 kEfqlzIuhK9FPk24Kzn5JQY8Dt31iTQ=
X-Google-Smtp-Source: AGHT+IFPY1smKrFD5dQgC3au5krIC37mwT1IYVCOjHSPYhMa4W6wJaLH0xLAYitg6oepdVrind+gSQ==
X-Received: by 2002:a1c:cc16:0:b0:3fe:15e7:c8a1 with SMTP id
 h22-20020a1ccc16000000b003fe15e7c8a1mr6658844wmb.16.1691438330017; 
 Mon, 07 Aug 2023 12:58:50 -0700 (PDT)
Received: from p1g2.home (2a01cb000fac0c0088f09ee77063439d.ipv6.abo.wanadoo.fr.
 [2a01:cb00:fac:c00:88f0:9ee7:7063:439d])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adfffcb000000b0031779e82414sm11451294wrs.79.2023.08.07.12.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 12:58:49 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 21:58:44 +0200
Message-Id: <20230807195846.1553615-2-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807195846.1553615-1-bisson.gary@gmail.com>
References: <20230807195846.1553615-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691438330; x=1692043130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKoYTBMvQ9RCVHxhnni4ajLsYg+QpywygX67eCTpYi4=;
 b=se5ehg9ZIdTXghG0U2bId+cS9SXNwZEDQuRcWdad4hWc3ia1B/6dhTRV/c3cnLdQLq
 7IMhOhqTjqNghNcX/3QFO5Bf8LqCPlEpv9a8kF7/jjb3azDaIO6AKbTVdtH7ETk4P+di
 toWenw+IuHPLIraw/6km4lyfwlPLUjMen1bUjcET+07X97IewwZPrmzis0ThBMP7IBnw
 yj/fuMaqEGHazrBrC1exc+X2dudk//z8fdwu3mk2asJ95tkkbxl1m9tL9s5hnxkhSP8t
 K7UjnqAr2kRUXkXXdBenFrKjpImuajRjwDTjMLKBWvRCVPo7r+UmrRpoobHJQirX+38Y
 aruw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=se5ehg9Z
Subject: [Buildroot] [PATCH 1/3] configs/nitrogen8*: bump atf version to v2.8
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
Cc: Gary Bisson <bisson.gary@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Based upon NXP lf-6.1.22-2.0.0 release
- This version "fixes" the RXW segment permissions warning as well as
the array-bounds errors

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673582
https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556175
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673585
https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556176
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673588
https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556177
https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673590

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen8m_defconfig  | 4 ++--
 configs/nitrogen8mm_defconfig | 4 ++--
 configs/nitrogen8mn_defconfig | 4 ++--
 configs/nitrogen8mp_defconfig | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index dc9c1acf78..20f492c045 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -29,8 +29,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-lf-5.15.52-2.1.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
+# Latest revision of branch boundary-lf-6.1.22-2.0.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/7e3484cc.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index f021a30ad8..b7d62681db 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -29,8 +29,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-lf-5.15.52-2.1.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
+# Latest revision of branch boundary-lf-6.1.22-2.0.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/7e3484cc.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 88925cfda7..c205b90ebb 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -29,8 +29,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-lf-5.15.52-2.1.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
+# Latest revision of branch boundary-lf-6.1.22-2.0.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/7e3484cc.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 956c3b7bc1..3ab4f15167 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -29,8 +29,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-lf-5.15.52-2.1.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
+# Latest revision of branch boundary-lf-6.1.22-2.0.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/7e3484cc.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
