Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2365CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 11:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B28F1831A2;
	Tue, 31 May 2022 11:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qImmv3M5B5ce; Tue, 31 May 2022 11:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA7A183180;
	Tue, 31 May 2022 11:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 704F91BF373
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 11:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F1DD41BD4
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 11:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3iYaySFtjFr for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 11:00:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E4EA41B9F
 for <buildroot@buildroot.org>; Tue, 31 May 2022 11:00:09 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id q1so9349109ejz.9
 for <buildroot@buildroot.org>; Tue, 31 May 2022 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ogNNE+2fHHHdkbG/X2gCLzdJff0B+Got60dfwoxyoPg=;
 b=PryT8+v0SHyeLzkRqBE50IsxgQPHIqlZevwjhdDGCfKbk/RqxSgJAxrn99qoMysNPh
 6kk1+s3X1z5mz2wM3c7/mH0SLUBFWyykEFyounQbHbZX1hFhEc99y0o+zTeeD+33JFLy
 0+kTAiWTO4wqXlalx/hWKDcxho/qllobTIZUm4CLyGFE/CQmCyLLA07jxrr8hu84IYvv
 Te2SPUdTznt64nLty0a72dyNaxN1IJm5lc/sr1m2oRPp+J942QbLctgeIKtZg1+/PWh+
 UKFW0yYxF0ZFD3p+NegpIjk6QR/FijzAMRLBpc10QWImcuEagawSxUjqCOYI/PVDKyHQ
 ZAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ogNNE+2fHHHdkbG/X2gCLzdJff0B+Got60dfwoxyoPg=;
 b=lRoUZY2xuqnJNCQSkQrawPdI1yX9AgX/FcxAB8cheMGR0uPjujeyrBCFx/6ZYQZygC
 infLzeyMo6NZQlKQEKDM9q7YoQgc046/s6m8BgFj+LXxhg4ufcCBTfJfK1Z92NFX6lEe
 nGipuMR+/gyZm7Ib4yEFliBy+n6qvGNV4MzOfiUK/5GUsYy0bzHk7/NVCDC5HVIUW0KW
 i1/GuI3XcUcXcTxBozrDXFN5vDViJpjQW/yZmD3TxZxL5M/0VQxLm6pnKUJYyIAXQ7Ln
 a7dlgtq2UgPcniWRTSITbP24eYx+4F6IgsiJ7K69Zq87XDx7DBlTCi6G6stR8fKjYXsx
 FTEg==
X-Gm-Message-State: AOAM533boWlE2hPheNV7KWNqjvkEGmq6qXLN8IsmKk0HvkFE3rgaclmb
 brnigblLaZFN33z2io78H/qk4mo9uhHvSg==
X-Google-Smtp-Source: ABdhPJw2KreeoDDLzIf9nby7tAhbpNnwKFn/WY6eudunr1yew8QXbwkaSaurUsysLHUW7FCKrILJAg==
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id
 g8-20020a1709065d0800b006ff08eddb63mr29227612ejt.408.1653994807306; 
 Tue, 31 May 2022 04:00:07 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a50c44e000000b0042bdb6a3602sm8188793edf.69.2022.05.31.04.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:00:06 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 12:59:05 +0200
Message-Id: <20220531105902.204022-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220531105902.204022-1-heiko.thiery@gmail.com>
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] boot/uboot: bump to 2022.04
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2022.04 a host dependency to gnutls is required if the
U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_GNUTLS to
solve this problem.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2: add new config option as proposed by Thomas

 boot/uboot/Config.in | 12 ++++++++++--
 boot/uboot/uboot.mk  |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 953c36135e..bbd955b5b4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2022.01"
+	bool "2022.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2022.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2022.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -182,6 +182,14 @@ config BR2_TARGET_UBOOT_NEEDS_LZOP
 	  the case when the board configuration has CONFIG_SPL_LZO
 	  enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_GNUTLS
+	bool "U-Boot needs gnutls"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires gnutls to be available on the host. This is typically
+	  the case when the board configuration has CONFIG_TOOLS_MKEFICAPSULE
+	  enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cb26fc8d3e..5808e30818 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -227,6 +227,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_LZOP),y)
 UBOOT_DEPENDENCIES += host-lzop
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_GNUTLS),y)
+UBOOT_DEPENDENCIES += host-gnutls
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
