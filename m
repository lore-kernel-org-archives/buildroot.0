Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82991C04A94
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E60EC41FF0;
	Thu, 27 Jul 2023 22:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E60EC41FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6ZRo2UPtQ52; Thu, 27 Jul 2023 22:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CE714200B;
	Thu, 27 Jul 2023 22:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CE714200B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F05611BF98E
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D294B41FF0
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D294B41FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbboSBeaoE9G for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:51 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAF8841FEF
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF8841FEF
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fd18b1d924so14909765e9.1
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496749; x=1691101549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xu1Gn/CfL0oZdbnkSVM5dmJhuH+UtGBgxRVza3n2ha8=;
 b=IrPCtWrgTgFjuhLFsAuV/9ZjVqReJAilO6ZEfN1S4E0hY2ctivT60i/cSFi4dyY73L
 tW8aK461XkVwIfshZZP7NrA4VAtZqpcbXPV80ti/muhempyHsovXJtqiq8Xbehy4BMf1
 e+I6Gd6iu7ihxxSNPITYuqRv4mXUxoe86bU+CCGlq9pGUNqTgmEaHfZhCxu3kUUQbPIU
 G8WqtYj2+ITYC+I9XbHIvB7vBgAV+s9MeKIkjaeNs/+5j7mUYkhM1F2E/gXLnIjwHQSv
 LpJLUkxtyeI8wkRIYdpoRs6gZdN6DHoD5WMjCMq8gFaEGR0mznbYgTy8Xv2cPPo7snjv
 u8PQ==
X-Gm-Message-State: ABy/qLZzfOQgfQSFTlHDQV/Iz2HBXNuFb0XEBjZ+HWXP1QCmQ9b0pm60
 fpaRHxeiFBvgtL6XTokItaHCffunkYs=
X-Google-Smtp-Source: APBJJlE/+LCGhhI+Hq+dA73w6G361s7WZGo1FfoM70MHAS5eo9+QCjqLVrnAfjkIRPd6BUdqshpRNw==
X-Received: by 2002:a7b:c44b:0:b0:3fb:c9f4:150e with SMTP id
 l11-20020a7bc44b000000b003fbc9f4150emr260538wmi.14.1690496748527; 
 Thu, 27 Jul 2023 15:25:48 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:47 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:39 +0200
Message-ID: <20230727222544.196562-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496749; x=1691101549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xu1Gn/CfL0oZdbnkSVM5dmJhuH+UtGBgxRVza3n2ha8=;
 b=BJjUFqYJDa7l1+tkv3IAPdScH3D8sDulLc3feH+PtoFo5qR6TKdY59/LI+dvXm/uMu
 15OrQDTWGIrVQ5uN1gLY5h425aU1e30fUK8ZM0MOR13BCQO72fXQfN8zaCHpebjP2BKR
 1IFscMaNYNSJ+aXW+ZHv34rY2FeRyoFjtkrzpho4H/6Y+scRhcoJeKHDvHt64B+pYMsn
 B51pKaJej6cYvU8n2Y224PTGpINaMakEQCXNcSqR8ySZ8okxkOA/+GvP8JzthEyDeEzJ
 m+CeD3nVUrH1Y249JW4hCkluFQfM6OCdP6EXs4khlPM8PtRPFO6jzZAhQN3dDRAAaJUi
 TrHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BJjUFqYJ
Subject: [Buildroot] [PATCH v2 3/8] package/gcc: add support for gcc 13
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

https://gcc.gnu.org/gcc-13/changes.html
https://gcc.gnu.org/gcc-13/porting_to.html

Backport upstream patch to gcc 13.2 for RISC-V build issue with gcc 4.9.x:

GCC should still build with GCC 4.8.3 or newer [1]
using C++03 by default. But a recent change in
RISC-V port introduced a C++11 feature "std::log2" [2].

Use log2 from the C header, without the namespace [3].

[1] https://gcc.gnu.org/install/prerequisites.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std

