Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34D0F418C2;
	Mon, 16 May 2022 21:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvUY-A5shIL1; Mon, 16 May 2022 21:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CBF414C9;
	Mon, 16 May 2022 21:08:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC4151BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B86554034B
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvovNIYsgb0M for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:08:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8947A4016A
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:08:00 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id 3so11386397ily.2
 for <buildroot@buildroot.org>; Mon, 16 May 2022 14:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydhpSgbxlGskEq7glsaBEY9n+ofHF4dLTJGuVrWtf7o=;
 b=hExOFfaPhHOOQPPIINDk98adb+ASNufp/vhQsgJZqENg1vNsSvku8KvwpPx9vyKf4m
 3jqjSoDen+81N4W18J/9BnijO+xatOglmi4990ke43xez5VfL/yUKr7soJaaS1EDbF9k
 sIGFR+IVTWwz9N+m1MN20NvIUqWlY8fTMSuFYZM/AtIw8eFuggV4WxG49rrXLd2tho0z
 3954xl7m5ZhyDAMOK4pbtSB5ykTAkt37lS2NBvjems0gM0z4hBKmdr6vJDVMCsCxFpvU
 joQsSWoahlLBCA9cmlRuZb0E/QNix6xwOSphqKNm64NGoFmHy6sxaxAZtVOiho+jALXd
 jWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydhpSgbxlGskEq7glsaBEY9n+ofHF4dLTJGuVrWtf7o=;
 b=uDavlj8xI5dzC5Pj+jptdCuXf4b8sz4F3oVKxaqjvrwC3RKyBGgQ5o8JKbRmaNUQMb
 Ndr+cdhWlwspaNIKRSIsLL8bx30ql6LRJqFLFj8ke1wf2iM9mvnAhg0+G4cNCPhdyHg9
 oNesqPfARSQvMoudvSaPh4HNwkMKx3BTzdEXmqeB5x5Iut3s/gkx2VzcgtfRa4oUpWjW
 coJjPy0H1GHUR670XuXk340JihWfBNSJ32B/CBBkwKWg6XcDmi2wm3yU4IRmg14Zjf3Q
 ZEJgHb9lPaR528Fm5j7gLe/XYTnnjY1qgRF3QF2OzXxCnb58XILbfk4KtDm6FLP4NHrH
 MJCQ==
X-Gm-Message-State: AOAM530ncLPilJUmwxP6EdakpmJiHWYbjJv7jEFwN8cxFZO0tAXXj+Eg
 DpwUD32aynNOt700cuaMuVO8wSWAlQc=
X-Google-Smtp-Source: ABdhPJxiHml2sbxlU+Bp3k0tzot0EvSGpAt9wvsO1RnaR0GSxO5x9loFqrYo43ZrwFPR+tGXQtvJIQ==
X-Received: by 2002:a05:6e02:17ce:b0:2d1:1c16:5084 with SMTP id
 z14-20020a056e0217ce00b002d11c165084mr3863374ilu.88.1652735279081; 
 Mon, 16 May 2022 14:07:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 n11-20020a02714b000000b0032e16c566adsm1861634jaf.109.2022.05.16.14.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 14:07:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:07:56 -0600
Message-Id: <20220516210756.3093190-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] toolchain-buildroot: only allow
 BR2_STATIC_LIBS on supported archs
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is currently possible to select BR2_STATIC_LIBS while
BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
toolchains that support BR2_STATIC_LIBS for the selected architecture.

Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS so that we can
disable the selection of BR2_STATIC_LIBS when using an unsupported
architecture.

Fixes:
 - http://autobuild.buildroot.net/results/4da/4da59af8193376ec893321c4c2aaf1d25598502d
 - http://autobuild.buildroot.net/results/195/1950348218a4f097f078d158977c13f8b0a97d6e
 - http://autobuild.buildroot.net/results/2f0/2f03f2be32ad9898a990f6f0264d8c8d51991eb1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - change BR2_TOOLCHAIN_BUILDROOT prefix to BR2_PACKAGE for configs in package
Changes v1 -> v2:
  - move supports config variables into toolchain configs
---
 Config.in                               |  2 ++
 package/glibc/Config.in                 | 38 +++++++++++++++++++++++
 package/musl/Config.in                  | 28 +++++++++++++++++
 package/uclibc/Config.in                | 28 +++++++++++++++++
 toolchain/toolchain-buildroot/Config.in | 41 +++++--------------------
 5 files changed, 104 insertions(+), 33 deletions(-)

diff --git a/Config.in b/Config.in
index f0cd6f48ed..52c3c4b4c8 100644
--- a/Config.in
+++ b/Config.in
@@ -601,6 +601,8 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
+	depends on !BR2_TOOLCHAIN_BUILDROOT || \
+		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 8e9ddac7d9..5814bfa81e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,3 +1,41 @@
+config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_i386
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	default y if BR2_sh
+	default y if BR2_sparc64
+	default y if BR2_x86_64
+	default y if BR2_microblaze
+	default y if BR2_nios2
+	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
+	default y if BR2_csky
+	depends on !BR2_powerpc_SPE
+	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+
+config BR2_PACKAGE_GLIBC_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 comment "Glibc Options"
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 69da615b63..c084200600 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,3 +1,31 @@
+config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sh
+	default y if BR2_x86_64
+	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
+
+config BR2_PACKAGE_MUSL_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_MUSL_ARCH_SUPPORTS
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it in Buildroot.
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_MUSL
 	bool
 	default y
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 310414bebc..754c3ea014 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,3 +1,31 @@
+config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_arcle
+	default y if BR2_arceb
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_RISCV_64
+	default y if BR2_sh4
+	default y if BR2_sh4eb
+	default y if BR2_sparc
+	default y if BR2_xtensa
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_UCLIBC_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
+
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 comment "uClibc Options"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68..5cd7b79456 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -20,6 +20,11 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
+config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_UCLIBC_SUPPORTS
+	default y if BR2_PACKAGE_MUSL_SUPPORTS
+
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
@@ -27,13 +32,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
-		   BR2_arm     || BR2_armeb    || \
-		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
-		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
-		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
-		   BR2_x86_64
+	depends on BR2_PACKAGE_UCLIBC_SUPPORTS
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
@@ -43,23 +42,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
-	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
-		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
-		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
-		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
-		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
-		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
-		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
-		   BR2_csky 	   || BR2_or1k
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
-	depends on !BR2_powerpc_SPE
-	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on BR2_PACKAGE_GLIBC_SUPPORTS
 	select BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This option selects glibc as the C library for the
@@ -83,15 +66,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
-		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
-		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
-		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
-	depends on !BR2_powerpc_SPE # not supported, build breaks
-	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
-	# sh2 nommu is supported by musl, but we don't have support
-	# for it in Buildroot.
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MUSL_SUPPORTS
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
