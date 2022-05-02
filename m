Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668B9C433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5AD60F93;
	Mon,  2 May 2022 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlPOnWQHqEgH; Mon,  2 May 2022 20:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05F2860F87;
	Mon,  2 May 2022 20:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4D41BF30C
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A34240AAB
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 20:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYQ5_ERqRMwH for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 20:03:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68FD7408D1
 for <buildroot@buildroot.org>; Mon,  2 May 2022 20:03:27 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id a76so4614382qkg.12
 for <buildroot@buildroot.org>; Mon, 02 May 2022 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXGfHC540UcrxQUozDOtS3W0HTI4RycgnOOSVEv3WIM=;
 b=By2Gc0kS27iTCcGFgCNhsgXrNpPo0RuwXq18dmJabNBZ1V0+w7GOV0JB/92E2ZpJSh
 q2tqu8oyXFq2OSBqCU/r/Hanssw6N10ixXlMsiS7HsJW8ETjSkVyKXTx0RhyiK77Fxai
 VFprudODgpd94LfKPBKep9LDAoNQnQmGU7nnjN7QeTcnjAjRcExn45LLBYzL2S+Uc4UX
 YFFLMCnh33Az3edjZPm7xnSTXumiQF7r4ycycgG208PIlzsaDiKOnp3XML8YOTOL8RvA
 62UOiA2kb2YWFdYakKb1PmsOjIhCjgzhr1/TUmt4UEiGdOXuIbPP0yM4L5q8eVbGXEIB
 5bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXGfHC540UcrxQUozDOtS3W0HTI4RycgnOOSVEv3WIM=;
 b=StkRV6kAEYyQK9j+3WGy72nipiJFQQiVMtVXvVI9B1ObV6B6WnmniIJjniPZb3Nn0X
 ZRUaUgUM1v3DtgShx2L7JWTpQyMYegSMlpWAyA1ur5x287v68gP8a4pzIFT5Xrp4c8x4
 EIT7eNy/iLhwInNB9WrLYblpPIQPApF68ricinNCVOXR/LVU7moB7DwMfLjI3qgmcyGl
 7K8zUuIHWF4zFR4Ubg2VFMoNiDZMelwzIY6eoNh8MHNegVbHzFSxFXR3nkf8hCzzZPxp
 cgdiHLElKEJegt/mhxo4aJnZcu0Pn+mlkhl7RPm3zVCT5dE/ffK0IdfzfbDw7dBIfolu
 XWVA==
X-Gm-Message-State: AOAM530nrdQM3tAkjswhmPXrgjvEwhHULmzfUbY6EumPQxsjQmzYL2IG
 WaxN8d7DMg6cqjLCHjNUnH69xYkcREc=
X-Google-Smtp-Source: ABdhPJy9g4sz9+KX6VOZfYB6NoTzdszDjAL4GrbxkDx++ESRkv2WyPiUcPEmUhWVOHxpzg0yxt5g5A==
X-Received: by 2002:a05:620a:993:b0:69f:d0fb:48a5 with SMTP id
 x19-20020a05620a099300b0069fd0fb48a5mr6487302qkx.562.1651521805780; 
 Mon, 02 May 2022 13:03:25 -0700 (PDT)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 j127-20020a378785000000b0069fc13ce1easm1845130qkd.27.2022.05.02.13.03.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 May 2022 13:03:25 -0700 (PDT)
From: ckhardin@gmail.com
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 13:00:36 -0700
Message-Id: <20220502200036.61876-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] toolchain/toolchain-external: add aarch64 as
 a hostarch for arm tools
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Charles Hardin <ckhardin@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

The gcc toolchain is also released for an aarch64 host target and allow
that configuration to be used as part of the configuration. Tested on
on a aarch64 linux docker.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
__
Changes v1 -> v2
  - use HOSTARCH directly in the .mk (suggested by Baruch Siach)
---
 .../toolchain-external/toolchain-external-arm-arm/Config.in    | 2 +-
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash | 3 +++
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk   | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 0fbeba6aae..ca9831e05f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index d58692de53..1fc2c5de57 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,7 @@
 # From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
 md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  0f1c5c90f5c62e1d1066f75fb3e51e21  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
 # locally calculated
 sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
+sha256  fccd7af76988da2b077f939eb2a78baa9935810918d2bf3f837bc74f52efa825  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 4392205105..8731a4f0e5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -7,6 +7,6 @@
 TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.32.0 (Apple Git-132)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
