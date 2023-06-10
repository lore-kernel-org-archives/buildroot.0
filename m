Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9297BC7EE37
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 13:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A45E60E6B;
	Sat, 10 Jun 2023 13:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A45E60E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEId0tLkjWKR; Sat, 10 Jun 2023 13:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA3B260F40;
	Sat, 10 Jun 2023 13:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3B260F40
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E74B1BF343
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EA5D4258D
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA5D4258D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRW6knqy3fp9 for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 13:33:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BA34258C
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93BA34258C
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 13:33:03 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5149390b20aso4650387a12.3
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 06:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686403981; x=1688995981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MskS0P0rc8cFTTgyNlicvztAgkmjCSRSm+AuRlpSFCc=;
 b=EJYi2V2mJhZKd6+ekoCE28GPfwZd5Gl/WrLQ7Jhg5P5IwpMLNrlKeyrL18T8+56GvI
 FZXUUIxyZxQ3xSSI4KR419t1D0D2YC9GFj4QMRipWvrQNHIlhNZyi94TIyKEVEVZ3yks
 PJQbLOBaIAj2IMlhXEd6mYtBS9vaF7LcjV2nIh+MgGVsjFBFV+x6BIEfjazB+fGggCWJ
 MhKyt/6TDs/Omv9sIzcwnYJCO0hYQA7rkFpUHSALsRnKhnYFNrY7y/jTTx56pS8cvCEQ
 0GT9O2swXK2ly596b0+m5YJzJUSjE3ZIf4CwQFaAoQDXIj/QoFydGkQjnKj6PiCtBfHE
 n7zg==
X-Gm-Message-State: AC+VfDxlpPrwhT52FLVdezvC9m5fTrgc+4K3vxkWxPRuJHo0AVEsSr0M
 dTkgWn7TGz8M50b2n5OfRvJOQRYUU9Y3Cg==
X-Google-Smtp-Source: ACHHUZ77E6CPGUmwNIeOY/Sj4DqGVedHTkXIA16BPDVrmUk9SW6yYHqPLlj55kRWKFtT060PJCAnsA==
X-Received: by 2002:a17:907:6e26:b0:96f:912d:7922 with SMTP id
 sd38-20020a1709076e2600b0096f912d7922mr5397997ejc.53.1686403980978; 
 Sat, 10 Jun 2023 06:33:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:9ac8:47a3:9e97:6ffe])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a1709061cd700b0094f07545d40sm2559774ejh.220.2023.06.10.06.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 06:33:00 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 15:32:51 +0200
Message-Id: <20230610133251.97022-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610133251.97022-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/fluent-bit: rework wasm handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent-bit isn't very great at supporting the various architectures,
so help a little bit by defining the WAMR_BUILD_TARGET ourselves.

