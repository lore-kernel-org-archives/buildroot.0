Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E3BEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 06:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4A84096B;
	Mon, 11 Sep 2023 06:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C4A84096B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00JcrdHCgntX; Mon, 11 Sep 2023 06:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C8E40965;
	Mon, 11 Sep 2023 06:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C8E40965
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBA341BF5A5
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 06:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A033A4095B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 06:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A033A4095B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSmat_W_GZm3 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 06:20:26 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F21040950
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 06:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F21040950
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7927f24140eso142697939f.2
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 23:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694413225; x=1695018025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlslObjBTo4yjgTngyLLqGOHj15wTSjXw9vGqGYZIEQ=;
 b=SjBXt20obkKpaRmwOcaj4fPHUozoB10CWG03eZ5LjR1mNdp2n4ku/Y71+ePEkWuHN9
 QbSRHCvpvOyZzwkqTHkD7eJOMHviz6fBmQEY0wElWe0bKqCwtajSmbr3PuexchvcEmZQ
 Q0CqfESvlk2IUZWKakaxnGDbo6unRqJRBuswIv72bE+yEDbWmaNYjpfDXuv9a7E7p4Df
 4F7gvwiM9R/320WYZpHH7BBwZ0GKHQvXTFlSyznwjcctzLpncCaWRQFZ2ZpzZft1LZJw
 c+0ebeVqYzkqIi1bP64bxQBTcyz0DOzc/r7renQy0ojbn29WhsaHxO/oU86Lx8Y97Twk
 dr7g==
X-Gm-Message-State: AOJu0YxjYvL0c7NUeHDmbdseTyPHBiheRNq/eNUvkR4EL2E9igWzwQDS
 7WVYsFNirfthtOD0ualeNRYrjei4KZ4=
X-Google-Smtp-Source: AGHT+IGLgZQd+HsovKCq9tHs3S2cEw+fUMsNR2R7uEpCRHN0ptKMd2jD3CO+SEu/AtGywD5EiSrsig==
X-Received: by 2002:a5d:8057:0:b0:790:c259:4ee5 with SMTP id
 b23-20020a5d8057000000b00790c2594ee5mr10235495ior.8.1694413225099; 
 Sun, 10 Sep 2023 23:20:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-182-107.hlrn.qwest.net.
 [97.118.182.107]) by smtp.gmail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2059003jal.69.2023.09.10.23.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Sep 2023 23:20:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 00:19:40 -0600
Message-Id: <20230911061940.2392419-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694413225; x=1695018025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wlslObjBTo4yjgTngyLLqGOHj15wTSjXw9vGqGYZIEQ=;
 b=kWYsdJNIz4LZ6VvizrgSyKjJZ4pBsrfKf0qwU9SKyIdeVwHOfjpwAy0xCswoob1By4
 C9wqKdh5rnuJeffIpiPSEwRmplQuNNTRYK8U8kknJnqJeQXURs3n5Ql3wLl41UDqdUz0
 IBSj4HTn/Nnm8GzMpt1dXmcFazqbmqaqYMeBf0YGo+1u/8hiHmaAHTWZh6U49iF5+cfJ
 Z844U4Yl7U6YYza6AeI3cCDfLK+YDmFyLAsb2rzvA9AKDOjsmOA4xES8JIF6hAc+F6aY
 O9fAJyocI9To2ilLfhi8a+11fMPMLzf6mOR3PitFsr4nYr0DHO3QhbCZz+78aSeRPISC
 Etzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kWYsdJNI
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for
 u-boot-initial-env install
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This file is needed by libubootenv for fw_printenv/fw_setenv and
library API's to function when the environment is empty.

See details:
https://github.com/sbabic/libubootenv/tree/v0.3.4#replacement-old-tools

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 boot/uboot/Config.in | 7 +++++++
 boot/uboot/uboot.mk  | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 21f19db890..d7f2912ebc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -506,6 +506,13 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
 	  MLO on OMAP and SPL on i.MX6 for example.
 
+config BR2_TARGET_UBOOT_INITIAL_ENV
+	bool "Install u-boot-initial-env"
+	help
+	  Install the U-Boot u-boot-initial-env on the target.
+
+	  This file is typically required by libubootenv.
+
 config BR2_TARGET_UBOOT_ZYNQMP
 	bool "Boot on the Xilinx ZynqMP SoCs"
 	depends on BR2_aarch64
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a880..491f654cec 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -138,6 +138,14 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
+UBOOT_MAKE_TARGET += u-boot-initial-env
+define UBOOT_INSTALL_UBOOT_INITIAL_ENV
+	$(INSTALL) -D -m 0644 $(@D)/u-boot-initial-env $(TARGET_DIR)/etc/u-boot-initial-env
+endef
+UBOOT_POST_INSTALL_TARGET_HOOKS += UBOOT_INSTALL_UBOOT_INITIAL_ENV
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BINS += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
