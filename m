Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C19C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3267E61613;
	Tue, 16 May 2023 13:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3267E61613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4n2QYD-Rax2c; Tue, 16 May 2023 13:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F59561625;
	Tue, 16 May 2023 13:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F59561625
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCA221BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A2D60BAF
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A2D60BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsZ42q7xtf7I for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:51:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5069A60A98
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5069A60A98
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:51:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f41d087b24so77349655e9.1
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245087; x=1686837087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aa7jZfgeoN84njAPKlFl5eF31SmBeLf7gs6JOFOsCF0=;
 b=W9derxbz0yI0bKbR0TfOaEPwb4bHfO8aAT7CHaaRt64ldKTnDUIACuFzr1qQyAXl2f
 4InxdFHK1CCy7xNxSNST9RKo28BNDI0hflbu1RRPtDoYzXyQzYx3SBrrsH/TwT/KaFf2
 CY8Lv3TPQXQY5d0qjKfy+VGPktIOGINheqlEqhHfpCrdHSF9rNZwww1MXJvs/Og4kOOg
 Ut3rcF0gZ0nyBe64dnCvNJFNVE4JFMbcpukSNdVPtbypzaYrwUysUhqoQUlt+gCoL4l7
 1q1TiUuejeExMmuitbyzaLikEzoX6Wh3dL+VBtOfRxMIJMrZm0yMeGHDlWdBR+h9F1vs
 6ukQ==
X-Gm-Message-State: AC+VfDzPOnR+MLZBYBZaNROgDsQvdbemeR5n0M0WTvJEV+nGSpUaqQQk
 2z9b8k8M+7KVs81ghU8ltNoTjuoUCzc=
X-Google-Smtp-Source: ACHHUZ4Tyrym+CSxH629qejdDosn0JvSRNCqaeHjzw/P+bdtjMfM6Q+zExQEGuefMLI5lpYp/j7aVw==
X-Received: by 2002:a1c:7c10:0:b0:3f4:253b:92b3 with SMTP id
 x16-20020a1c7c10000000b003f4253b92b3mr21499309wmc.18.1684245087039; 
 Tue, 16 May 2023 06:51:27 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm2682437wrs.70.2023.05.16.06.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 06:51:26 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 15:51:04 +0200
Message-Id: <20230516135107.238343-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230516135107.238343-1-romain.naour@gmail.com>
References: <20230516135107.238343-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684245087; x=1686837087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aa7jZfgeoN84njAPKlFl5eF31SmBeLf7gs6JOFOsCF0=;
 b=dfYbt3bCh/TFYkvi8y5SjBudvGtRjk4md5CcDt2IlRVo9CeNTnbwOa/CFHvexiIb+/
 E4TH2UDp9gOSX+AYkp6O4Aguva6X3FPCyFyD1ZKenHuG3OgaloX4Y6if1/kzs3pBtZtp
 BRzIGnq9xGHhoxgzchSJ6FUZLMpDzI69VRuDG7JJjQif11gTkTbwR+tkL3jEB2beH+a/
 ackKzR5PXcEV6nf0ZRf9cXSwDqTwIyjE1+GkVrLp3w91Lgq4vZ3alYTX/WZv/oevW73O
 85ocKGjCHWNXq7qBNQz29TEfJQFOSnWq+MUb+Sz9TfxWEnA/izy0aDFmuALcsZ/urt9a
 qabw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dfYbt3bC
Subject: [Buildroot] [PATCH 3/6] package/gcc: add support for gcc 13
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

Backport upstream patch to gcc 13.1 for RISC-V build issue with gcc 4.9.x:

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

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
efl2flt for riscv64 is broken with gcc 13.1
https://gitlab.com/DocSepp/buildroot/-/jobs/4197460843
---
 ...le-split-stack-for-non-thread-builds.patch | 26 ++++++++++
 ...ISC-V-fix-build-issue-with-gcc-4.9.x.patch | 48 +++++++++++++++++++
 package/gcc/Config.in.host                    | 14 ++++++
 package/gcc/gcc.hash                          |  2 +
 4 files changed, 90 insertions(+)
 create mode 100644 package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch

diff --git a/package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..e801085dad
--- /dev/null
+++ b/package/gcc/13.1.0/0001-disable-split-stack-for-non-thread-builds.patch
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
diff --git a/package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
new file mode 100644
index 0000000000..55fb40e358
--- /dev/null
+++ b/package/gcc/13.1.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
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
index cd1b9fa46d..3beaaef309 100644
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
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
 	default "12.2.0"    if BR2_GCC_VERSION_12_X
+	default "13.1.0"    if BR2_GCC_VERSION_13_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 666124fa6d..d324852bdd 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3c
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.2.0/sha512.sum
 sha512  e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-12.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.1.0/sha512.sum
+sha512  6cf06dfc48f57f5e67f7efe3248019329a14d690c728d9f2f7ef5fa0d58f1816f309586ba7ea2eac20d0b60a2d1b701f68392e9067dd46f827ba0efd7192db33  gcc-13.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
