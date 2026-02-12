Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4833EEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D8541E21;
	Fri, 13 Feb 2026 19:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_KhliCSJYap; Fri, 13 Feb 2026 19:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E959541E5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011362;
	bh=Qbj5eYQOEMgvCth/Xcwef/M4wunbezPuRIXhQH7gHxo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XtvVoQbK2Q/UqabzD5XYIIUFkQXgQ3mt7B9RUhpetLOINnbTI5I373nq2/kNQVg+c
	 hnzgS5616N9VfgilE1Gp7Oc/ckJy1yGTggBy5Kk9kzJQPChJYStvVoUjdi4IR3YyBv
	 k8D+iJXmFvyNlmElbyzBGMmF0URTsTyvHfuuqVusFwNcq1Ksgu2KjSzS4aswpa+wnP
	 n6MUELe88xpcZrNvJXDE+Cz7dVTejNyrmWInShBL5PFwuh4m4+BE56xlcnslGSzJ1w
	 pcPZK8TKcY/Q75ik0BSf0uVqUmbnK+Dw/ll/qymK6PD1m7UqX4p69MaQEBU7sw7ZB5
	 YmhovLMIc7Iwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E959541E5F;
	Fri, 13 Feb 2026 19:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07812283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 249158453C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PY5y5K9EuvH1 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE9D284539
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE9D284539
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C34D78268D; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:49:21 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8393bad67bacd82613d7340dd03754dc7ea22dea
X-Git-Newrev: f15cbb2c4617dba25a534f13e5e428911d0d4ea7
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.C34D78268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/config-fragments/autobuild: drop somewhat duplicate toolchain
 configs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f15cbb2c4617dba25a534f13e5e428911d0d4ea7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- br-i386-pentium4-full.config as an x86 32-bit toolchain test is
  already reasonably covered by bootlin-x86-i686-musl.config

- br-microblazeel-full-internal.config as a Microblaze toolchain test is
  already reasonably covered by bootlin-microblazeel-uclibc.config

- br-powerpc-internal-full.config and br-powerpc-603e-basic-cpp.config
  as PowerPC 32-bit toolchain tests are already reasonably covered by
  bootlin-powerpc-e500mc-uclibc.config

- br-powerpc64-power7-glibc.config as a PowerPC 64-bit toolchain test
  is already reasonably covered by
  bootlin-powerpc64le-power8-glibc.config

- br-riscv64-full-internal.config as a RISC-V 64-bit toolchain test is
  already reasonably covered by bootlin-riscv64-glibc.config and
  bootlin-riscv64-musl.config

- br-s390x-z13-internal-glibc.config as a s390 toolchain test is
  already reasonably covered by bootlin-s390x-z13-glibc.config

- br-xtensa-full-internal.config as an Xtensa toolchain test is
  already reasonably covered by bootlin-xtensa-uclibc.config

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8bab0acff64a3accab4935a7245a3851a6369c35)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../config-fragments/autobuild/br-i386-pentium4-full.config    | 10 ----------
 .../autobuild/br-microblazeel-full-internal.config             |  1 -
 .../autobuild/br-powerpc-603e-basic-cpp.config                 | 10 ----------
 .../config-fragments/autobuild/br-powerpc-internal-full.config |  4 ----
 .../autobuild/br-powerpc64-power7-glibc.config                 |  9 ---------
 .../config-fragments/autobuild/br-riscv64-full-internal.config |  4 ----
 .../autobuild/br-s390x-z13-internal-glibc.config               |  4 ----
 .../config-fragments/autobuild/br-xtensa-full-internal.config  |  3 ---
 support/config-fragments/autobuild/toolchain-configs.csv       |  8 --------
 9 files changed, 53 deletions(-)

diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
deleted file mode 100644
index c680699288..0000000000
--- a/support/config-fragments/autobuild/br-i386-pentium4-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_x86_pentium4=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-microblazeel-full-internal.config b/support/config-fragments/autobuild/br-microblazeel-full-internal.config
deleted file mode 100644
index 0d2d7df8f1..0000000000
--- a/support/config-fragments/autobuild/br-microblazeel-full-internal.config
+++ /dev/null
@@ -1 +0,0 @@
-BR2_microblazeel=y
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
deleted file mode 100644
index 045428c1de..0000000000
--- a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_powerpc=y
-BR2_powerpc_603e=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc-internal-full.config b/support/config-fragments/autobuild/br-powerpc-internal-full.config
deleted file mode 100644
index 61b3e7a966..0000000000
--- a/support/config-fragments/autobuild/br-powerpc-internal-full.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_powerpc=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
deleted file mode 100644
index a80047ea66..0000000000
--- a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_powerpc64=y
-BR2_powerpc_power7=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64-full-internal.config b/support/config-fragments/autobuild/br-riscv64-full-internal.config
deleted file mode 100644
index 5c1dfc47e3..0000000000
--- a/support/config-fragments/autobuild/br-riscv64-full-internal.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_riscv=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config b/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
deleted file mode 100644
index 56af5fb1ba..0000000000
--- a/support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_s390x=y
-BR2_s390x_z13=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full-internal.config b/support/config-fragments/autobuild/br-xtensa-full-internal.config
deleted file mode 100644
index 89e81d4c45..0000000000
--- a/support/config-fragments/autobuild/br-xtensa-full-internal.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_xtensa=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 4baeb99f74..df6a310477 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -45,16 +45,8 @@ support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
-support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
-support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config,x86_64
-support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
-support/config-fragments/autobuild/br-powerpc-internal-full.config,any
-support/config-fragments/autobuild/br-riscv64-full-internal.config,any
-support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