Rebase patch 0001-disable-split-stack-for-non-thread-builds.patch
required for uClibc-ng without threads support.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589

Runtime tested on gitlab-ci:
https://gitlab.com/kubu93/buildroot/-/pipelines/947874770/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
efl2flt for riscv64 is broken with gcc >= 13.1
https://gitlab.com/DocSepp/buildroot/-/jobs/4197460843

v2: bump to gcc 13.2
---
 ...le-split-stack-for-non-thread-builds.patch | 26 ++++++++++
 ...ISC-V-fix-build-issue-with-gcc-4.9.x.patch | 48 +++++++++++++++++++
 package/gcc/Config.in.host                    | 14 ++++++
 package/gcc/gcc.hash                          |  2 +
 4 files changed, 90 insertions(+)
 create mode 100644 package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch

diff --git a/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 4f67134e0b1404fef4ea72342be8fab4c37ca8c8 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
diff --git a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
new file mode 100644
index 0000000000..55fb40e358
--- /dev/null
+++ b/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
@@ -0,0 +1,48 @@
+From e5253b777eefef7d66d3bd1c641de6d133d3573d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 2 May 2023 14:21:55 +0200
+Subject: [PATCH] RISC-V: fix build issue with gcc 4.9.x
+
+GCC should still build with GCC 4.8.3 or newer [1]
+using C++03 by default. But a recent change in
+RISC-V port introduced a C++11 feature "std::log2" [2].
+
+Use log2 from the C header, without the namespace [3].
+
+[1] https://gcc.gnu.org/install/prerequisites.html
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=7caa1ae5e451e780fbc4746a54e3f19d4f4304dc
+[3] https://stackoverflow.com/questions/26733413/error-log2-is-not-a-member-of-std
+
+Fixes:
+https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276589
+
+gcc/ChangeLog:
+	* config/riscv/genrvv-type-indexer.cc: Use log2 from the C header, without
+	the namespace.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+(cherry picked from commit 87c347c2897537a6aa391efbfc5ed00c625434fe)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/riscv/genrvv-type-indexer.cc b/gcc/config/riscv/genrvv-type-indexer.cc
+index e677b55290c..eebe382d1c3 100644
+--- a/gcc/config/riscv/genrvv-type-indexer.cc
++++ b/gcc/config/riscv/genrvv-type-indexer.cc
+@@ -115,9 +115,9 @@ same_ratio_eew_type (unsigned sew, int lmul_log2, unsigned eew, bool unsigned_p,
+   if (sew == eew)
+     elmul_log2 = lmul_log2;
+   else if (sew > eew)
+-    elmul_log2 = lmul_log2 - std::log2 (sew / eew);
++    elmul_log2 = lmul_log2 - log2 (sew / eew);
+   else /* sew < eew */
+-    elmul_log2 = lmul_log2 + std::log2 (eew / sew);
++    elmul_log2 = lmul_log2 + log2 (eew / sew);
+ 
+   if (float_p)
+     return floattype (eew, elmul_log2);
+-- 
+2.34.3
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b6adf1f127..73ecc14398 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -59,6 +59,19 @@ config BR2_GCC_VERSION_12_X
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 
+config BR2_GCC_VERSION_13_X
+	bool "gcc 13.x"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	# uClibc-ng broken on sparc due to recent gcc changes
+	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
+	depends on !BR2_sparc
+	# ARC HS48 rel 31 only supported by gcc arc fork.
+	depends on !BR2_archs4x_rel31
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -89,6 +102,7 @@ config BR2_GCC_VERSION
 	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.4.0"    if BR2_GCC_VERSION_11_X
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
+	default "13.2.0"    if BR2_GCC_VERSION_13_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index f478962af8..d5f8135ff6 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3c
 sha512  a5018bf1f1fa25ddf33f46e720675d261987763db48e7a5fdf4c26d3150a8abcb82fdc413402df1c32f2e6b057d9bae6bdfa026defc4030e10144a8532e60f14  gcc-11.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
 sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
+sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
