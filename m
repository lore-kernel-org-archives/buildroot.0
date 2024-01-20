Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F94C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 16:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8B5883E5B;
	Sat, 20 Jan 2024 16:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B5883E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBOGmfuYsrpK; Sat, 20 Jan 2024 16:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B7C783E22;
	Sat, 20 Jan 2024 16:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B7C783E22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD6371BF400
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 16:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5AF360BA2
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 16:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5AF360BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHXt6viECT7Y for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 16:10:20 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77C4160AFC
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 16:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C4160AFC
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e76109cdeso20282485e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 08:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705767018; x=1706371818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UYe5n1Q1mF/ryauN3Wya3w3yC+sbZZeS74CpkVM+Hh0=;
 b=KrszRTJevgy5aKORL+OrSyAD0v63TNbruEA4qZpicSqnwxNyXmaQOBCZf7I+jj1ZIP
 YjjQIU9dNCSujDFVqp0a28opcN+z5pUcgaMYWSDYwndPZzD2yIU1tcXQrZ37okKCoE84
 SBMhHgDXpehGdyTvoByV1AoF7sRfclPeb4wWCpszaVSv51wGVWoqL2OJmFAKGW8aPMoA
 xL0YfmGujuw7ULqCjfUSDL8OwNA7u/BXfLhXCp85G3pXc4lU8rmIOr/PVO5uFincWiVi
 QDteH/rGmTDJTlvExfmbvUJUxxC36m6jih3+YI5wUNXt5brjAiNuHiZqwP1sHg6VHmVr
 Ndrg==
X-Gm-Message-State: AOJu0YwG66XkzeF8Jmlkhjq2VmB7dcHee6vFrFgPJPvcLHSDinnvgoTI
 Bef1y/YRwvfmPa420UbQAVb48T6yrh5ubGQnr7TK6B7ajjXlICk0VONBKtOw
X-Google-Smtp-Source: AGHT+IHgnF+ylHzs/Ai8UKszMcmUciTealSFyeMWddssyu2Rkwnz22GGrZtxMcp6B9uYggiJA1vgBA==
X-Received: by 2002:a7b:cbd8:0:b0:40d:5df6:3353 with SMTP id
 n24-20020a7bcbd8000000b0040d5df63353mr919079wmi.142.1705767017965; 
 Sat, 20 Jan 2024 08:10:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u21-20020a05600c139500b0040e4a7a7ca3sm33072268wmf.43.2024.01.20.08.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 08:10:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 17:10:15 +0100
Message-ID: <20240120161015.4618-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705767018; x=1706371818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UYe5n1Q1mF/ryauN3Wya3w3yC+sbZZeS74CpkVM+Hh0=;
 b=hpAZU3Xy1K4N3DmCWH3+PmN7b0ma3XlPN45ExOPdZ1Aam1fTeqGRHnJe+lrejzB96B
 2aoyJqTuqwBbwwGMYmVBBHldA3B7PojRgXQIJAK/NvNRMhVv5y45OE+cUupoT6e9DmT0
 X8JmxIaYrOkR+O+/WtufoL5SLbhnUp08ql2MR1sJ0MzOEzlcSOreI14duZAeOXhpGG5v
 9zCB6FwNyr7uHJa5G1yR73NeVT77aYSS+xRMLFlWHGN0s6NCE2U2rn4Qa7nYqvpte5jb
 q+l7uhrNjLKQp4ZlrSKuAhCulxgNJNlkm1ezRnzMDMFjyvWXGV7XGQG/GnK0S4c6kIL4
 23og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hpAZU3Xy
Subject: [Buildroot] [PATCH 1/1] package/highway: fix riscv32 build
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not set -march=rv64gcv1p0 when building for riscv32 to fix the
following build failure raised since bump to version 1.0.7 in commit
0db3c08daf335571a2b2d18a16d8980ddf4567ab and
https://github.com/google/highway/commit/7c15872e81d88c77bca5e74fe0a6543cc374601a:

cc1plus: error: ABI requires '-march=rv32'

Fixes:
 - http://autobuild.buildroot.org/results/3f8def50c93f73c26339f72d6a13951d5fb41c30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-add-required-RISC-V-flags-to-CMake.patch | 42 +++++++++++++++++++
 package/highway/highway.mk                    |  4 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/highway/0001-add-required-RISC-V-flags-to-CMake.patch

diff --git a/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
new file mode 100644
index 0000000000..bfcbfb055c
--- /dev/null
+++ b/package/highway/0001-add-required-RISC-V-flags-to-CMake.patch
@@ -0,0 +1,42 @@
+From 5d58d233fbcec0c6a39df8186a877329147324b3 Mon Sep 17 00:00:00 2001
+From: Mathieu Malaterre <mathieu.malaterre@gmail.com>
+Date: Wed, 13 Sep 2023 08:37:54 +0200
+Subject: [PATCH] Add an option to opt-out of HWY_RISCV
+
+Fixes #1740
+
+Upstream: https://github.com/google/highway/commit/5d58d233fbcec0c6a39df8186a877329147324b3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c2bf57b3f5..be639c945f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -61,6 +61,9 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set copts for Armv7 with NEON (requires vfpv4
+ # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
+ set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
+ 
++# Currently this will compile the entire codebase with `-march=rv64gcv1p0`:
++set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
++
+ # Unconditionally adding -Werror risks breaking the build when new warnings
+ # arise due to compiler/platform changes. Enable this in CI/tests.
+ set(HWY_WARNINGS_ARE_ERRORS OFF CACHE BOOL "Add -Werror flag?")
+@@ -260,9 +263,11 @@ else()
+     # gcc(13) and recent clang both support V, but not yet runtime dispatch, so
+     # we add the gcv compiler flag, which then requires the CPU (now when using
+     # either compiler) to support V.
+-    list(APPEND HWY_FLAGS -march=rv64gcv1p0)
+-    if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
+-      list(APPEND HWY_FLAGS -menable-experimental-extensions)
++    if(HWY_CMAKE_RVV)
++      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
++      if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
++        list(APPEND HWY_FLAGS -menable-experimental-extensions)
++      endif()
+     endif()
+   endif()
+ 
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index 692794959a..2ae2cdc6b6 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -41,6 +41,10 @@ else
 HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
 endif
 
+ifeq ($(BR2_RISCV_32),y)
+HIGHWAY_CONF_OPTS += -DHWY_CMAKE_RVV=OFF
+endif
+
 # Workaround for gcc bug 104028 on m68k.
 # See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
