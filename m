Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3E1C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 13:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33D383D70;
	Fri,  8 Dec 2023 13:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33D383D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x38c2f5rGWZ0; Fri,  8 Dec 2023 13:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1044C83D22;
	Fri,  8 Dec 2023 13:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1044C83D22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 448381BF83C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D05E83D11
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D05E83D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUjuKEe5mNkZ for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 13:53:55 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0805F83D70
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 13:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0805F83D70
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c09d62b70so24613845e9.1
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 05:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702043632; x=1702648432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vb/5u+YLLKmT0pdUXu9xrytO7lFXNacZ2neO7LOqPsw=;
 b=ZQOfMUwS2H6t3btkS6hoD8fcyzNs0koCbcuSOS0/n5CT9kMCqlaPrdsR5xivNn9jJn
 g3U0Py9ozPYQnm62OQ2i17oiYiJZdh9hnH+7p1XaK/rNPXouT1FWvJ2lr6+OhNhZcf/s
 1Z5Rt6FBom2ufB9xALWTip8+Sh5Yd7PlFqJvofwDNYR1E3MZ8OGEVMN10VUmghEQ8ffm
 29xZGLZhem6EmZ5xQsN1Lf3AUNak/dCfG8g1r7hKK/zW79U/GpGh5CfB+99LWUT1OCqJ
 t9HZGXTHdfBkMG5D52zuwaF+2UwqsJMmSrIhzEgjmOkQ9LM7lOrUou7iFCszwfDPLTyM
 g2wQ==
X-Gm-Message-State: AOJu0YwLLyRODafvGx238Nt6WLS79TaQsrzh1PkZkevcAf2H2e3JqMw5
 Az1tyr9fHdQaUFaTZ+GeoLXTRPXRd4H7cOBWKTM=
X-Google-Smtp-Source: AGHT+IEWCPwfPPb5p4+9ltrVOnPpMHC3WyLrhi0md2XZ20jCJksgiOvdJmATRvLpQJvK5y+t6geyXA==
X-Received: by 2002:a05:600c:1d13:b0:40b:5e21:c5db with SMTP id
 l19-20020a05600c1d1300b0040b5e21c5dbmr1744968wms.169.1702043632274; 
 Fri, 08 Dec 2023 05:53:52 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c459400b0040b349c91acsm5227705wmo.16.2023.12.08.05.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:53:52 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 14:53:27 +0100
Message-Id: <20231208135329.1352567-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702043632; x=1702648432;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vb/5u+YLLKmT0pdUXu9xrytO7lFXNacZ2neO7LOqPsw=;
 b=2No3qCCAkaw27uFdMo8ZdvJE7x44QVr/QiODGCyFrrh5yIqM9b/zSNnSAo19AiiV0F
 uztheSvGC8pjc2qFKg7ieqh2ZQEq6ZOscsjsLq2KAIB39LojRlzkI4cK2+Prc7xhT/89
 Rpzfh/h/0DXSunQ1JN656o4Gv6WeuA4kQyd8yyQ4TFArCCzL7iv0bwQavZefrITcZoih
 A5NAXFe0VTI0X4GUzmQUlIB8AEHMIzNXP5tJiNYrnxFS1dD/ilsCVzMqh6s0DImXUHW/
 BlUAxhtIzZP+XXHx9eFoBTC57sq1fLGAKzxYc4B3N5vSJGUPHUKU+lgLzxpnHKy2czSI
 /Tjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2No3qCCA
Subject: [Buildroot] [PATCH 1/3]
 toolchain/toolchain-external/toolchain-external-arm-arm: bump to version
 13.2-rel1
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated to gcc 13.2, gdb 13, binutils 2.41, glibc 2.38.

The x86_64 host variant prebuilt toolchain is built on RHEL7
(glibc 2.17) and is likely also be useable on OS versions like
RHEL8, Ubuntu 18.04 or later.

The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
(glibc 2.27) is likely also be useable on OS versions like RHEL8,
Ubuntu 18.04 or later.

Tested with qemu_arm_vexpress_defconfig.

Release note:
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 .../toolchain-external-arm-arm/Config.in                  | 8 ++++----
 .../toolchain-external-arm-arm.hash                       | 8 ++++----
 .../toolchain-external-arm-arm.mk                         | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 9b314795cb..bee8d61164 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,7 +3,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 12.2.rel1"
+	bool "Arm ARM 13.2.rel1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -14,12 +14,12 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 12.2,
-	  GDB 12, glibc 2.36, Binutils 2.39. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 13.2,
+	  GDB 13, glibc 2.38, Binutils 2.41. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 2c1af4cfcc..e979e5f508 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  d73f230bb946231b648a960b719f2cc1afc792ec2e36f9abc25552f00923a926  arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  860f49bc60d559f06408f07a24bc2a09e5b8f9118cfe1daed521ab321c03c78e  arm-gnu-toolchain-12.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  df0f4927a67d1fd366ff81e40bd8c385a9324fbdde60437a512d106215f257b3  arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  8ad384bb328bccc44396d85c8f8113b7b8c5e11bcfef322e77cda3ebe7baadb5  arm-gnu-toolchain-13.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 164b60e6ca..5962121af6 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 13.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
