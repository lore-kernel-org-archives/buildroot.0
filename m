Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4066CCA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16BFE41952;
	Wed, 10 Sep 2025 21:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FR4NHuiJ8WsS; Wed, 10 Sep 2025 21:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E78B44191F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78B44191F;
	Wed, 10 Sep 2025 21:34:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F160234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 002D580D51
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx0VBCzWHqY3 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2068380D30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2068380D30
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DD8C83E4F; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 23:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b20ffb4cbcd9109117c923059184880ae336ff6
X-Git-Newrev: 03a10e4a39b34a6f4aa5cce4d52874caf3d1f6cf
X-Patchwork-Hint: ignore
Message-Id: <20250910213446.1DD8C83E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/external: remove Linaro armeb
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

commit: https://git.buildroot.net/buildroot/commit/?id=03a10e4a39b34a6f4aa5cce4d52874caf3d1f6cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain is more than 7 years old now, and not maintained anymore.
Let's therefore remove it from Buildroot. There are still some
alternatives in-tree, such as Bootlin toolchains

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                                   |  7 ++++++
 toolchain/toolchain-external/Config.in             |  6 -----
 .../toolchain-external-linaro-armeb/Config.in      | 26 ----------------------
 .../Config.in.options                              |  9 --------
 .../toolchain-external-linaro-armeb.hash           |  3 ---
 .../toolchain-external-linaro-armeb.mk             | 17 --------------
 6 files changed, 7 insertions(+), 61 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6867f129d1..181ec4b3b1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	bool "Linaro armeb 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro armeb 2018.05 is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2018.05 external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2599015d4b..831387bc4e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -20,9 +20,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 
-# ARM big-endian
-source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
-
 # Bootlin toolchains, available for virtually all architectures
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 
@@ -111,9 +108,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.o
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 
-# ARM big-endian
-source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
-
 # Bootlin toolchains
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
deleted file mode 100644
index b143ee5e24..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_armeb
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-	bool "Linaro armeb 2018.05"
-	depends on BR2_armeb
-	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	help
-	  Linaro toolchain for the ARM big endian architecture. It
-	  uses Linaro GCC 2018.05 (based on gcc 7.3.1), Linaro GDB
-	  2018.05 (based on GDB 8.1), glibc 2.25, Binutils 2018.05
-	  (based on 2.28). It generates code that runs on all Cortex-A
-	  profile devices, but tuned for the Cortex-A9. The code
-	  generated is Thumb 2, with the hard floating point calling
-	  convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
deleted file mode 100644
index 225e90f009..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "armeb-linux-gnueabihf"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-armeb"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
deleted file mode 100644
index 2b80f396d1..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  60bf9924a0c039c94deb85cb9b129d0f28b28eadbb1fb3f7e2e227679cc43fc9  gcc-linaro-7.3.1-2018.05-i686_armeb-linux-gnueabihf.tar.xz
-sha256  c1bbd598b78458d6b7ea1c971fddf736c00d57890c7131fdafd4e789289c42f9  gcc-linaro-7.3.1-2018.05-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
deleted file mode 100644
index b8ea80ff60..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-armeb
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2018.05
-
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
