Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A0CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8394A418E6;
	Wed, 10 Sep 2025 21:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YVyYWIft3vK; Wed, 10 Sep 2025 21:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 801F9418E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 801F9418E4;
	Wed, 10 Sep 2025 21:34:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5206234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C26C761250
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LuXdAOkLjzk3 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F053C6059F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F053C6059F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF10C83E4F; Wed, 10 Sep 2025 21:34:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 23:02:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4daac8b973d3b99eb916949ed57a3704afa42c69
X-Git-Newrev: 8cc71fafc3273c719f0a7b8fd6a487298cef0c52
X-Patchwork-Hint: ignore
Message-Id: <20250910213445.DF10C83E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/external: remove Linaro aarch64
 toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8cc71fafc3273c719f0a7b8fd6a487298cef0c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain is more than 7 years old now, and not maintained anymore.
Let's therefore remove it from Buildroot. There are still some
alternatives in-tree, such as ARM and Bootlin toolchains

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                                         |  7 +++++++
 support/config-fragments/autobuild/linaro-aarch64.config |  3 ---
 support/config-fragments/autobuild/toolchain-configs.csv |  1 -
 support/testing/tests/boot/test_atf.py                   |  2 +-
 toolchain/toolchain-external/Config.in                   |  2 --
 .../toolchain-external-linaro-aarch64/Config.in          | 16 ----------------
 .../toolchain-external-linaro-aarch64/Config.in.options  |  9 ---------
 .../toolchain-external-linaro-aarch64.hash               |  3 ---
 .../toolchain-external-linaro-aarch64.mk                 | 16 ----------------
 9 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c0f10d2d09..a1c1550b14 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	bool "Linaro AArch64 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro AArch64 2018.05 is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	bool "Sourcery CodeBench MIPS external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/support/config-fragments/autobuild/linaro-aarch64.config b/support/config-fragments/autobuild/linaro-aarch64.config
deleted file mode 100644
index f65f78a39b..0000000000
--- a/support/config-fragments/autobuild/linaro-aarch64.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_aarch64=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index a2fba3a2cc..5c2f4c673e 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -61,6 +61,5 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 6142dd36c1..b822b9d357 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -6,7 +6,7 @@ class TestATFAllwinner(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6e66fb63f1..9abd77302f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -10,7 +10,6 @@ choice
 
 # Aarch64 (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
@@ -104,7 +103,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 
 # Aarch64
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
deleted file mode 100644
index 1b0ec7cd9f..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2018.05"
-	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	help
-	  Toolchain for the AArch64 architecture, from
-	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
deleted file mode 100644
index 099c6c0d07..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "aarch64-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-aarch64"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
deleted file mode 100644
index 70841a4fa2..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  466b801a60491ae1e2ce9952e0615cf04cf611596c6ffd5bfe8a89ef5be47e03  gcc-linaro-7.3.1-2018.05-i686_aarch64-linux-gnu.tar.xz
-sha256  73eed74e593e2267504efbcf3678918bb22409ab7afa3dc7c135d2c6790c2345  gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
deleted file mode 100644
index 1015d63014..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-aarch64
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2018.05
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
