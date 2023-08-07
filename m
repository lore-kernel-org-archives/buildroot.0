Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1382CC001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B2D81E14;
	Mon,  7 Aug 2023 19:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B2D81E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1xTaYabB5x4; Mon,  7 Aug 2023 19:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E53D81E15;
	Mon,  7 Aug 2023 19:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E53D81E15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B68BC1BF284
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FE6C81761
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE6C81761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydEdfQjz3Ww1 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FB108149D
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FB108149D
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fe24dd8898so42253865e9.2
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 12:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691438330; x=1692043130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kN8sfLlWlxAsR+Dv7WzvjK/vcPgQfCQAOI2AiS58dY=;
 b=KwDPAHLRXiLiH55DW9iDthwDu4jJ4gFGgV8DqMAYluar4ld4CplUWrrn/2xk6cqMau
 zfQHrM9+EcaQIaNg5rWgxQKqKac+EdACbf/pDiwzgOjuWHiyI7UsspD7C2SoUwhfTfJo
 IGkGMHT5bNcOmhD6WqMV2W2heIv539Bv1NvLLu7Xvepgr6UW1UyIjfY+8iBzElhRMr9J
 0VBvM6z8RQqL+Ot3tjQt5ahnBOpFhGKQYx3hxOhmzEWYGmoV91t7EU3XGR6QV9333ylv
 fxc3X77ohwj0Z/nCpz0lkXlAsnoYeb+3QxiXgZ7YaJdf+fjsT4xSPnkvHZCAkwur43uL
 9r9w==
X-Gm-Message-State: AOJu0YzIttq20TfIo50NIozkrMUwJ80HQxvOqYL6d4AT2HAr8r3Yyocd
 2AwdoAnVbEWmCw4obzLogkg3Gv+5gqI=
X-Google-Smtp-Source: AGHT+IEffoYfrXkz8qgPSYOVlWbvz1F7eOo2jXQSLbJqGquzzjAFUl9Hl5vtsoX/d8+lbo2hqIA3vw==
X-Received: by 2002:a5d:4c42:0:b0:311:162a:ce2a with SMTP id
 n2-20020a5d4c42000000b00311162ace2amr6426239wrt.29.1691438330390; 
 Mon, 07 Aug 2023 12:58:50 -0700 (PDT)
Received: from p1g2.home (2a01cb000fac0c0088f09ee77063439d.ipv6.abo.wanadoo.fr.
 [2a01:cb00:fac:c00:88f0:9ee7:7063:439d])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adfffcb000000b0031779e82414sm11451294wrs.79.2023.08.07.12.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 12:58:50 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 21:58:45 +0200
Message-Id: <20230807195846.1553615-3-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807195846.1553615-1-bisson.gary@gmail.com>
References: <20230807195846.1553615-1-bisson.gary@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691438330; x=1692043130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kN8sfLlWlxAsR+Dv7WzvjK/vcPgQfCQAOI2AiS58dY=;
 b=FDZLMwbp8VOjjwA1IYkQSUkqJPGxsJTx1Fd44s8AFDT0SDglQueBrKfmGkQDycHjlT
 xsV5q+7MRAwjHmmd5IIONDUA3VwuE3bv+JCTcje6oKw6AS6mg+bt0rhHQAsnQRFMvcD9
 fpSBtp1lN/074Zi4FngmtHNhpiDtj7ZUWz4+/Jf9iPmbeXvs3SG/skMZh9yJwv6Qkm4g
 bMhx8GzOI8tWH6yPMOzw0mnBYlgy92v/GKWikiGY3ynZeThDhjXKiwQDPdKISiuew8xF
 9Y2p4pQ0IcC6zd2UWm42H3FX269L7bmUlkOLMzB8vH2LNOKLi9l7qYhgYSWqwRkfu7iX
 5npg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FDZLMwbp
Subject: [Buildroot] [PATCH 2/3] configs/nitrogen*: bump u-boot revision
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

- improve 8ULP support (rev A1)
- add mmc user fastboot support
- add fastboot partconf support
- add nitrogen8mp smarc support

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen6sx_defconfig | 2 +-
 configs/nitrogen6x_defconfig  | 2 +-
 configs/nitrogen7_defconfig   | 2 +-
 configs/nitrogen8m_defconfig  | 2 +-
 configs/nitrogen8mm_defconfig | 2 +-
 configs/nitrogen8mn_defconfig | 2 +-
 configs/nitrogen8mp_defconfig | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index b4ea1b9112..c2ca324d53 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index ed9e13e6eb..f805ae94b0 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index c4520aeb89..068df6eb41 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 20f492c045..4a2a259d54 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -40,7 +40,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8m"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index b7d62681db..bf98244b1e 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -40,7 +40,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mm_2g"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index c205b90ebb..677640cf8d 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -40,7 +40,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8_nano_8mn1gr0"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 3ab4f15167..6f49dfc839 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -40,7 +40,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nitrogen8mp_2gr0"
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # Latest revision of branch boundary-v2022.04
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/c2042594.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot/archive/7e7eff74.tar.gz"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
