Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2CBC001B0
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 04:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD734034F;
	Sun, 13 Aug 2023 04:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD734034F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUX-GTpGUEa2; Sun, 13 Aug 2023 04:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FE1403CC;
	Sun, 13 Aug 2023 04:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61FE1403CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC8C1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 04:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D67FA4031B
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 04:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D67FA4031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80vSTG0xrpge for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 04:48:09 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B492040285
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 04:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B492040285
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3a78a2c0f81so2827876b6e.0
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 21:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691902088; x=1692506888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqGTOQp8yTnlHplTa/RmGdZfNiv3R6c4Y3gROnpY0TM=;
 b=kZMt2KVb8bvD8CzPYlaAvCeM8SKtOd7/CnsNX9iiFrquHcaYHAcmBHGhxEnbl6AZmF
 jT1BjxE8I6QJsGNsGb6rAxydQLgMCnH1FSgIsLrgJFHOH/YQBrMZe1DxHETnFTRhaA0a
 x7nbrmGFk7IX1ylm9py58RZdaalSXdXq4lRwhv8UeKlhu7nf/RWpvP5wnakvf/80+D9J
 cJnti68OAjkWpahwyZIcEa9ULTb7ljafOklA16/bdMgzeLCB2kLVi/Oszx37iEczdALF
 L6HPIs0Suhc/y9jm2cDesdV2OzPW0NcVy5SYnhhVSYJYw/FXbYXJmjldlJLNgY45P6Iv
 tyYw==
X-Gm-Message-State: AOJu0YysLYJOFu3ovWJxvFE6TPdn+46yw8qVMBeByFV/yKeuUth5CQJl
 y+Wt0VZvvFo7OmUogHgd04VrucfSM+gPYg==
X-Google-Smtp-Source: AGHT+IEsKVx2yp+YebNhqVs5a1yZA23dvIXr1NYlIkYwYXmtXQTPByfq+4Nc2GWDmEWT9kIYYkOKWQ==
X-Received: by 2002:a05:6808:1312:b0:3a2:f91a:cb08 with SMTP id
 y18-20020a056808131200b003a2f91acb08mr8341990oiv.42.1691902087303; 
 Sat, 12 Aug 2023 21:48:07 -0700 (PDT)
Received: from localhost.localdomain
 (76-250-43-185.lightspeed.mdsnwi.sbcglobal.net. [76.250.43.185])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a4aaa45000000b0055975f57993sm3086715oom.42.2023.08.12.21.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Aug 2023 21:48:06 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 23:47:50 -0500
Message-Id: <20230813044750.5567-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691902088; x=1692506888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gqGTOQp8yTnlHplTa/RmGdZfNiv3R6c4Y3gROnpY0TM=;
 b=grzWvq3dZTih9DzjyX2qL3qdIcafu0KQUF/mABJan00ypYP9zj9akj6FhR3BHlCbf7
 UJZeJebUqNQfvA/2EyPJla1iZWF5h1k57bR5SIW1sAMXsHijxk5x1Ve9990Z2pxIHFrO
 ePF8CnABP97OjF2weq9U74jS0rpGUywpJAen431P3wNIciqz8ooF7EdZAfBFH/3xqImC
 PaMb2qAKJZshvvPUVJfDlSPmmwutIv638ACaGaSg147NdESR+me0h8noX+e1Gh6mv2Nq
 iryweTnLsC9RRYdzWHtsf+mjBXBsiZd3NYpdzTzapQq8wtpW4XsfL75LwyXHi+IdXReN
 LmZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=grzWvq3d
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously, it was possible to select an external toolchain that did not
support the GCC arch tuning the user had selected. This is problematic
because it can lead to confusing error messages during builds [0].

Now, external toolchain selections will be filtered to only those that
support the required GCC version specified by the target arch tuning.

Note: this patch does not touch the Bootlin toolchain config file as it
is generated by a script.

Additional note: there is "soft" support for toolchains prior to GCC 4.8
but there are no accompanying BR2_ARCH_NEEDS_GCC_AT_LEAST_X symbols.
Instead of adding those, just use BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8 which
is the minimum GCC version with claimed support [1].

[0]: https://lists.buildroot.org/pipermail/buildroot/2023-August/671877.html
[1]: https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 .../toolchain-external-arm-aarch64-be/Config.in  |  1 +
 .../toolchain-external-arm-aarch64/Config.in     |  1 +
 .../toolchain-external-arm-arm/Config.in         |  1 +
 .../toolchain-external-custom/Config.in.options  | 16 ++++++++++++++++
 .../Config.in                                    |  1 +
 .../toolchain-external-linaro-aarch64/Config.in  |  1 +
 .../toolchain-external-linaro-arm/Config.in      |  1 +
 .../toolchain-external-linaro-armeb/Config.in    |  1 +
 .../toolchain-external-synopsys-arc/Config.in    |  1 +
 9 files changed, 24 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 62e5ea8667..466b1587c3 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 12.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 0c2e64192d..fc62b759e5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 12.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 4aab41693d..9b314795cb 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index d82c9b8a41..0f4f5eef2e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -52,66 +52,82 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_13
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
 	bool "12.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_11
 	bool "11.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_10
 	bool "10.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_9
 	bool "9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_8
 	bool "8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_7
 	bool "7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_6
 	bool "6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_5
 	bool "5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
 	bool "4.9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
 	bool "4.8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
 	bool "4.7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
 	bool "4.6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
 	bool "4.5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
 	bool "4.4.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	bool "4.3.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
 	bool "older"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	help
 	  Use this option if your GCC version is older than any of the
 	  above.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index 53d5dfd8f2..295a8987f1 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	bool "Linaro AArch64 BE 2018.05"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index c9b84b1d30..1b0ec7cd9f 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2018.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index 015e92f17c..8b3b4c844e 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index b338a72bff..b143ee5e24 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index c3483f331c..985e7b1710 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2019.09 toolchain"
 	depends on BR2_arc
 	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_ENABLE_LOCALE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
