Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A92C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3F480F4D;
	Wed,  1 May 2024 19:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS0Nk4Gi92v1; Wed,  1 May 2024 19:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2410480302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2410480302;
	Wed,  1 May 2024 19:58:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4942F1BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28FF360BCF
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQ3J-L-PD0vN for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FB660B70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33FB660B70
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D5E78641E; Wed,  1 May 2024 19:58:24 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:56:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65fe2a8f02c694975065c890c0e6038619c025ff
X-Git-Newrev: 7fa0159a5055363d002089f0c451a84594732cf2
X-Patchwork-Hint: ignore
Message-Id: <20240501195824.1D5E78641E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: drop
 external codesourcery niosII toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7fa0159a5055363d002089f0c451a84594732cf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain is pretty old and unlikely used. It's also affected by
binutils bug 27597, so let's remove it.

Remove BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII from pixman package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Romain: remove BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pixman/pixman.mk                                 |  7 -------
 toolchain/toolchain-external/Config.in                   |  6 ------
 toolchain/toolchain-external/pkg-toolchain-external.mk   |  2 +-
 .../toolchain-external-codesourcery-niosII/Config.in     | 16 ----------------
 .../Config.in.options                                    |  9 ---------
 .../toolchain-external-codesourcery-niosII.hash          |  6 ------
 .../toolchain-external-codesourcery-niosII.mk            | 13 -------------
 7 files changed, 1 insertion(+), 58 deletions(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 37eb974c46..8a4f16318f 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -50,13 +50,6 @@ endif
 
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
 
-# toolchain gets confused about TLS access through GOT (PIC), so disable TLS
-# movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
-# {standard input}:172: Error: bad expression
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
-PIXMAN_CFLAGS += -DPIXMAN_NO_TLS
-endif
-
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
 PIXMAN_CFLAGS += -O0
 endif
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index af9082cf6e..e91aa16326 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -29,9 +29,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
 
-# NIOSII
-source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
-
 # Bootlin toolchains, available for virtually all architectures
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 
@@ -129,9 +126,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.o
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
 
-# NIOSII
-source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
-
 # Bootlin toolchains
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options"
 
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 5343f257e0..c08bf0a653 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -13,7 +13,7 @@
 #  * Toolchains provided by Linaro for the ARM and AArch64
 #    architectures
 #  * Sourcery CodeBench toolchains (from Mentor Graphics) for the ARM,
-#    MIPS, PowerPC, x86_64 and NIOS 2 architectures. For the MIPS
+#    MIPS, PowerPC, and x86_64 architectures. For the MIPS
 #    toolchain, the -muclibc variant isn't supported yet, only the
 #    default glibc-based variant is.
 #  * Synopsys DesignWare toolchains for ARC cores
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
deleted file mode 100644
index cf3ce69a68..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2018.05"
-	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	help
-	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 7.3, binutils 2.28,
-	  glibc 2.27, gdb 8.0.1 and kernel headers 4.15.5.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
deleted file mode 100644
index 07cc5ede94..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "nios2-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-niosII"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
deleted file mode 100644
index 47893ab7e2..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://sourcery.mentor.com/GNUToolchain/release3374
-md5  4f536b3b9b4e00f483e82e304c0a27ae  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-md5  be42ab83da2e8db7b73dc890c2549570  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
-# Locally calculated
-sha256  c19afb432b5b23f8d5d639831d3a423a3ea3c9cc62e0015020d20ea2eb36dd1b  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256  d73a6364106dd62352711f932d3be8e97fdaaa548995678b5d38d9f21e22437a  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
deleted file mode 100644
index cb0fe760ff..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-niosII
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2018.05-5
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_ACTUAL_SOURCE_TARBALL = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
