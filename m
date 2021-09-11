Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57229C433FE
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:26:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B1C60F58
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16B1C60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3F561BFB;
	Sat, 11 Sep 2021 16:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJgt98A5LEQW; Sat, 11 Sep 2021 16:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AD0461BF9;
	Sat, 11 Sep 2021 16:26:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A69E1BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C6440490
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zEoeFLFq9-O for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:25:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6C97400FC
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:25:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 84F7E890D5; Sat, 11 Sep 2021 16:23:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 18:20:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e070082495c1686b2b207db7fe7720271dc7d86
X-Git-Newrev: f94381f29eaaf31023f74db9d2e915c35176e5a4
X-Patchwork-Hint: ignore
Message-Id: <20210911162343.84F7E890D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-external: update Arm
 ARM toolchain 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f94381f29eaaf31023f74db9d2e915c35176e5a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to gcc 10.3, gdb 10.2, binutils 2.36.1, glibc 2.33.

Remove BR2_TOOLCHAIN_HAS_NATIVE_RPC since the support for obsolete
RPC was finally dropped in glibc in 2.32 (2020-08-04).

See "Release Note":
https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/toolchain-external-arm-arm/Config.in  | 7 +++----
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash     | 6 +++---
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk       | 6 +++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index e3bac38baa..0fbeba6aae 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2020.11"
+	bool "Arm ARM 2021.07"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -13,15 +13,14 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 10.2,
-	  GDB 10.1, glibc 2.31, Binutils 2.35.1. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 10.3,
+	  GDB 10.2, glibc 2.33, Binutils 2.36.1. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index a46ed4e40c..d58692de53 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/binrel/gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
-md5  14f706db78cfb43aafed9056174572b0  gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
 # locally calculated
-sha256  102825ae56c9e00142d06f35d2bdd3299edb6060e84a275a25b095e66fd3fc2a  gcc-arm-10.2-2020.11-x86_64-arm-none-linux-gnueabihf.tar.xz
+sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 88b6ae3403..4392205105 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2020.11
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
