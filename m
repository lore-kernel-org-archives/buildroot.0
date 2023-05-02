Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144CAC77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 15:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6732F83B20;
	Tue,  2 May 2023 15:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6732F83B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJRj56Ude9zW; Tue,  2 May 2023 15:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB8583B1B;
	Tue,  2 May 2023 15:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB8583B1B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E00741BF41B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C629383B1B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 15:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C629383B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewOJ5QeCF5JK for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 15:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC1AA83B19
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1AA83B19
 for <buildroot@buildroot.org>; Tue,  2 May 2023 15:48:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2fa36231b1cso2510295f8f.2
 for <buildroot@buildroot.org>; Tue, 02 May 2023 08:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683042486; x=1685634486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mnDjG/OospU/AzwlY5eQz/13hPC2Exh0+yT0C6AKn7g=;
 b=Au8zseWl2AGdtDfESbR6e/+mQP5yd+015A9uh6bwXrAM2DHAjmtmIAXDelYQudQz0K
 t/Gl1yksp2hl1Yox1avoenZ9FjvkKkFTNRcOlmRx5Zrt/ku4QK68/+WKpn/vhjkUHIjf
 GB/Z2kcnJrZ9Z/lw2LFD5brmaXHflkdnFIgYMr6lz+OQU4Mwtj9oH5pseU35f0nn9cv6
 ZXc6D0674G1cjkbCfW2kFba2BtJeKsEpQ2gGQVuekjQTqOjfdgJx9vhxE4Z4+QT4tjcJ
 c6fe0Y8N39ZbWJ7homMuHJ92zZjBQBo+/5xsgJE0y4Q0RCYdl3LcmMBGmMNOZxUsSkTq
 TORQ==
X-Gm-Message-State: AC+VfDw1GwtrGZktOvSWJnS1m+dJyyklVBT8O12nQy+o+uetxR+yfmGJ
 GFldidpWmTouKVwcfrySKVdkC1fs3G0o0ujA2Cs=
X-Google-Smtp-Source: ACHHUZ64j/Qk0MzpcLppRyP6LNwnzyw3j0IYnEl8rpnuBpPlPQChyusADnK3byVq//D823q5n+6Sng==
X-Received: by 2002:adf:dc83:0:b0:306:30e2:c84c with SMTP id
 r3-20020adfdc83000000b0030630e2c84cmr4041181wrj.49.1683042485680; 
 Tue, 02 May 2023 08:48:05 -0700 (PDT)
Received: from lmecxl1178.lme.st.com ([80.215.39.12])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm31342990wrp.59.2023.05.02.08.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:48:05 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 17:47:08 +0200
Message-Id: <20230502154713.1490788-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683042486; x=1685634486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mnDjG/OospU/AzwlY5eQz/13hPC2Exh0+yT0C6AKn7g=;
 b=xva3Zx9t24/3Kmg3cu6xY2Un0d2tnwNb1XrDwKv3cRKSzHJ0lEST+Ut2uGAM53K8fz
 Oti+7tyViggwxRDOa1m8ZZ/vfilAE3ArGnXzKXaylMurUtmR9bN6Js7p8wL3GiCEww1O
 14AvWSKq6gAnVfWVGP8oKioK2IpKfVrIJqD0mfH3+o0KDJYKwzkxLycoK+g/sNx6t9a+
 +K1iI5D3IcA39Vec1w2MfBSiuAU6eO1nAEAmaL+NQBND+oK6NFHsKkymHC02yCKEDgLw
 9QetLIizvb6gOzO68hk8vh6SqdJuf7gSucijzHLVKIgZtBkic70O3xSDpBr5cKF3GBuJ
 fbpA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=xva3Zx9t
Subject: [Buildroot] [PATCH 1/6] configs/qemu_arm_vexpress_tz_defconfig:
 don't embed optee-benchmark
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package optee-benchmark is no more maintained by OP-TEE community
hence don't enable that package in qemu_arm_vexpress_tz_defconfig.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 configs/qemu_arm_vexpress_tz_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 576c441154..b24fab5e42 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -40,7 +40,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
-BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
 BR2_PACKAGE_OPTEE_TEST=y
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