./utils/test-pkg -c fluent-bit.config -p fluent-bit -a
                             arm-aarch64 [ 1/45]: OK
                   bootlin-aarch64-glibc [ 2/45]: OK
               bootlin-arcle-hs38-uclibc [ 3/45]: OK
                    bootlin-armv5-uclibc [ 4/45]: OK
                     bootlin-armv7-glibc [ 5/45]: OK
                   bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                      bootlin-armv7-musl [ 7/45]: OK
                bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/45]: OK
             bootlin-microblazeel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                   bootlin-mipsel-uclibc [12/45]: OK
                     bootlin-nios2-glibc [13/45]: OK
                 bootlin-openrisc-uclibc [14/45]: OK
        bootlin-powerpc64le-power8-glibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
                   bootlin-riscv32-glibc [17/45]: OK
                   bootlin-riscv64-glibc [18/45]: OK
                    bootlin-riscv64-musl [19/45]: OK
                 bootlin-s390x-z13-glibc [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: SKIPPED
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: FAILED
                           sourcery-mips [44/45]: FAILED
                          sourcery-nios2 [45/45]: OK

Two failures:

- sourcery-mips64:

core/iwasm/common/arch/invokeNative_mips.s: Assembler messages:
core/iwasm/common/arch/invokeNative_mips.s:58: Error: opcode not supported on this processor: mips64r2 (mips64r2) `ldc1 $f12,0($sp)'
core/iwasm/common/arch/invokeNative_mips.s:59: Error: opcode not supported on this processor: mips64r2 (mips64r2) `ldc1 $f14,8($sp)'
make[4]: *** [src/wasm/CMakeFiles/vmlib-static.dir/build.make:495: src/wasm/CMakeFiles/vmlib-static.dir/__/__/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/common/arch/invokeNative_mips.s.o] Error 1
make[4]: *** Waiting for unfinished jobs....

- sourcery-mips:

core/iwasm/common/arch/invokeNative_mips.s: Assembler messages:
core/iwasm/common/arch/invokeNative_mips.s:58: Error: opcode not supported on this processor: mips32r2 (mips32r2) `ldc1 $f12,0($sp)'
core/iwasm/common/arch/invokeNative_mips.s:59: Error: opcode not supported on this processor: mips32r2 (mips32r2) `ldc1 $f14,8($sp)'
make[4]: *** [src/wasm/CMakeFiles/vmlib-static.dir/build.make:495: src/wasm/CMakeFiles/vmlib-static.dir/__/__/lib/wasm-micro-runtime-WAMR-1.1.1/core/iwasm/common/arch/invokeNative_mips.s.o] Error 1
make[4]: *** Waiting for unfinished jobs....

Fix see: https://github.com/bytecodealliance/wasm-micro-runtime/issues/625

>> Hi, building the invokeNative_general.c explicitly is supported now, please pull the latest code and use
>> "cmake -DWAMR_BUILD_INVOKE_NATIVE_GENERAL=1 ..." to build it.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: No change.
---
 package/fluent-bit/Config.in     | 25 -------------------------
 package/fluent-bit/fluent-bit.mk | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index bfdea895b0..dc477e9f39 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -11,31 +11,6 @@ config BR2_PACKAGE_FLUENT_BIT
 
 	  https://github.com/fluent/fluent-bit
 
-if BR2_PACKAGE_FLUENT_BIT
-
-config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
-	bool
-	# see lib/wasm-micro-runtime-WAMR-1.1.1/README.md#supported-architectures-and-platforms
-	default y if BR2_arc
-	default y if BR2_arm || BR2_armeb
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_i386 || BR2_x86_64
-	default y if BR2_RISCV_64
-	default y if BR2_xtensa
-
-config BR2_PACKAGE_FLUENT_BIT_WASM
-	bool "wasm runtime support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
-	help
-	  Support for WASM-based plugins.
-
-comment "wasm runtime support needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_FLUENT_BIT_WASM_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-endif
-
 comment "fluent-bit needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 9df34efd78..46f7c603b5 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -22,8 +22,36 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
-ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
-FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes
+# WASM runtime support needs a toolchain w/ C++
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = AARCH64
+else ifeq ($(BR2_arcle)$(BR2_arceb),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = ARC
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = ARM
+else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = MIPS
+# https://github.com/bytecodealliance/wasm-micro-runtime/issues/625
+# Fix unknown opcode 'ldc1', seen on mips32r2 and mips64r2.
+FLUENT_BIT_CONF_OPTS += \
+	-DWAMR_BUILD_INVOKE_NATIVE_GENERAL=1
+else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
+FLUENT_BIT_WAMR_BUILD_TARGET = RISCV32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
+FLUENT_BIT_WAMR_BUILD_TARGET = RISCV64
+else ifeq ($(BR2_i386),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = X86_32
+else ifeq ($(BR2_x86_64),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = X86_64
+else ifeq ($(BR2_xtensa),y)
+FLUENT_BIT_WAMR_BUILD_TARGET = XTENSA
+endif
+endif
+
+ifneq ($(FLUENT_BIT_WAMR_BUILD_TARGET),)
+FLUENT_BIT_CONF_OPTS += -DFLB_WASM=Yes \
+	-DWAMR_BUILD_TARGET=$(FLUENT_BIT_WAMR_BUILD_TARGET)
 else
 FLUENT_BIT_CONF_OPTS += -DFLB_WASM=No
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
