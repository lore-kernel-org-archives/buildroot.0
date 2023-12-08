Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C2C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 13:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A767483D11;
	Fri,  8 Dec 2023 13:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A767483D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjcrU22jXR9D; Fri,  8 Dec 2023 13:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9FDB83D70;
	Fri,  8 Dec 2023 13:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9FDB83D70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0DE61BF83C
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A9E66F510
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A9E66F510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOR1n1ZZ4gek for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 13:53:56 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38E3460F0F
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 13:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E3460F0F
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso21899955e9.2
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 05:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702043633; x=1702648433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vtix51ProqLFimynw0sATXCWs+VP7w7zoYZvpP7U8+k=;
 b=Oa9PPh13PP83U7vtcGl/xjg+BKgE4xEVPSIVcWn6afPHrQ2s73qiT8rWozislm1SIO
 GknEvVCqfaWFz0Lvm4i97kZCzR3jNH3s9JzHda7fTRYcOdDgVLd9FK/smhvEfygLGIzw
 w3KH0mbNOTfYU3LxOuLPZG76JFzDjU2NTqctgP9GI9hDQd5W+2SNFItOJTjIHv1BRYIi
 Yg84A+b0GQDNY94MBPCS+D13SlVdO8QxID7VlpQTN1BYM5vAl+aGDsBILg07+lqV+QD2
 dxDO6qThWDiKXz4myxeLdBR7m8H3hOsURp0oaesWiFaty+uVfjR9JCnT2NmkBIXak/WO
 PyUw==
X-Gm-Message-State: AOJu0YxxI33sWH+hNYRjEY4j950q5ItTdAKQd1nOw+YQkd5qUsP9Agby
 5ODAk5okbcN2sfCpt7oxud0p03R/Br6JdWsuZMY=
X-Google-Smtp-Source: AGHT+IEDaPj8n1/2v6b56StfAnsJlU2r1CRGhYNr/ixQfq5r7ymngjwhW9vNESxaZPTymT7lBLzXgA==
X-Received: by 2002:a1c:7711:0:b0:40b:5e1e:cfa with SMTP id
 t17-20020a1c7711000000b0040b5e1e0cfamr5370wmi.53.1702043633617; 
 Fri, 08 Dec 2023 05:53:53 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c459400b0040b349c91acsm5227705wmo.16.2023.12.08.05.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:53:52 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Dec 2023 14:53:28 +0100
Message-Id: <20231208135329.1352567-2-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208135329.1352567-1-antoine.coutant@smile.fr>
References: <20231208135329.1352567-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702043633; x=1702648433;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vtix51ProqLFimynw0sATXCWs+VP7w7zoYZvpP7U8+k=;
 b=oIXHtZXeGm9FlcWE4dC+zgJHERgElSSOZT2TSZAs/OTTiqG2tFAZY0gNp420y99iR6
 E9aa1ht0aaoKq0beXpAjNe2BJe5EZALvfAbNSAcbvx6gkNMn1UMeKkxAFNyLQvuF+/Bg
 vrDIfQfnaSM/Yce+w3PztuPrAmzlYZ1mob3AXMw6yJOTtFdVnH9Tuz/yqpVLigfEoHSL
 SPQeVDM/EXyqVZ6Xq+YFuWL8OXKfqdExolL+mVH/SgRoAyoT0ali6DQf9Hss50JmwYux
 wXwLNDKCcDHKEeljnUCsJmNm+8dbrEXUaB/Q8IPc2Nqiat7UnFxp0nVQgLNXEe/GNwwf
 gGIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=oIXHtZXe
Subject: [Buildroot] [PATCH 2/3]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
 version 13.2-rel1
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

Tested with qemu_aarch64_virt_defconfig.

Release note:
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 .../toolchain-external-arm-aarch64/Config.in                  | 4 ++--
 .../toolchain-external-arm-aarch64.hash                       | 4 ++--
 .../toolchain-external-arm-aarch64.mk                         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index fc62b759e5..2565707def 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 12.2.rel1"
+	bool "Arm AArch64 13.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 6c4847831e..9de90d4b06 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  6e8112dce0d4334d93bd3193815f16abe6a2dd5e7872697987a0b12308f876a4  arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  12fcdf13a7430655229b20438a49e8566e26551ba08759922cdaf4695b0d4e23  arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 9cdf58305b..f9adda8921 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 13.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
