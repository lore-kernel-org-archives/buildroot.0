Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E7EC678DD
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 23:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85E360E2E;
	Thu, 17 Aug 2023 23:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85E360E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tr1cfPN67Exx; Thu, 17 Aug 2023 23:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B09A60DFC;
	Thu, 17 Aug 2023 23:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B09A60DFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E59981BF476
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C63D94054E
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C63D94054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doYRthlOGtns for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 23:08:51 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7631740111
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 23:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7631740111
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso972761f8f.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 16:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692313729; x=1692918529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuKwcodJYxviREZ/7uYhxPfnHYHyRVQoJsUQ9tY99L4=;
 b=O+RroP01AafweNKWVXeTV46le1CyYGgjsnlgy5PIVGndtRKOnfpKNfJJzwdP2nJMQI
 G0d7hbLpJezATrLV18CccSzH0C9sWxS+1dnSA78jMaUrKzPCtspEZ2yBLRzApmzJEHzR
 aeEqREy6h91u8YBvaKfo9z8bPTBNwar+cKgIJQXxhVYOx1R8jRox5GDNHdipNF++3hQ+
 YiVTYevw4XXxbGzra5TRLPpVkKRJuEkFUyE7AgyUHWHFx+8pfUezJ+rJt+O0OCaZW8CU
 /BVMjE0a3q38oHwZq6QMkKF7TRKmJSIEjF5Nr0XiR7HTjzkPbYK225eWsMH2Io6qfCeA
 7AMw==
X-Gm-Message-State: AOJu0YxWy7V5vxoBMOCUD5axYOCYtgtycAed4Z15fFYkmZQZCCNWuLKq
 2+JD81ZdH82OzcEPBG0yqOclX/3Fzi8=
X-Google-Smtp-Source: AGHT+IHlgT7i3dHRgRamObm4A1VHscIe8UetAyWoWjBhB7j8VMpYQYs5hSaxEfOL0wUheSObA5WVXg==
X-Received: by 2002:adf:f20b:0:b0:315:a235:8aa8 with SMTP id
 p11-20020adff20b000000b00315a2358aa8mr3623942wro.2.1692313729321; 
 Thu, 17 Aug 2023 16:08:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003fa95f328afsm4409479wmi.29.2023.08.17.16.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:08:48 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 01:08:41 +0200
Message-ID: <20230817230844.450092-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692313729; x=1692918529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tuKwcodJYxviREZ/7uYhxPfnHYHyRVQoJsUQ9tY99L4=;
 b=gZ67oho1p5M9YJqohPwdsgr5pne9Vs9JdrtUzlwkTOvoYB7b/56/y1kvoQu3mV2jHK
 qflecdBi36uRZiUR6D3rGAu1GYAUxA+uGEEtwdrPtunruaqZKuETB+VXFeUYvoomV09t
 8NLhp9n4KIH7BoK9nPzJup9gUUem59ZR68PokRS3CeiRj0vUUDud+40q0qqBoz9mCr+z
 0caESVMbxbbHvPu4AeKh5uuH8K5pzT81/QqGmIUslv0VgZ91M49EquJRzAed3ALJT1+d
 57GfbqpCgvrI4owlymId7FBjMVoskCmD/4QkY+7hrtCSZAYxCslB7nKOkYgHhWQswj33
 JB0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=gZ67oho1
Subject: [Buildroot] [PATCH 1/4] configs/sipeed_maix_{bit,
 dock}_sdcard_defconfig: fix build with binutils >= 2.38
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream patch fixing the build with binutils >= 2.38
for riscv's for Zicsr and Zifencei.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060608
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060605

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...iscv-Fix-build-against-binutils-2.38.patch | 58 +++++++++++++++++++
 configs/sipeed_maix_bit_sdcard_defconfig      |  1 +
 configs/sipeed_maix_dock_sdcard_defconfig     |  1 +
 3 files changed, 60 insertions(+)
 create mode 100644 board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch

diff --git a/board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch b/board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
new file mode 100644
index 0000000000..52b496f054
--- /dev/null
+++ b/board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
@@ -0,0 +1,58 @@
+From 0cf11f3c0478f4286adcfb09bf9137f8b00212e3 Mon Sep 17 00:00:00 2001
+From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
+Date: Mon, 3 Oct 2022 18:07:54 +0200
+Subject: [PATCH] riscv: Fix build against binutils 2.38
+
+The following description is copied from the equivalent patch for the
+Linux Kernel proposed by Aurelien Jarno:
+
+>From version 2.38, binutils default to ISA spec version 20191213. This
+means that the csr read/write (csrr*/csrw*) instructions and fence.i
+instruction has separated from the `I` extension, become two standalone
+extensions: Zicsr and Zifencei. As the kernel uses those instruction,
+this causes the following build failure:
+
+arch/riscv/cpu/mtrap.S: Assembler messages:
+arch/riscv/cpu/mtrap.S:65: Error: unrecognized opcode `csrr a0,scause'
+arch/riscv/cpu/mtrap.S:66: Error: unrecognized opcode `csrr a1,sepc'
+arch/riscv/cpu/mtrap.S:67: Error: unrecognized opcode `csrr a2,stval'
+arch/riscv/cpu/mtrap.S:70: Error: unrecognized opcode `csrw sepc,a0'
+
+Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
+Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
+Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
+Tested-by: Heiko Stuebner <heiko@sntech.de>
+Tested-by: Christian Stewart <christian@paral.in>
+Reviewed-by: Rick Chen <rick@andestech.com>
+(cherry picked from commit 1dde977518f13824b847e23275001191139bc384)
+Upstream: https://gitlab.com/u-boot/u-boot/-/commit/1dde977518f13824b847e23275001191139bc384
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/riscv/Makefile | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
+index 0b80eb8d864..53d1194ffb6 100644
+--- a/arch/riscv/Makefile
++++ b/arch/riscv/Makefile
+@@ -24,7 +24,16 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
+ 	CMODEL = medany
+ endif
+ 
+-ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_C) -mabi=$(ABI) \
++RISCV_MARCH = $(ARCH_BASE)$(ARCH_A)$(ARCH_C)
++
++# Newer binutils versions default to ISA spec version 20191213 which moves some
++# instructions from the I extension to the Zicsr and Zifencei extensions.
++toolchain-need-zicsr-zifencei := $(call cc-option-yn, -mabi=$(ABI) -march=$(RISCV_MARCH)_zicsr_zifencei)
++ifeq ($(toolchain-need-zicsr-zifencei),y)
++	RISCV_MARCH := $(RISCV_MARCH)_zicsr_zifencei
++endif
++
++ARCH_FLAGS = -march=$(RISCV_MARCH) -mabi=$(ABI) \
+ 	     -mcmodel=$(CMODEL)
+ 
+ PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
+-- 
+2.41.0
+
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 34769eeca8..0cfff26337 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 62f6a0e0b8..db075360cc 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -17,6 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
 BR2_BINFMT_FLAT=y
 BR2_BINFMT_FLAT_ONE=y
 # BR2_TARGET_ENABLE_ROOT_LOGIN is not set
+BR2_GLOBAL_PATCH_DIR="board/canaan/k210-soc/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
