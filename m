Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE1ACA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C214961116;
	Wed, 10 Sep 2025 21:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bps4qtAEXYUZ; Wed, 10 Sep 2025 21:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE8261250
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE8261250;
	Wed, 10 Sep 2025 21:34:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE201234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E02634152E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcElb_kImRsi for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C7674080B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C7674080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF12583E54; Wed, 10 Sep 2025 21:34:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 23:02:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cc71fafc3273c719f0a7b8fd6a487298cef0c52
X-Git-Newrev: 27ea54c9762f27999033fc61c7ae8a978c9afdae
X-Patchwork-Hint: ignore
Message-Id: <20250910213445.EF12583E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/external: remove Linaro aarch64
 BE toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=27ea54c9762f27999033fc61c7ae8a978c9afdae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain is more than 7 years old now, and not maintained anymore.
Let's therefore remove it from Buildroot. There are still some
alternatives in-tree, such as ARM and Bootlin toolchains

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                                         |  7 +++++++
 .../config-fragments/autobuild/linaro-aarch64-be.config  |  3 ---
 support/config-fragments/autobuild/toolchain-configs.csv |  1 -
 toolchain/toolchain-external/Config.in                   |  2 --
 .../toolchain-external-linaro-aarch64-be/Config.in       | 16 ----------------
 .../Config.in.options                                    |  9 ---------
 .../toolchain-external-linaro-aarch64-be.hash            |  3 ---
 .../toolchain-external-linaro-aarch64-be.mk              | 16 ----------------
 8 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a1c1550b14..6a43c86c9c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
+	bool "Linaro AArch64 BE 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro AArch64 2018.05 BE is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2018.05 external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/support/config-fragments/autobuild/linaro-aarch64-be.config b/support/config-fragments/autobuild/linaro-aarch64-be.config
deleted file mode 100644
index e075fe7eb0..0000000000
--- a/support/config-fragments/autobuild/linaro-aarch64-be.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_aarch64_be=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 5c2f4c673e..87c58946bc 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -61,5 +61,4 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9abd77302f..007d91d451 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -13,7 +13,6 @@ source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in"
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in"
 
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
@@ -106,7 +105,6 @@ source "toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in.op
 
 # Aarch64 big-endian
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options"
 
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
deleted file mode 100644
index 295a8987f1..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
-	bool "Linaro AArch64 BE 2018.05"
-	depends on BR2_aarch64_be
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
-	  Toolchain for the AArch64 Big Endian architecture, from
-	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
deleted file mode 100644
index d44750ff08..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "aarch64_be-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-aarch64-be"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
deleted file mode 100644
index 53b6966e7b..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  412da19c1d1bff0f3172bc19fd2c024207d8d716dbe7a8dad4bf9e3d6b71d149  gcc-linaro-7.3.1-2018.05-i686_aarch64_be-linux-gnu.tar.xz
-sha256  277c1483f8dbd6007c945ffeb706fa1ba1da8ec1c397cf5cf1e29c25081426e5  gcc-linaro-7.3.1-2018.05-x86_64_aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
deleted file mode 100644
index 7a01151bf1..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-aarch64-be
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION = 2018.05
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)/aarch64_be-linux-gnu
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-i686_aarch64_be-linux-gnu.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-x86_64_aarch64_be-linux-gnu.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
