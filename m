Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344B3C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 17:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3467607C0;
	Wed, 27 Dec 2023 17:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3467607C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRnGf-1QB1Wc; Wed, 27 Dec 2023 17:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6B9C60B7C;
	Wed, 27 Dec 2023 17:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B9C60B7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1D9D1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73B7B4019D
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B7B4019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23csWdpANGnf for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 17:13:51 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1799240192
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 17:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1799240192
Received: by mail.gandi.net (Postfix) with ESMTPA id BA27920002;
 Wed, 27 Dec 2023 17:13:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 18:13:42 +0100
Message-ID: <20231227171343.2903354-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231227171343.2903354-1-thomas.petazzoni@bootlin.com>
References: <20231227171343.2903354-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703697228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCeYO6H40is2M0vEdalshFi8RYRFbk/wZIRmLsS5bZ4=;
 b=AJc27PwsnA8SAYEX12ozRLkrul4eCfY90W4qI8Lu1kRgprsWAIUmsdJHCG5BQ17WrtClrA
 0t3MWsbJWtJr8JaLW426Q17c2+pNkgE0dkxP73C46KaAkQq7hecywe2IE6JISokQD0jtdg
 W4ckWBjazcPBYt55QXU2FZU4yHw7QUv7lAgk/oxPgWpfGRfEe/pJNOpBa5Oydm863ficCN
 F6BeaSLjrU197W6zrorFYA+nlMwGRFUGEvOioD8iGdN9/dDWLNOKlpLxRflhpHnKdsbnNQ
 PDjQ944/pJ3fsRJr4HSikh8sL8X/fkgsqJWxpM01/B8jCSzgDD4fopRkUxbB6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AJc27Pws
Subject: [Buildroot] [PATCH 2/2]
 toolchain/toolchain-external/toolchain-external-bootlin: update to
 2023.11-1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

New toolchains have been released, with the following changes:

- The bleeding-edge toolchains are based on gcc 13.2, binutils 2.41,
  gdb 14.1, kernel headers 5.10, glibc 2.38, musl 1.2.4 or uclibc-ng
  1.0.45.

- The stable toolchains are based on gcc 12.3, binutils 2.40, gdb
  13.2, kernel headers 4.14, glibc 2.38, musl 1.2.4 or uclibc-ng
  1.0.45.

- The glibc version is no longer affected by CVE-2023-4911

- The gdb build has been fixed to no longer rely on uninstalled
  libbfd.so and libopcodes.so libraries

- The zlib library, which was incorrectly present in the toolchain
  sysroot, is gone, fixing various build failures encountered with
  2023.08 toolchains.

- There are now toolchains for m68k 68xxx based on uclibc and musl in
  addition to glibc, which was already supported

The careful reviewer will notice that a number of

    depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14

are being added to the toolchains that use gcc 13.x, as per
a0d2a5cfec0ade7cb577cbff25aac289e746e61b
("support/scripts/gen-bootlin-toolchains: generate
BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard").

All 214 test cases were successfully run:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1120323562

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py  |  60 ++
 .../Config.in.options                         | 618 ++++++++-----
 .../toolchain-external-bootlin.hash           | 836 +++++++++---------
 .../toolchain-external-bootlin.mk             | 438 ++++-----
 4 files changed, 1124 insertions(+), 828 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index fb82a0a377..02090755fd 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -675,6 +675,66 @@ class TestExternalToolchainBootlinArmv7mUclibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinM68k68xxxGlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_m68k=y
+        BR2_m68k_68040=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "m68k-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinM68k68xxxGlibcStable(TestExternalToolchain):
+    config = """
+        BR2_m68k=y
+        BR2_m68k_68040=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "m68k-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinM68k68xxxMuslBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_m68k=y
+        BR2_m68k_68040=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "m68k-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinM68k68xxxMuslStable(TestExternalToolchain):
+    config = """
+        BR2_m68k=y
+        BR2_m68k_68040=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "m68k-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinM68k68xxxUclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_m68k=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index eb6ed5a865..37daa731f2 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -58,8 +58,9 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Bootlin toolchain variant"
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
-	bool "aarch64 glibc bleeding-edge 2023.08-1"
+	bool "aarch64 glibc bleeding-edge 2023.11-1"
 	depends on BR2_aarch64
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -82,7 +83,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
-	bool "aarch64 glibc stable 2023.08-1"
+	bool "aarch64 glibc stable 2023.11-1"
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -107,8 +108,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
-	bool "aarch64 musl bleeding-edge 2023.08-1"
+	bool "aarch64 musl bleeding-edge 2023.11-1"
 	depends on BR2_aarch64
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -131,7 +133,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
-	bool "aarch64 musl stable 2023.08-1"
+	bool "aarch64 musl stable 2023.11-1"
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -155,8 +157,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
-	bool "aarch64 uclibc bleeding-edge 2023.08-1"
+	bool "aarch64 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_aarch64
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -179,7 +182,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
-	bool "aarch64 uclibc stable 2023.08-1"
+	bool "aarch64 uclibc stable 2023.11-1"
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -204,8 +207,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
-	bool "aarch64be glibc bleeding-edge 2023.08-1"
+	bool "aarch64be glibc bleeding-edge 2023.11-1"
 	depends on BR2_aarch64_be
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -228,7 +232,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
-	bool "aarch64be glibc stable 2023.08-1"
+	bool "aarch64be glibc stable 2023.11-1"
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -253,8 +257,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
-	bool "aarch64be musl bleeding-edge 2023.08-1"
+	bool "aarch64be musl bleeding-edge 2023.11-1"
 	depends on BR2_aarch64_be
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -277,7 +282,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
-	bool "aarch64be musl stable 2023.08-1"
+	bool "aarch64be musl stable 2023.11-1"
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -301,8 +306,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
-	bool "aarch64be uclibc bleeding-edge 2023.08-1"
+	bool "aarch64be uclibc bleeding-edge 2023.11-1"
 	depends on BR2_aarch64_be
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -325,7 +331,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
-	bool "aarch64be uclibc stable 2023.08-1"
+	bool "aarch64be uclibc stable 2023.11-1"
 	depends on BR2_aarch64_be
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -350,9 +356,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
-	bool "arcle-750d uclibc bleeding-edge 2023.08-1"
+	bool "arcle-750d uclibc bleeding-edge 2023.11-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -374,7 +381,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
-	bool "arcle-750d uclibc stable 2023.08-1"
+	bool "arcle-750d uclibc stable 2023.11-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
@@ -399,9 +406,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 glibc bleeding-edge 2023.08-1"
+	bool "arcle-hs38 glibc bleeding-edge 2023.11-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -423,7 +431,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
-	bool "arcle-hs38 glibc stable 2023.08-1"
+	bool "arcle-hs38 glibc stable 2023.11-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
@@ -448,9 +456,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 uclibc bleeding-edge 2023.08-1"
+	bool "arcle-hs38 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -472,7 +481,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
-	bool "arcle-hs38 uclibc stable 2023.08-1"
+	bool "arcle-hs38 uclibc stable 2023.11-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_11
@@ -497,10 +506,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
-	bool "armv5-eabi glibc bleeding-edge 2023.08-1"
+	bool "armv5-eabi glibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -523,7 +533,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
-	bool "armv5-eabi glibc stable 2023.08-1"
+	bool "armv5-eabi glibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
@@ -550,10 +560,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
-	bool "armv5-eabi musl bleeding-edge 2023.08-1"
+	bool "armv5-eabi musl bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -576,7 +587,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
-	bool "armv5-eabi musl stable 2023.08-1"
+	bool "armv5-eabi musl stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
@@ -603,10 +614,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
-	bool "armv5-eabi uclibc bleeding-edge 2023.08-1"
+	bool "armv5-eabi uclibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -629,7 +641,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
-	bool "armv5-eabi uclibc stable 2023.08-1"
+	bool "armv5-eabi uclibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
@@ -656,10 +668,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf glibc bleeding-edge 2023.08-1"
+	bool "armv6-eabihf glibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -682,7 +695,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
-	bool "armv6-eabihf glibc stable 2023.08-1"
+	bool "armv6-eabihf glibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
@@ -709,10 +722,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv6-eabihf musl bleeding-edge 2023.08-1"
+	bool "armv6-eabihf musl bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -735,7 +749,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
-	bool "armv6-eabihf musl stable 2023.08-1"
+	bool "armv6-eabihf musl stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
@@ -762,10 +776,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf uclibc bleeding-edge 2023.08-1"
+	bool "armv6-eabihf uclibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -788,7 +803,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
-	bool "armv6-eabihf uclibc stable 2023.08-1"
+	bool "armv6-eabihf uclibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
@@ -815,10 +830,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf glibc bleeding-edge 2023.08-1"
+	bool "armv7-eabihf glibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -841,7 +857,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
-	bool "armv7-eabihf glibc stable 2023.08-1"
+	bool "armv7-eabihf glibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
@@ -868,10 +884,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv7-eabihf musl bleeding-edge 2023.08-1"
+	bool "armv7-eabihf musl bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -894,7 +911,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
-	bool "armv7-eabihf musl stable 2023.08-1"
+	bool "armv7-eabihf musl stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
@@ -921,10 +938,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf uclibc bleeding-edge 2023.08-1"
+	bool "armv7-eabihf uclibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -947,7 +965,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
-	bool "armv7-eabihf uclibc stable 2023.08-1"
+	bool "armv7-eabihf uclibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
@@ -974,10 +992,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf glibc bleeding-edge 2023.08-1"
+	bool "armebv7-eabihf glibc bleeding-edge 2023.11-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1000,7 +1019,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
-	bool "armebv7-eabihf glibc stable 2023.08-1"
+	bool "armebv7-eabihf glibc stable 2023.11-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
@@ -1027,10 +1046,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armebv7-eabihf musl bleeding-edge 2023.08-1"
+	bool "armebv7-eabihf musl bleeding-edge 2023.11-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1053,7 +1073,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
-	bool "armebv7-eabihf musl stable 2023.08-1"
+	bool "armebv7-eabihf musl stable 2023.11-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
@@ -1080,10 +1100,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf uclibc bleeding-edge 2023.08-1"
+	bool "armebv7-eabihf uclibc bleeding-edge 2023.11-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -1106,7 +1127,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
-	bool "armebv7-eabihf uclibc stable 2023.08-1"
+	bool "armebv7-eabihf uclibc stable 2023.11-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
@@ -1133,9 +1154,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
-	bool "armv7m uclibc bleeding-edge 2023.08-1"
+	bool "armv7m uclibc bleeding-edge 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -1156,7 +1178,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
-	bool "armv7m uclibc stable 2023.08-1"
+	bool "armv7m uclibc stable 2023.11-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -1179,9 +1201,110 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE
+	bool "m68k-68xxx glibc bleeding-edge 2023.11-1"
+	depends on BR2_m68k_m68k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the m68k-68xxx architecture, using
+	  the glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE
+	bool "m68k-68xxx glibc stable 2023.11-1"
+	depends on BR2_m68k_m68k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the m68k-68xxx architecture, using
+	  the glibc C library. This is a stable version, which means
+	  it is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE
+	bool "m68k-68xxx musl bleeding-edge 2023.11-1"
+	depends on BR2_m68k_m68k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the m68k-68xxx architecture, using
+	  the musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE
+	bool "m68k-68xxx musl stable 2023.11-1"
+	depends on BR2_m68k_m68k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the m68k-68xxx architecture, using
+	  the musl C library. This is a stable version, which means
+	  it is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx uclibc bleeding-edge 2023.08-1"
+	bool "m68k-68xxx uclibc bleeding-edge 2023.11-1"
 	depends on BR2_m68k_m68k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -1204,7 +1327,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
-	bool "m68k-68xxx uclibc stable 2023.08-1"
+	bool "m68k-68xxx uclibc stable 2023.11-1"
 	depends on BR2_m68k_m68k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -1229,8 +1352,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
-	bool "m68k-coldfire uclibc bleeding-edge 2023.08-1"
+	bool "m68k-coldfire uclibc bleeding-edge 2023.11-1"
 	depends on BR2_m68k_cf
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -1251,7 +1375,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
-	bool "m68k-coldfire uclibc stable 2023.08-1"
+	bool "m68k-coldfire uclibc stable 2023.11-1"
 	depends on BR2_m68k_cf
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
@@ -1274,8 +1398,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
-	bool "microblazebe glibc bleeding-edge 2023.08-1"
+	bool "microblazebe glibc bleeding-edge 2023.11-1"
 	depends on BR2_microblazebe
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1297,7 +1422,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
-	bool "microblazebe glibc stable 2023.08-1"
+	bool "microblazebe glibc stable 2023.11-1"
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -1321,8 +1446,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
-	bool "microblazebe musl bleeding-edge 2023.08-1"
+	bool "microblazebe musl bleeding-edge 2023.11-1"
 	depends on BR2_microblazebe
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1344,7 +1470,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
-	bool "microblazebe musl stable 2023.08-1"
+	bool "microblazebe musl stable 2023.11-1"
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -1368,8 +1494,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
-	bool "microblazebe uclibc bleeding-edge 2023.08-1"
+	bool "microblazebe uclibc bleeding-edge 2023.11-1"
 	depends on BR2_microblazebe
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1392,7 +1519,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
-	bool "microblazebe uclibc stable 2023.08-1"
+	bool "microblazebe uclibc stable 2023.11-1"
 	depends on BR2_microblazebe
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
@@ -1417,8 +1544,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
-	bool "microblazeel glibc bleeding-edge 2023.08-1"
+	bool "microblazeel glibc bleeding-edge 2023.11-1"
 	depends on BR2_microblazeel
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1440,7 +1568,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
-	bool "microblazeel glibc stable 2023.08-1"
+	bool "microblazeel glibc stable 2023.11-1"
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -1464,8 +1592,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
-	bool "microblazeel musl bleeding-edge 2023.08-1"
+	bool "microblazeel musl bleeding-edge 2023.11-1"
 	depends on BR2_microblazeel
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1487,7 +1616,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
-	bool "microblazeel musl stable 2023.08-1"
+	bool "microblazeel musl stable 2023.11-1"
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -1511,8 +1640,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
-	bool "microblazeel uclibc bleeding-edge 2023.08-1"
+	bool "microblazeel uclibc bleeding-edge 2023.11-1"
 	depends on BR2_microblazeel
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1535,7 +1665,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
-	bool "microblazeel uclibc stable 2023.08-1"
+	bool "microblazeel uclibc stable 2023.11-1"
 	depends on BR2_microblazeel
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
@@ -1560,10 +1690,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
-	bool "mips32 glibc bleeding-edge 2023.08-1"
+	bool "mips32 glibc bleeding-edge 2023.11-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1586,7 +1717,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
-	bool "mips32 glibc stable 2023.08-1"
+	bool "mips32 glibc stable 2023.11-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1613,10 +1744,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
-	bool "mips32 musl bleeding-edge 2023.08-1"
+	bool "mips32 musl bleeding-edge 2023.11-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1639,7 +1771,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
-	bool "mips32 musl stable 2023.08-1"
+	bool "mips32 musl stable 2023.11-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1665,10 +1797,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
-	bool "mips32 uclibc bleeding-edge 2023.08-1"
+	bool "mips32 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -1691,7 +1824,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
-	bool "mips32 uclibc stable 2023.08-1"
+	bool "mips32 uclibc stable 2023.11-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1718,10 +1851,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
-	bool "mips32el glibc bleeding-edge 2023.08-1"
+	bool "mips32el glibc bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1744,7 +1878,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
-	bool "mips32el glibc stable 2023.08-1"
+	bool "mips32el glibc stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1771,10 +1905,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
-	bool "mips32el musl bleeding-edge 2023.08-1"
+	bool "mips32el musl bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1797,7 +1932,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
-	bool "mips32el musl stable 2023.08-1"
+	bool "mips32el musl stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1823,10 +1958,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32el uclibc bleeding-edge 2023.08-1"
+	bool "mips32el uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -1849,7 +1985,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
-	bool "mips32el uclibc stable 2023.08-1"
+	bool "mips32el uclibc stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1876,10 +2012,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r5el glibc bleeding-edge 2023.08-1"
+	bool "mips32r5el glibc bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1902,7 +2039,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
-	bool "mips32r5el glibc stable 2023.08-1"
+	bool "mips32r5el glibc stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1929,10 +2066,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
-	bool "mips32r5el musl bleeding-edge 2023.08-1"
+	bool "mips32r5el musl bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -1955,7 +2093,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
-	bool "mips32r5el musl stable 2023.08-1"
+	bool "mips32r5el musl stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -1982,10 +2120,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r5el uclibc bleeding-edge 2023.08-1"
+	bool "mips32r5el uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -2008,7 +2147,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
-	bool "mips32r5el uclibc stable 2023.08-1"
+	bool "mips32r5el uclibc stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -2035,10 +2174,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r6el glibc bleeding-edge 2023.08-1"
+	bool "mips32r6el glibc bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2061,7 +2201,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
-	bool "mips32r6el glibc stable 2023.08-1"
+	bool "mips32r6el glibc stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -2088,10 +2228,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
-	bool "mips32r6el musl bleeding-edge 2023.08-1"
+	bool "mips32r6el musl bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2114,7 +2255,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
-	bool "mips32r6el musl stable 2023.08-1"
+	bool "mips32r6el musl stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -2141,10 +2282,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r6el uclibc bleeding-edge 2023.08-1"
+	bool "mips32r6el uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -2167,7 +2309,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
-	bool "mips32r6el uclibc stable 2023.08-1"
+	bool "mips32r6el uclibc stable 2023.11-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
@@ -2194,11 +2336,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64-n32 glibc bleeding-edge 2023.08-1"
+	bool "mips64-n32 glibc bleeding-edge 2023.11-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2221,7 +2364,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
-	bool "mips64-n32 glibc stable 2023.08-1"
+	bool "mips64-n32 glibc stable 2023.11-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
@@ -2249,11 +2392,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
-	bool "mips64-n32 musl bleeding-edge 2023.08-1"
+	bool "mips64-n32 musl bleeding-edge 2023.11-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2276,7 +2420,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
-	bool "mips64-n32 musl stable 2023.08-1"
+	bool "mips64-n32 musl stable 2023.11-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
@@ -2304,11 +2448,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64-n32 uclibc bleeding-edge 2023.08-1"
+	bool "mips64-n32 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -2331,7 +2476,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
-	bool "mips64-n32 uclibc stable 2023.08-1"
+	bool "mips64-n32 uclibc stable 2023.11-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
@@ -2359,11 +2504,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 glibc bleeding-edge 2023.08-1"
+	bool "mips64el-n32 glibc bleeding-edge 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2386,7 +2532,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
-	bool "mips64el-n32 glibc stable 2023.08-1"
+	bool "mips64el-n32 glibc stable 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
@@ -2414,11 +2560,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64el-n32 musl bleeding-edge 2023.08-1"
+	bool "mips64el-n32 musl bleeding-edge 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2441,7 +2588,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
-	bool "mips64el-n32 musl stable 2023.08-1"
+	bool "mips64el-n32 musl stable 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
@@ -2469,11 +2616,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 uclibc bleeding-edge 2023.08-1"
+	bool "mips64el-n32 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -2496,7 +2644,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
-	bool "mips64el-n32 uclibc stable 2023.08-1"
+	bool "mips64el-n32 uclibc stable 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
@@ -2524,11 +2672,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 glibc bleeding-edge 2023.08-1"
+	bool "mips64r6el-n32 glibc bleeding-edge 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2551,7 +2700,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
-	bool "mips64r6el-n32 glibc stable 2023.08-1"
+	bool "mips64r6el-n32 glibc stable 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
@@ -2579,11 +2728,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64r6el-n32 musl bleeding-edge 2023.08-1"
+	bool "mips64r6el-n32 musl bleeding-edge 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2606,7 +2756,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
-	bool "mips64r6el-n32 musl stable 2023.08-1"
+	bool "mips64r6el-n32 musl stable 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
@@ -2634,11 +2784,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 uclibc bleeding-edge 2023.08-1"
+	bool "mips64r6el-n32 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -2661,7 +2812,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
-	bool "mips64r6el-n32 uclibc stable 2023.08-1"
+	bool "mips64r6el-n32 uclibc stable 2023.11-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
@@ -2689,8 +2840,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
-	bool "nios2 glibc bleeding-edge 2023.08-1"
+	bool "nios2 glibc bleeding-edge 2023.11-1"
 	depends on BR2_nios2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2713,7 +2865,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
-	bool "nios2 glibc stable 2023.08-1"
+	bool "nios2 glibc stable 2023.11-1"
 	depends on BR2_nios2
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -2738,8 +2890,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
-	bool "openrisc glibc bleeding-edge 2023.08-1"
+	bool "openrisc glibc bleeding-edge 2023.11-1"
 	depends on BR2_or1k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -2763,7 +2916,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
-	bool "openrisc glibc stable 2023.08-1"
+	bool "openrisc glibc stable 2023.11-1"
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -2789,8 +2942,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2023.08-1"
+	bool "openrisc musl bleeding-edge 2023.11-1"
 	depends on BR2_or1k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -2814,7 +2968,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2023.08-1"
+	bool "openrisc musl stable 2023.11-1"
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	depends on BR2_USE_MMU
@@ -2839,8 +2993,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2023.08-1"
+	bool "openrisc uclibc bleeding-edge 2023.11-1"
 	depends on BR2_or1k
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2864,7 +3019,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2023.08-1"
+	bool "openrisc uclibc stable 2023.11-1"
 	depends on BR2_or1k
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
@@ -2890,9 +3045,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp glibc bleeding-edge 2023.08-1"
+	bool "powerpc-440fp glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2915,7 +3071,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
-	bool "powerpc-440fp glibc stable 2023.08-1"
+	bool "powerpc-440fp glibc stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -2941,9 +3097,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
-	bool "powerpc-440fp musl bleeding-edge 2023.08-1"
+	bool "powerpc-440fp musl bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2965,7 +3122,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
-	bool "powerpc-440fp musl stable 2023.08-1"
+	bool "powerpc-440fp musl stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -2990,9 +3147,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp uclibc bleeding-edge 2023.08-1"
+	bool "powerpc-440fp uclibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -3015,7 +3173,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
-	bool "powerpc-440fp uclibc stable 2023.08-1"
+	bool "powerpc-440fp uclibc stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3041,9 +3199,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 glibc bleeding-edge 2023.08-1"
+	bool "powerpc-e300c3 glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3066,7 +3225,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
-	bool "powerpc-e300c3 glibc stable 2023.08-1"
+	bool "powerpc-e300c3 glibc stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3092,9 +3251,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
-	bool "powerpc-e300c3 musl bleeding-edge 2023.08-1"
+	bool "powerpc-e300c3 musl bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3116,7 +3276,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
-	bool "powerpc-e300c3 musl stable 2023.08-1"
+	bool "powerpc-e300c3 musl stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3141,9 +3301,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 uclibc bleeding-edge 2023.08-1"
+	bool "powerpc-e300c3 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -3166,7 +3327,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
-	bool "powerpc-e300c3 uclibc stable 2023.08-1"
+	bool "powerpc-e300c3 uclibc stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3192,9 +3353,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc glibc bleeding-edge 2023.08-1"
+	bool "powerpc-e500mc glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3217,7 +3379,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
-	bool "powerpc-e500mc glibc stable 2023.08-1"
+	bool "powerpc-e500mc glibc stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3243,9 +3405,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
-	bool "powerpc-e500mc musl bleeding-edge 2023.08-1"
+	bool "powerpc-e500mc musl bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3267,7 +3430,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
-	bool "powerpc-e500mc musl stable 2023.08-1"
+	bool "powerpc-e500mc musl stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3292,9 +3455,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc uclibc bleeding-edge 2023.08-1"
+	bool "powerpc-e500mc uclibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -3317,7 +3481,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
-	bool "powerpc-e500mc uclibc stable 2023.08-1"
+	bool "powerpc-e500mc uclibc stable 2023.11-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3343,9 +3507,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e5500 glibc bleeding-edge 2023.08-1"
+	bool "powerpc64-e5500 glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3368,7 +3533,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
-	bool "powerpc64-e5500 glibc stable 2023.08-1"
+	bool "powerpc64-e5500 glibc stable 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3394,9 +3559,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e6500 glibc bleeding-edge 2023.08-1"
+	bool "powerpc64-e6500 glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3419,7 +3585,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
-	bool "powerpc64-e6500 glibc stable 2023.08-1"
+	bool "powerpc64-e6500 glibc stable 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3445,9 +3611,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
-	bool "powerpc64-e6500 musl bleeding-edge 2023.08-1"
+	bool "powerpc64-e6500 musl bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3470,7 +3637,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
-	bool "powerpc64-e6500 musl stable 2023.08-1"
+	bool "powerpc64-e6500 musl stable 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3496,9 +3663,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-power8 glibc bleeding-edge 2023.08-1"
+	bool "powerpc64-power8 glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3521,7 +3689,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
-	bool "powerpc64-power8 glibc stable 2023.08-1"
+	bool "powerpc64-power8 glibc stable 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3547,9 +3715,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64-power8 musl bleeding-edge 2023.08-1"
+	bool "powerpc64-power8 musl bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3572,7 +3741,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
-	bool "powerpc64-power8 musl stable 2023.08-1"
+	bool "powerpc64-power8 musl stable 2023.11-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3598,9 +3767,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64le-power8 glibc bleeding-edge 2023.08-1"
+	bool "powerpc64le-power8 glibc bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3623,7 +3793,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
-	bool "powerpc64le-power8 glibc stable 2023.08-1"
+	bool "powerpc64le-power8 glibc stable 2023.11-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3649,9 +3819,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64le-power8 musl bleeding-edge 2023.08-1"
+	bool "powerpc64le-power8 musl bleeding-edge 2023.11-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3674,7 +3845,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
-	bool "powerpc64le-power8 musl stable 2023.08-1"
+	bool "powerpc64le-power8 musl stable 2023.11-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3700,11 +3871,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d glibc bleeding-edge 2023.08-1"
+	bool "riscv32-ilp32d glibc bleeding-edge 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3727,12 +3899,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d glibc bleeding-edge 2023.08-1"
+	bool "riscv64-lp64d glibc bleeding-edge 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
@@ -3754,7 +3927,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
-	bool "riscv64-lp64d glibc stable 2023.08-1"
+	bool "riscv64-lp64d glibc stable 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
@@ -3782,12 +3955,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
-	bool "riscv64-lp64d musl bleeding-edge 2023.08-1"
+	bool "riscv64-lp64d musl bleeding-edge 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_INSTALL_LIBSTDCPP
@@ -3809,7 +3983,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
-	bool "riscv64-lp64d musl stable 2023.08-1"
+	bool "riscv64-lp64d musl stable 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
@@ -3837,12 +4011,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d uclibc bleeding-edge 2023.08-1"
+	bool "riscv64-lp64d uclibc bleeding-edge 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -3865,7 +4040,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
-	bool "riscv64-lp64d uclibc stable 2023.08-1"
+	bool "riscv64-lp64d uclibc stable 2023.11-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
@@ -3894,9 +4069,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
-	bool "s390x-z13 glibc bleeding-edge 2023.08-1"
+	bool "s390x-z13 glibc bleeding-edge 2023.11-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3919,7 +4095,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
-	bool "s390x-z13 glibc stable 2023.08-1"
+	bool "s390x-z13 glibc stable 2023.11-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3945,9 +4121,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4 glibc bleeding-edge 2023.08-1"
+	bool "sh-sh4 glibc bleeding-edge 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3970,7 +4147,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
-	bool "sh-sh4 glibc stable 2023.08-1"
+	bool "sh-sh4 glibc stable 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -3996,9 +4173,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
-	bool "sh-sh4 musl bleeding-edge 2023.08-1"
+	bool "sh-sh4 musl bleeding-edge 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4021,7 +4199,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
-	bool "sh-sh4 musl stable 2023.08-1"
+	bool "sh-sh4 musl stable 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -4046,9 +4224,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
-	bool "sh-sh4 uclibc bleeding-edge 2023.08-1"
+	bool "sh-sh4 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -4071,7 +4250,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
-	bool "sh-sh4 uclibc stable 2023.08-1"
+	bool "sh-sh4 uclibc stable 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -4097,9 +4276,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4aeb glibc bleeding-edge 2023.08-1"
+	bool "sh-sh4aeb glibc bleeding-edge 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4122,7 +4302,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
-	bool "sh-sh4aeb glibc stable 2023.08-1"
+	bool "sh-sh4aeb glibc stable 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -4148,9 +4328,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
-	bool "sh-sh4aeb musl bleeding-edge 2023.08-1"
+	bool "sh-sh4aeb musl bleeding-edge 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4173,7 +4354,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
-	bool "sh-sh4aeb musl stable 2023.08-1"
+	bool "sh-sh4aeb musl stable 2023.11-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -4198,9 +4379,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
-	bool "sparc64 glibc bleeding-edge 2023.08-1"
+	bool "sparc64 glibc bleeding-edge 2023.11-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4223,7 +4405,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
-	bool "sparc64 glibc stable 2023.08-1"
+	bool "sparc64 glibc stable 2023.11-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -4301,11 +4483,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
-	bool "x86-64 glibc bleeding-edge 2023.08-1"
+	bool "x86-64 glibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4328,7 +4511,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
-	bool "x86-64 glibc stable 2023.08-1"
+	bool "x86-64 glibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4356,11 +4539,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
-	bool "x86-64 musl bleeding-edge 2023.08-1"
+	bool "x86-64 musl bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4383,7 +4567,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
-	bool "x86-64 musl stable 2023.08-1"
+	bool "x86-64 musl stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4410,11 +4594,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
-	bool "x86-64 uclibc bleeding-edge 2023.08-1"
+	bool "x86-64 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -4437,7 +4622,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
-	bool "x86-64 uclibc stable 2023.08-1"
+	bool "x86-64 uclibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4465,7 +4650,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 glibc bleeding-edge 2023.08-1"
+	bool "x86-64-v2 glibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4474,6 +4659,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4496,7 +4682,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
-	bool "x86-64-v2 glibc stable 2023.08-1"
+	bool "x86-64-v2 glibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4528,7 +4714,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
-	bool "x86-64-v2 musl bleeding-edge 2023.08-1"
+	bool "x86-64-v2 musl bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4537,6 +4723,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4559,7 +4746,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
-	bool "x86-64-v2 musl stable 2023.08-1"
+	bool "x86-64-v2 musl stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4590,7 +4777,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 uclibc bleeding-edge 2023.08-1"
+	bool "x86-64-v2 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4599,6 +4786,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -4621,7 +4809,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
-	bool "x86-64-v2 uclibc stable 2023.08-1"
+	bool "x86-64-v2 uclibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4653,7 +4841,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 glibc bleeding-edge 2023.08-1"
+	bool "x86-64-v3 glibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4664,6 +4852,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4686,7 +4875,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
-	bool "x86-64-v3 glibc stable 2023.08-1"
+	bool "x86-64-v3 glibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4720,7 +4909,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
-	bool "x86-64-v3 musl bleeding-edge 2023.08-1"
+	bool "x86-64-v3 musl bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4731,6 +4920,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4753,7 +4943,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
-	bool "x86-64-v3 musl stable 2023.08-1"
+	bool "x86-64-v3 musl stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4786,7 +4976,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 uclibc bleeding-edge 2023.08-1"
+	bool "x86-64-v3 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4797,6 +4987,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -4819,7 +5010,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
-	bool "x86-64-v3 uclibc stable 2023.08-1"
+	bool "x86-64-v3 uclibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4853,7 +5044,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 glibc bleeding-edge 2023.08-1"
+	bool "x86-64-v4 glibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4865,6 +5056,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4887,7 +5079,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
-	bool "x86-64-v4 glibc stable 2023.08-1"
+	bool "x86-64-v4 glibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4922,7 +5114,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
-	bool "x86-64-v4 musl bleeding-edge 2023.08-1"
+	bool "x86-64-v4 musl bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4934,6 +5126,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -4956,7 +5149,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
-	bool "x86-64-v4 musl stable 2023.08-1"
+	bool "x86-64-v4 musl stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4990,7 +5183,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 uclibc bleeding-edge 2023.08-1"
+	bool "x86-64-v4 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5002,6 +5195,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -5024,7 +5218,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
-	bool "x86-64-v4 uclibc stable 2023.08-1"
+	bool "x86-64-v4 uclibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5059,7 +5253,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 glibc bleeding-edge 2023.08-1"
+	bool "x86-64-core-i7 glibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5068,6 +5262,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -5090,7 +5285,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
-	bool "x86-64-core-i7 glibc stable 2023.08-1"
+	bool "x86-64-core-i7 glibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5122,7 +5317,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
-	bool "x86-64-core-i7 musl bleeding-edge 2023.08-1"
+	bool "x86-64-core-i7 musl bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5131,6 +5326,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -5153,7 +5349,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
-	bool "x86-64-core-i7 musl stable 2023.08-1"
+	bool "x86-64-core-i7 musl stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5185,7 +5381,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 uclibc bleeding-edge 2023.08-1"
+	bool "x86-64-core-i7 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5194,6 +5390,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -5216,7 +5413,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
-	bool "x86-64-core-i7 uclibc stable 2023.08-1"
+	bool "x86-64-core-i7 uclibc stable 2023.11-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5248,13 +5445,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
-	bool "x86-core2 glibc bleeding-edge 2023.08-1"
+	bool "x86-core2 glibc bleeding-edge 2023.11-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -5277,7 +5475,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
-	bool "x86-core2 glibc stable 2023.08-1"
+	bool "x86-core2 glibc stable 2023.11-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5307,13 +5505,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
-	bool "x86-core2 musl bleeding-edge 2023.08-1"
+	bool "x86-core2 musl bleeding-edge 2023.11-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -5335,7 +5534,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
-	bool "x86-core2 musl stable 2023.08-1"
+	bool "x86-core2 musl stable 2023.11-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5363,13 +5562,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
-	bool "x86-core2 uclibc bleeding-edge 2023.08-1"
+	bool "x86-core2 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -5392,7 +5592,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
-	bool "x86-core2 uclibc stable 2023.08-1"
+	bool "x86-core2 uclibc stable 2023.11-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -5422,7 +5622,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
-	bool "x86-i686 glibc bleeding-edge 2023.08-1"
+	bool "x86-i686 glibc bleeding-edge 2023.11-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5432,6 +5632,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -5454,7 +5655,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
-	bool "x86-i686 glibc stable 2023.08-1"
+	bool "x86-i686 glibc stable 2023.11-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5487,7 +5688,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
-	bool "x86-i686 musl bleeding-edge 2023.08-1"
+	bool "x86-i686 musl bleeding-edge 2023.11-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5497,6 +5698,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -5518,7 +5720,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
-	bool "x86-i686 musl stable 2023.08-1"
+	bool "x86-i686 musl stable 2023.11-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5549,7 +5751,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
-	bool "x86-i686 uclibc bleeding-edge 2023.08-1"
+	bool "x86-i686 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5559,6 +5761,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -5581,7 +5784,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
-	bool "x86-i686 uclibc stable 2023.08-1"
+	bool "x86-i686 uclibc stable 2023.11-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -5614,10 +5817,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
-	bool "xtensa-lx60 uclibc bleeding-edge 2023.08-1"
+	bool "xtensa-lx60 uclibc bleeding-edge 2023.11-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
 	select BR2_USE_WCHAR
@@ -5640,7 +5844,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
-	bool "xtensa-lx60 uclibc stable 2023.08-1"
+	bool "xtensa-lx60 uclibc stable 2023.11-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 29bbdf56c2..38cdba5d7d 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -1,420 +1,428 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2023.08-1.sha256
-sha256  62094460b853970dcba91cae4314bfd1210bb2963be540f7b69be882f5f795ba  aarch64--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2023.08-1.sha256
-sha256  aed4223eadef27c1a84676333cbbdb75cbb5ee5a4a0cfc3ec5a491c6a6179de8  aarch64--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2023.08-1.sha256
-sha256  6e3f69eb9b85d8672805220c7af10bc7a761eb67504931b092d840dc4e1afa90  aarch64--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2023.08-1.sha256
-sha256  25767ae9ca70a76e9a71a13c6bc145532066a36d118d8f0ef14bd474784095ce  aarch64--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  7ca79cbebf0143d89734765b259b5b261a22ecd4cde37f8dda0a02a152f49296  aarch64--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2023.08-1.sha256
-sha256  4c05602d75bc97a9acdcba3e94ed14d6452f176970a1e446bdb5a672fe2b77fb  aarch64--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2023.08-1.sha256
-sha256  a1df95eb94350b77c32d84dc9a1730f541d29ce6679331ea6eebe803a28427c7  aarch64be--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2023.08-1.sha256
-sha256  f03d955da294083b62505d7c0d0093fb289ab51377b8be980b537f8a3da6f34e  aarch64be--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2023.08-1.sha256
-sha256  b2b30d563559664d0efc23eb00bc469c808bdfd400198967ba1255863301efc0  aarch64be--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2023.08-1.sha256
-sha256  d24322115bffa3bde073a39149527cb212a9d07b2bc8cfad57145c13ec60ece5  aarch64be--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  8d3f1b453643a80331543688e08c2a979a83eef59f7a9db1ec9a4dab8fe868a5  aarch64be--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2023.08-1.sha256
-sha256  6f92269995e4e028a3b0d7982827fcff415b56fae34a61d845775332f981061d  aarch64be--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  7129cef2a9c3c511c6c7f025cfe526be9d30150707e1e400780c611369b5ed02  arcle-750d--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2023.08-1.sha256
-sha256  1e1ce3fb4eda609dc73df731a7192cf1fcaabade8ea65f9bce6d9e9be41633b9  arcle-750d--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2023.08-1.sha256
-sha256  69e9c144a86931eba4b56873e8973f018d4edc2151aa8fdbefb4f2948a1af8f9  arcle-hs38--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2023.08-1.sha256
-sha256  71a078574d1ab044a04b1e79d10af46a6334ad43d82ff4b76b5547d70b9ef4b7  arcle-hs38--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  ce56ea212cad7d23fd9544d60916808762c21a32b2492ca96e94b07d1762bbcd  arcle-hs38--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2023.08-1.sha256
-sha256  b0835a1eda4c9a0b82fcfe053a7f879dbb2518fc9311229d015ac43354413479  arcle-hs38--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2023.08-1.sha256
-sha256  79e017a9f7455a679eeb734c029cf17b32c62c30e85e39d48154645f2bef7f11  armv5-eabi--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2023.08-1.sha256
-sha256  65eee9d2e60a2ad78a4bb852eaf1039f26ede6bb04292999b384b1cc0178ec58  armv5-eabi--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2023.08-1.sha256
-sha256  7ad1405bb5407f890d1958abaab0c9ae47ab30c4120aed98d3ed88e9915c749d  armv5-eabi--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2023.08-1.sha256
-sha256  15c5e09b21328e1a8bfa641fac208934b32bc2e4c1ebab9e9343ad59ed30e869  armv5-eabi--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  d7be53ed9bdf7c56c8cba39580d1528aad6fa4dd79d75a836adfe454b3cfd5ab  armv5-eabi--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2023.08-1.sha256
-sha256  b8e4a8426819eb226d30facf93288855b7710165b5aecc2224b65936b64bc3ad  armv5-eabi--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2023.08-1.sha256
-sha256  7d72017f0e8da2f9804ffe913d1e7a9b1fe8629c107354cb3c84bc08acf58f0b  armv6-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2023.08-1.sha256
-sha256  fc2bc606081754dbfb8fbb955d66a9d07bce844777ba6501d2c31763a17cc86f  armv6-eabihf--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2023.08-1.sha256
-sha256  23bb6e3ded0399604cb810d903f3d7bbdde13274575f8e91da094045044cd910  armv6-eabihf--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2023.08-1.sha256
-sha256  7f8a93f39d7470e5587c05e74780fcdcb49165fcaf7436ff4e4fe301a0ff3f93  armv6-eabihf--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  f06216aa73f8d02a34e09a3db79d3d34fbc31ecde7883896d497dbc10c60a636  armv6-eabihf--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2023.08-1.sha256
-sha256  f0f77ddb287d64a0ddcf07241dab9afeeda7cf02f0959e85f7048564c0b1bcff  armv6-eabihf--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2023.08-1.sha256
-sha256  fe0b14d6c92ab939d47dcff1f39552aa299d9bbdf0a4571428c56daf69246e70  armv7-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2023.08-1.sha256
-sha256  8b87e1694e3554260d31583d19201a5d420c4c0a903396aea2d29bbce104c8ec  armv7-eabihf--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2023.08-1.sha256
-sha256  6422c3fe6cb66694a0c3384e39ffe352b3e69cf4035e64180765a23973bb00d1  armv7-eabihf--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2023.08-1.sha256
-sha256  4f06ed760d3b2e779f0d8aec73becd21edce9d04560d2fba53549ca8c12f51ba  armv7-eabihf--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  4a5b34842986fb0c2e08c67ecb2c35ddf9576ae0b575ae40ab7d887d4ef24a42  armv7-eabihf--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2023.08-1.sha256
-sha256  45b079fe0bb57ce5d8ae2d0e8d675b7abac7f5de58570a084df61a992224a961  armv7-eabihf--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2023.08-1.sha256
-sha256  c70e70ae5ed56752ad55b5b989f385378d5a11e8f0e3e6ee88476db81c459ab0  armebv7-eabihf--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2023.08-1.sha256
-sha256  d762a7abeac58dad63f6beec5e867243259779124531c1d7507ea95b68e884d3  armebv7-eabihf--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2023.08-1.sha256
-sha256  57aaad8d2d8f6b28d95132f7dff3963264d441155e06d4605c11a32e62e255a0  armebv7-eabihf--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2023.08-1.sha256
-sha256  c707a9ba4bedc4db3e23653038c17ee7ee55e1d8c8bb2cc14cf47d5c3dcc4b9d  armebv7-eabihf--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  bf69352181139d7c206841e5a3d6d671b75db42c6311e5ec6825d574317c637f  armebv7-eabihf--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2023.08-1.sha256
-sha256  8223fd5853298060e253b595615bedaa0c43a957d630133e99cd63c0d600e402  armebv7-eabihf--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  94583517119f1d02ca205787bda91252a7693a3c1895e34057fcb48b66115032  armv7m--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2023.08-1.sha256
-sha256  e903697238d4c75595bf9ca112e2b09c3a1457f0142d39c5bab523650a327994  armv7m--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  61c7953c741113f30ff643fa846713c8b88bd2c4a91de26349e504d553e8ca9c  m68k-68xxx--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2023.08-1.sha256
-sha256  e631e9fea5fad6db056e9028c17e41abca9f7bb6463950045756d040dfb34a6f  m68k-68xxx--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  59dc6c063a9e982042bbfde36b5cbe263b3130e6ee04df8b8503cfde0cbcc43d  m68k-coldfire--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2023.08-1.sha256
-sha256  25d516ad069fd64f6d891606455cc9e5584b002a658e2dbbfbb1cdd2fa2cddd4  m68k-coldfire--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2023.08-1.sha256
-sha256  52964e876701c8d8cceaf241720741b290b32cf3aeff04e5c0a9b2bb8867e00c  microblazebe--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2023.08-1.sha256
-sha256  f83fe1e9788c43c502322d7b1dff57030718fd461b9df06d27ce69653b234489  microblazebe--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2023.08-1.sha256
-sha256  66455c641d0d7dd61c01a9791d9225e4a02d9f33571993bdf53b07f5ce85d112  microblazebe--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2023.08-1.sha256
-sha256  0605fcdc0b8be08a1737b73f090782b16c5f905996a14a2a587c99d3bf6a76b2  microblazebe--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  384f1b9573e9e187407b2b2afc88ca5161de866ef792928b856972bfb6abc3b3  microblazebe--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2023.08-1.sha256
-sha256  8e432dd0fbc4c4ea0e64bd8bfa37c17cdcc4f6b1ccb6a78a68dc21bfc00590f1  microblazebe--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2023.08-1.sha256
-sha256  5abe0a6cc448284bc0442b49e7266acf73cffe2c10e7c4472346c3a4ac810ce9  microblazeel--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2023.08-1.sha256
-sha256  72f0efd879d97cbdfb2b362d2f1f7f53cfaf5254ebb4928e503e74f65ab578de  microblazeel--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2023.08-1.sha256
-sha256  923616f2c14a571cc9257f81b9373a49b86997c6cbe8ecf5cd816527d04dd321  microblazeel--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2023.08-1.sha256
-sha256  69cef52cf75cb9c1b127a3c7a657aef98d0c419188b3cbb1a3a79b61a7327b30  microblazeel--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  f9f41a97c6a3278d6d9c62280f40c13684addf31a29cc81813fa899ccd2aacc4  microblazeel--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2023.08-1.sha256
-sha256  cccb9cd740adb524d144967d5bd2382a88b5f1c737c6dd38981c462dc86ea162  microblazeel--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2023.08-1.sha256
-sha256  93a266be4d77df50112274830358160252c618217a28b5bdc1a2944e97e1bc9b  mips32--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2023.08-1.sha256
-sha256  6b84446398d4c3241fdec0f8f4933b88df9b2c119845390a6d3afc76c092c750  mips32--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2023.08-1.sha256
-sha256  4dbb260e89f95c851ccf29a729f15725112b361d9ab93ba4f732548c76bc6c39  mips32--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2023.08-1.sha256
-sha256  4b7004efce6d23b4c90e2ac1e8ba98d835ea61b1c36adddf688efe891c75fe9b  mips32--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  b243c072465bee94cdac3af715eab513d07fc41fe067dc5d19cec0cb8acc53c8  mips32--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2023.08-1.sha256
-sha256  dd5b0a4ae492e5023029cef073e43621c83d6b4858cda4cdf148b0e2e9ad468b  mips32--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2023.08-1.sha256
-sha256  190300b5a7056f3b5cc5de1637fe8f52d74aad1b0335b2291c46341c6e4589e4  mips32el--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2023.08-1.sha256
-sha256  5594d9f0ab8c14b4eed181c7a383399fadeb56b84e4fa5f22460dfaf68ab819e  mips32el--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2023.08-1.sha256
-sha256  d267cbc5ecb9e22bab2edd95450ae314f7d75d2eac34574f8df87d5778d8ae07  mips32el--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2023.08-1.sha256
-sha256  818b57f58b2b03b2246a561c1ec427bab87158cbb99e1ccce5c814774cdc791b  mips32el--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  5ba6bab76c827870f5da94cc125b77144e5e7abf2bbbea348ccebdb60084a857  mips32el--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2023.08-1.sha256
-sha256  98ec0d45de93f531896f4273f206ff1fe10d87bd728d11945c5a9f8cfff3de16  mips32el--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2023.08-1.sha256
-sha256  ddf0f8b760422ceebb1a797ae9e75001a77b8a67cb5ba8737e409d1a3491c9ae  mips32r5el--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2023.08-1.sha256
-sha256  18127d0728f1200483ec6739357e4d19cc2df9de33f76bf70598b78b43ff2496  mips32r5el--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2023.08-1.sha256
-sha256  7a8e20d4dfb7e75f4d1c032ebb0ee36aab321797ed21a2cc325ea819fd569c3b  mips32r5el--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2023.08-1.sha256
-sha256  8b8e6b402ac3343d37e766907d4871512b1ffe3cd9079a3ca226eeba290d2a5d  mips32r5el--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  e0d320e1bb1c4d7f0f6724368cbd4f79868123e1b8cfd06ee14c2a20d69484ff  mips32r5el--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2023.08-1.sha256
-sha256  883d72f17f040410b9ff05aaee6cf6ccda46ae2e99fe9ffbc03a72f0a4789096  mips32r5el--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2023.08-1.sha256
-sha256  4924db22355c9f797dc6776b426ce72618a1803b225370519e7dfe44c2957094  mips32r6el--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2023.08-1.sha256
-sha256  2f4b44733eb26884a4d941dcd5f5ea88f7b17f8b1b68cf799e047a55ab7b7e65  mips32r6el--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2023.08-1.sha256
-sha256  1a3c850dd6619791ca32042e3b3f52f25e33c8b050a6f102efb2a3568a63a43f  mips32r6el--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2023.08-1.sha256
-sha256  ec544f499dc7f1713f09c2424844228183cf68ff77061bc6c65821855a7228cd  mips32r6el--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  9e046c31cd9d59fb7126693644a722cd9141381ddeda69a7c8e648aa65037c41  mips32r6el--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2023.08-1.sha256
-sha256  901d78b12dcab01006616ccc8797d593c53d361752b4cd04791495a3470dfe12  mips32r6el--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2023.08-1.sha256
-sha256  94a2afea880a378a82c3f146671ad9b86f6e05bb13f97573d26c9214adb5b064  mips64-n32--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2023.08-1.sha256
-sha256  83f673bebab7df55324362f97a483490a27199faf336780866d2de84b9f76895  mips64-n32--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2023.08-1.sha256
-sha256  178b2702d652bffd8d8f7ca7e0a756ce044485b7e26f29db47d19c9a3b700869  mips64-n32--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2023.08-1.sha256
-sha256  49fb59b0ce83ce0f60fda437c43f107519f538aadaf0c029f65c32f279852a6e  mips64-n32--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  6d3825d31c0f91f0d319517ebbf67bb9c44d779224ebd8e90e88c9a7d75bc07b  mips64-n32--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2023.08-1.sha256
-sha256  b2d87b8d501570fc07e19d6fd78d41c7be891c64cb9565c827eaa4b16a4212ae  mips64-n32--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2023.08-1.sha256
-sha256  d7ed3131fc1eab9dde7a242652043756caa09848f7c63cb283f79f42e38ffdab  mips64el-n32--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2023.08-1.sha256
-sha256  d23f56b610be40774f41af5b96cffdd8dd35b983a0e5ed42b2a1a88ddafce6c9  mips64el-n32--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2023.08-1.sha256
-sha256  f1d63dfa8615d6ffec4d66751e483623de0ccdf1fdb70d1981104457ba5cf4ff  mips64el-n32--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2023.08-1.sha256
-sha256  2a558c0665497bb7976d02a3fd5c1e7b8a61c753373cebbef799b1aae2e7d307  mips64el-n32--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  25599336b65c1d0ede5d02b128bac0f4d3b21ec5d21c260c702849e94317adfc  mips64el-n32--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2023.08-1.sha256
-sha256  220d8dbbd81d71cb4d6345757ea78ab03a263bf664bc7a1732450da3555c18b1  mips64el-n32--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2023.08-1.sha256
-sha256  09d36c965e88e413604820c53118f999ad0552422e15c27d34b0ef182c620c89  mips64r6el-n32--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2023.08-1.sha256
-sha256  ef65c7717cd1560c08097f669244515b8261e5f4df4cda1780c507f43b98ada7  mips64r6el-n32--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2023.08-1.sha256
-sha256  b6d673e2e742dda1e2865759737419781190df06f57db4d6a3945dd4be161bd9  mips64r6el-n32--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2023.08-1.sha256
-sha256  cd879a9cba5ebb5ad1e5ea93dc0465661a38af8a5b968c06043ce259f612f903  mips64r6el-n32--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  46471513a3ed2fe2b5f18e27d6f314d50b2799e85714ee2610276c01caeb3580  mips64r6el-n32--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2023.08-1.sha256
-sha256  c6525bb93fcac16a354e039abd47ebdd33c379a364c812bab3b8dd69ab27dcb2  mips64r6el-n32--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2023.08-1.sha256
-sha256  b4278214069a381ac8979e0d957ca6a122b92e54bf3d443845ae421f96259b59  nios2--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2023.08-1.sha256
-sha256  427c9c52209927883865b74d0c1310b47148013832069359da6d9fd23654b2be  nios2--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2023.08-1.sha256
-sha256  6d94154ffcce33d0f24fc7bf0a0ac3dcf794aecabc42d126e8fca772d55dcec3  openrisc--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2023.08-1.sha256
-sha256  bae2a29dcff4606c40766da9cae88be0846b5bdc870e83e282ffde1f93be1c1b  openrisc--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2023.08-1.sha256
-sha256  c663809a5f5ec6c23eefd85f0eb0b341d3ca5b782adb243c16ab3cd6ef3db93d  openrisc--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2023.08-1.sha256
-sha256  88fd3eb838a2527980aba33403c7654b156665aafe825a4f86f1af2007277e15  openrisc--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  6fd48b14f900ef94cb7763eef9e2a4cd5f55a02591050be9bf7286fb53f7a073  openrisc--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2023.08-1.sha256
-sha256  6857723b0fc53465d2d2a7a32efc694443dd0a1ba4d1abebc5b9d2f7a9389b76  openrisc--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2023.08-1.sha256
-sha256  860e79fd5e3e65094e26af8c08273b5cb25b416ed33d95f0d30ce01751c61bc6  powerpc-440fp--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2023.08-1.sha256
-sha256  e8b0ecf725c48794f8fa33b05725cbb8f988b364c66a371c414c6cf0118669f4  powerpc-440fp--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2023.08-1.sha256
-sha256  bb55c1a0b4cce5ea40b6fbbd81259bb295c31e71e150dfd4df8f27add4fd75fb  powerpc-440fp--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2023.08-1.sha256
-sha256  c95aafaf7257a9ba125d2ff7a126c5f31123db45c200a63549e13b17526e091f  powerpc-440fp--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  ca1f56e00b2b4163fb82a011e1ca9d7d2463332aa483321b850395cb8f8686fd  powerpc-440fp--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2023.08-1.sha256
-sha256  94f5cdc6aed04d46d8bec86e7109b8195c0f8d373478724f9af2bedeac57543d  powerpc-440fp--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2023.08-1.sha256
-sha256  6fa51b33d4ee181f82179e56c410e752dddc809dd2dac748686d1a414ae4dfb1  powerpc-e300c3--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2023.08-1.sha256
-sha256  c997956cb53d65491557aeca2fcff951348b12d07764057d4942d58accad4925  powerpc-e300c3--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2023.08-1.sha256
-sha256  f158d1d49b1578ce36261a26d82e221937e2c11575bb25133e69fd3dfc43a8d9  powerpc-e300c3--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2023.08-1.sha256
-sha256  49bf91af733b5efc107f8d1764959feeb5de0fa10b3f80e60cbb167aaef3d1ab  powerpc-e300c3--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  b4b0d05b9b81be8ab0b0bfc2aae08aeb7adf1c9dbf9f78a7311c5caf30f03869  powerpc-e300c3--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2023.08-1.sha256
-sha256  75acfa5021ba296b069aa787cf3cf84c950eaff87e201494dea530bf4d503556  powerpc-e300c3--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2023.08-1.sha256
-sha256  ca322217020237d0c728119654337857e2643ae848f808eb575a2223f191f89b  powerpc-e500mc--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2023.08-1.sha256
-sha256  7c767173e9d96c11927be890fd34052873406c5c707ac031aaf5c6f956c2fee9  powerpc-e500mc--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2023.08-1.sha256
-sha256  a47518b65c9d866b7d61b1382149b7c63da1a5166e3291096b34cb6407f5382d  powerpc-e500mc--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2023.08-1.sha256
-sha256  b65e2912928838d6bee32a724bf25a53810ee2dfcff2954702057d2f9fce3f72  powerpc-e500mc--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  4281a38e79f2a32dcb9b51f379c78ca98cd982d4272449a9c7a4890d8402f7c2  powerpc-e500mc--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2023.08-1.sha256
-sha256  4a37d3dd4eee82fcc5d2d0fcf71831d8efca601abfee236c49a5a7bd064d27f4  powerpc-e500mc--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2023.08-1.sha256
-sha256  2e6b3d79ddd8de8a4e99b39dbf9990deacf1c2b6114d1686f49cbcfd949f229c  powerpc64-e5500--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2023.08-1.sha256
-sha256  f3094cb9cc065c36ae6407c80002dc22b996c895ce74261902e5a3e5bca12579  powerpc64-e5500--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2023.08-1.sha256
-sha256  7761a61fc413683f1190275ef6d7438351da133bbfaaa83af336432ec2b2a0a4  powerpc64-e6500--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2023.08-1.sha256
-sha256  e95b5afc2cbb7b510009e552477e20c806262615a85e03d0e89330574eab7330  powerpc64-e6500--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2023.08-1.sha256
-sha256  18572cbbfd25426666594c1f4758beb57983e457487bcf0036b57e31b92d41bd  powerpc64-e6500--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2023.08-1.sha256
-sha256  596b2369457e6155420d97c3d67646eb94e5cace277aa943010cd1bc29191322  powerpc64-e6500--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2023.08-1.sha256
-sha256  7af62a63e0e9ebec8d020f017e8053c44e9c3bbdb418de5b1a7a6bf6b6ebb958  powerpc64-power8--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2023.08-1.sha256
-sha256  ee974fe55cd465145efb0ffe01e64f9488bf4d4c3d6abe17c74b4822e8158415  powerpc64-power8--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2023.08-1.sha256
-sha256  680c70daafe2f19a450d5a64694f758407abc71cfeaa385c7bb8af428ef0d11a  powerpc64-power8--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2023.08-1.sha256
-sha256  c1116ad8c2c34ab964fee09e2cb95537701ec65f11b40ea8da08ba9140928af5  powerpc64-power8--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2023.08-1.sha256
-sha256  6b0f83a79375774eeff1c67de6b22610833be9f4ef75535368f2c6d1e14ec4ca  powerpc64le-power8--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2023.08-1.sha256
-sha256  b9ed7a538472df2c727f8133ccd8166f5ea26fbd09ec0729b577c89ced0a87c4  powerpc64le-power8--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2023.08-1.sha256
-sha256  69dd5562fe86154a7d749bd414949cbca5e9e6eda370cb4188de5493b682431f  powerpc64le-power8--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2023.08-1.sha256
-sha256  f01de6d7ea263e1343b771b95a9b8848c767be45d43e10550c3d23a15e749d83  powerpc64le-power8--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2023.08-1.sha256
-sha256  b5a674b07be757639885bde165244ab85c26db2d7e39284d897175701f6f16c3  riscv32-ilp32d--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2023.08-1.sha256
-sha256  9eda527aea5ce7da27957c3b8e4adb65430be046b713dca25432a09cb6675976  riscv64-lp64d--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2023.08-1.sha256
-sha256  97d7f95ced5852e3fa0119fd5370356df0b652844a76ad9a1c88caa8dd09f367  riscv64-lp64d--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2023.08-1.sha256
-sha256  3687ddfbc6d4008e6b5fa2533a6e651d6db7281014917de8d2200b320f440633  riscv64-lp64d--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2023.08-1.sha256
-sha256  09e2fa682043c4ac6378887468085a333d07734edac2b784ade2aacc0a815bb3  riscv64-lp64d--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  612ddd98eacb4bd1e575c3376bbc709e16d4617b49789f8b9663eaa1e13799b6  riscv64-lp64d--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2023.08-1.sha256
-sha256  47830bb06baaf351735729672a3b866c123ef6ad6151869a1fc0135396e7a360  riscv64-lp64d--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2023.08-1.sha256
-sha256  38edb78e044ce8c47214452084d5ce38c8b94a2484b296972a764da701ca738a  s390x-z13--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2023.08-1.sha256
-sha256  a31927e8331f986ee753edbb931495d03ff00290e5b61618b1e897ed980481b9  s390x-z13--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2023.08-1.sha256
-sha256  11da1e48d2a7aebfd0f0280d830bd98423620afc82a7bd62671333661e9cb438  sh-sh4--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2023.08-1.sha256
-sha256  91f6eeb80d4ceb5ee49221708e543a0d312a7e16d7b9bdd47db48098a034b17d  sh-sh4--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2023.08-1.sha256
-sha256  cff9a006550ca7f6d5e71b10043b2ade1d379ad5859202f7ff9dc460348c7f82  sh-sh4--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2023.08-1.sha256
-sha256  e76eee2ac9b04926d0cd8699c11abe09194e235117985fa6f65b16221889823f  sh-sh4--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  0b8b94a26d66168173797d212fc8a5da0c8d239607208661201c413c61056c00  sh-sh4--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2023.08-1.sha256
-sha256  d08f583f45f61c72c187754a330d82d4ac9f81a91c998820663d884363a27877  sh-sh4--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2023.08-1.sha256
-sha256  32efc818e2a09ae5af5756c3fac89832743b6f03ad7414c5f6c6abb238cbcc64  sh-sh4aeb--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2023.08-1.sha256
-sha256  4b5f36bcb32a23b40c04117b549fc571c0f1b40ae29c7a69a78e9d014efb55ea  sh-sh4aeb--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2023.08-1.sha256
-sha256  16f82d8ce61fe30b26ad75e716418c57d8669d7a7fbc63a131f8be00ba7ec305  sh-sh4aeb--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2023.08-1.sha256
-sha256  2f4af8a25bd24888149f5772413c3f8ce1ee40a16b2a4aec5fc4b4382d021d4f  sh-sh4aeb--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2023.08-1.sha256
-sha256  8c29c6f65204a2940012384b769fb5d5848498c47d243a9accf530fe74665dc2  sparc64--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2023.08-1.sha256
-sha256  643acebd4fd6ed1b1ee8dfcb6ab3066e4f2c42aee7754ebea7825ecfeabf32ed  sparc64--glibc--stable-2023.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2023.11-1.sha256
+sha256  9d4c3a45e5f781060b81779ba116b2118805f214c3b1042ce8ecde5c4aeb12c3  aarch64--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2023.11-1.sha256
+sha256  5b1fde169c9ed678ee75a729286531a291c6ce5ee9d8a8b598b3abbef35c05f2  aarch64--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2023.11-1.sha256
+sha256  f63c27eabff2b3e733ad132866a5301d90a9068f2b83ff5d36e907bd958951dc  aarch64--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2023.11-1.sha256
+sha256  3554391a9ae82cc1fe35a6ab0c9efa34a5bac5474b6d527474997256e148c297  aarch64--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  02100c2670b441bcd54481bf731215e0d7c9be671407fe15678a9ad03b5056d5  aarch64--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2023.11-1.sha256
+sha256  82fe36e1c02f9662bd3ad59267ba3ae850d67e9e09a1d229ec3f25b691da0065  aarch64--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2023.11-1.sha256
+sha256  0594958f0e4822adcd5dcdddc6feec3a23d37afd2dc86c80edd7cef5094c02cf  aarch64be--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2023.11-1.sha256
+sha256  f622cacaed216dac40461653329dde6f4391f9339ea4b848118f7eff92018b5a  aarch64be--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2023.11-1.sha256
+sha256  c495eb4bf875934502e36005499bc28a47b3762b199dcfff57516ce70fe1c0a6  aarch64be--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--stable-2023.11-1.sha256
+sha256  72016bafd0e0b70c05f5b3f71302b8cd6cd3fce54b4dd9acfb3fb6560af9f30f  aarch64be--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  f956f0aec2e6e46cab1e92f0cd7b0fa691eb4202b087758e668d6bcfe773532e  aarch64be--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2023.11-1.sha256
+sha256  39fb6f1d32ad9baa664832d5633d04e2991898a173a4133ed73a36ccbae33f9f  aarch64be--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  b2a39fc18a3c2b3e10c61ce862fb1c90d53e38ccb21323a7f808ed4004c89d0c  arcle-750d--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2023.11-1.sha256
+sha256  1be435efc78ee2ca8d97ba64e45c21f669a3d6f8bad7850f921fdac249e93472  arcle-750d--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2023.11-1.sha256
+sha256  ede78dd37096f3b13ef6797059c7be5d771ffb2361cfeb97be4ce46f90c69309  arcle-hs38--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2023.11-1.sha256
+sha256  91c048fb79152969253a3bb96a9cd77c79c2ba5a3081d2da7cf103069661e303  arcle-hs38--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  970c5176001abac9746f21922b56f9628c8bb1bef8596a5badba1efb05decf33  arcle-hs38--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2023.11-1.sha256
+sha256  b6c98633c33fe0ce5d7ba03c0a9bb55ab9a0ded69f3ed3d3813a5c133aa4e3ca  arcle-hs38--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2023.11-1.sha256
+sha256  80b67f939e5cbd1d2fa13fe063fd5d8aca1f5a702adf010547d8904864fe2209  armv5-eabi--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2023.11-1.sha256
+sha256  06837abc0a4bd7f163d2c1697d1e3d13f4d37f486c3a827f259fe7d3219c9a22  armv5-eabi--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2023.11-1.sha256
+sha256  10f67c422fc926c38824e3606e955a37373ca5f337aecd06998e65803379ac3c  armv5-eabi--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2023.11-1.sha256
+sha256  c6bd48c4341bc496fdb37dbda2caef5d2bba69d764aab3c317eaf20554474a38  armv5-eabi--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  95f17ecd4de11130b818146fb236ca30d0a0e86eba55bd18b1264d16f45020ff  armv5-eabi--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2023.11-1.sha256
+sha256  4ec295deb930584a3da8baab7b23438180195d8bddf03fe9a93ca08ce4bd4a22  armv5-eabi--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2023.11-1.sha256
+sha256  8f1ef62275d34c556e4cbe14af429fac250132d2191f4ff86c77f8395edf9e4a  armv6-eabihf--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2023.11-1.sha256
+sha256  dc71ac978e3e9ec25832decf8490472b3a0998c8d2214468f20bf546ab833ee2  armv6-eabihf--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2023.11-1.sha256
+sha256  48cd51a76e8068c78312ed022d31d12831d9ae8da4d0f23f76429c8f9760663f  armv6-eabihf--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2023.11-1.sha256
+sha256  3620458bb0fe685d78b0c6645aae547b16df0e7966f4d66d672500c96aafd787  armv6-eabihf--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  3aee5156a27adb30311a3878fa8028fa103dfad08dda4f417087c5b2f271aee9  armv6-eabihf--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2023.11-1.sha256
+sha256  07df70ed0812549bb4e8b8ff930e6a5ce0952e00a19b534223b469728412bf29  armv6-eabihf--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2023.11-1.sha256
+sha256  609ac558671aa69e1200dc27204136efbef4bbc6dd98f4b77f24717e38797a77  armv7-eabihf--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2023.11-1.sha256
+sha256  d0a575b156e5c481dbe079cd3e292fb8eefed39392a90cdde871e7b9e77fd420  armv7-eabihf--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2023.11-1.sha256
+sha256  fcc4421b04ede8996d350a3517890c48ba200a9102787ddd288f2c5037b3de4c  armv7-eabihf--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2023.11-1.sha256
+sha256  c01a2b2a762b0e19a7847f4877ba5b35d90bd7e23704956dfe575e8113a1ad7a  armv7-eabihf--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  ded310ccbe78d411f9e027d7b8e4029746b86aa0d66a7151dcf50f49ebcbf85b  armv7-eabihf--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2023.11-1.sha256
+sha256  39fcb1928454392112f0a5168b2e284d3564a24dff116efdcb71c67b672682ca  armv7-eabihf--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2023.11-1.sha256
+sha256  d16d65752cc6ea0f81661aac23322cd48fb3b5608bb30588667d8191fecf8fab  armebv7-eabihf--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2023.11-1.sha256
+sha256  8294077f6be32fc4a3a76d8802d179e30a35bcf104ac90e6bdfe1d51827e11a9  armebv7-eabihf--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2023.11-1.sha256
+sha256  a6c478cf6916d82589628d35d1317415bcd6f86455facc1453f8cffdf524092d  armebv7-eabihf--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2023.11-1.sha256
+sha256  cb316d86590f49c29fe1a99988d8a71001a6b76cf996a7c0c15b648b017899f8  armebv7-eabihf--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  f88e930fdb895aaf9edf5d168c57a8672e46900f326e9c3c2146b81c2a3807b6  armebv7-eabihf--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2023.11-1.sha256
+sha256  fc20f9c0e9551b2d5e0ffd1154aa8d282589503c8e239b049fc719974f338e76  armebv7-eabihf--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  ffacf7a1e9d376a487e5d2fb0788a3f2a37d9da3b8daab5cdecc0a502cc0cd37  armv7m--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2023.11-1.sha256
+sha256  3baeaa139d8263477baaa51da8ad2e5e8129c71bf0a7b956543b3c4f7a40b36a  armv7m--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--bleeding-edge-2023.11-1.sha256
+sha256  f7a41da2a2765d67ee3184df876741a459c6f85024dcc7434bd10f27451f6ecd  m68k-68xxx--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--glibc--stable-2023.11-1.sha256
+sha256  79b120e67b7f17a1f265f5a5685b602ee3755f32047c657d837e9fc5c9ac7afa  m68k-68xxx--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--bleeding-edge-2023.11-1.sha256
+sha256  20c700a7c16b7fec587cd2b2269875ee53d33f1141e29900c53c5855f59acf9e  m68k-68xxx--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--musl--stable-2023.11-1.sha256
+sha256  83ce067a39a6c6e5b1771b6ccfc2e7028bb479b8bcb28694ad96b5595767ac4d  m68k-68xxx--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  8c9d1628519b233c8377d9a6906c31ea08a2df73ec72f5b368b23318aeea8dbc  m68k-68xxx--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2023.11-1.sha256
+sha256  17bec666be6c4d7d796055fa04c180dd41dc8f85898e1177c36585642fbb1496  m68k-68xxx--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  3bf997d9333430de431811c09b7b47551b134b70a6bce7f93aea86b39efd75fc  m68k-coldfire--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2023.11-1.sha256
+sha256  87e6f40abe2a17eca8c60b3fa15dab7c2f6cbda34a2bc79f5228d71927337158  m68k-coldfire--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2023.11-1.sha256
+sha256  d05a6bdd547ca1b8f72a64989af3fa46db2ec054d319310dc3219a2414f11e67  microblazebe--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2023.11-1.sha256
+sha256  cdb5de2bd88c0ec95f24d56550b47eb256e74f10f7e579da4bcb486d0198d138  microblazebe--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2023.11-1.sha256
+sha256  55c14a3b40036029aedad93e64e7e33f590808608eb446cc641e6bf28b4bea58  microblazebe--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2023.11-1.sha256
+sha256  93fe4e169b35e84dbd55e1ac97722b0f685e88701171ee4af24e89f54aa647ff  microblazebe--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  ebbafd02b80bbd65c79644aba48da3ef471fe43c89e7c257b57c881048f35033  microblazebe--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2023.11-1.sha256
+sha256  cee44f3c1f87dfaac941df61a27ab854e1e0898978d484214782369b5a324029  microblazebe--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2023.11-1.sha256
+sha256  04f90560bb9bf8905ac2f5ca7b3d9484fcb29b25e296612cc28a9d6551c3363c  microblazeel--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2023.11-1.sha256
+sha256  d3ab9b6ef87c793c236b599e93e39df001faeb4f8f402fb496e4f456a4aa709a  microblazeel--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2023.11-1.sha256
+sha256  bf539dda6f5793c8d5b64add457f72bac4aa41c27369e67c79079ef683c653d3  microblazeel--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2023.11-1.sha256
+sha256  2f2018e378a0f6c7075766239217b268fd45a0103ac5af5143869ca49db3cb56  microblazeel--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  24c1687ae24ad115129261ba34be831d65e5aae4f0f1536fd5df7ed9c1e53da6  microblazeel--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2023.11-1.sha256
+sha256  40c25f81998bf10e73f9a8f5934d8c8028adfb1ff8436abd8e8ecccdc25ad82d  microblazeel--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2023.11-1.sha256
+sha256  fb7fb26666b9d8d2cac1aadb18f2cb7819b8b3a1ec26800b12594791bfa72604  mips32--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2023.11-1.sha256
+sha256  062d5df972b7b628337fdecba84cbe2b33f9c863e59c9702556ef252e7b44750  mips32--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2023.11-1.sha256
+sha256  91b6680324773afad77a211acf1357cd06526faa860943267fdb0ffa61a845f0  mips32--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2023.11-1.sha256
+sha256  c0053f5475d960a7a1a2872ebddaf7f054aa55337dd2d6c4e81c25758244a75f  mips32--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  66edf00bd30bb1ac0885aeb891679f2e2ba33910d99e7cd85bab4400ffc014f3  mips32--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2023.11-1.sha256
+sha256  5f4f81dbc9b7faff25dc4e3223562d5f064cf31e628eec7902b3b00c66153ed1  mips32--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2023.11-1.sha256
+sha256  90afdb045301503974a7337822645c975766b1749472a4b98de8251737e97434  mips32el--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2023.11-1.sha256
+sha256  60fc28d1521dfeefbfedb20776eeadec5b9bade7a55d0ea0c901766f722da3bd  mips32el--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2023.11-1.sha256
+sha256  b22b3eb247529eb320f2d5d1cec0b903c2509ef11b16ca77715f62bba0d687b0  mips32el--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2023.11-1.sha256
+sha256  a76bdda55776c0b1a546ef20652b78134b96bdefa4f8cc792eb46d913df9138b  mips32el--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  4106d5a4c45b6200cfaccb78a61344120d2e4610cea5e14168a9ab7a50e869c3  mips32el--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2023.11-1.sha256
+sha256  9aa9b2d99778ae8848ba629690cda55a9fee4175016b551c7726995a57b80478  mips32el--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2023.11-1.sha256
+sha256  c50c257de4ed262fb2a82b3eaa973d927d3a36506214918e4b7a9c4b208f5622  mips32r5el--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2023.11-1.sha256
+sha256  58a7b63b8a957d99146218aaa28bdf5d01bd64cb6e97c50592f6bbe09b0d76a0  mips32r5el--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2023.11-1.sha256
+sha256  3ad2cef7e834c565a9cb9ccfb3576c87ecbc7f0a7d460b071cecfeb6b867704e  mips32r5el--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2023.11-1.sha256
+sha256  571abc2312dae8b4e49effbd0e81bdf48523427512f5a24744c0c4d3d6a9af35  mips32r5el--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  047296dbb1a33a98ec7b4b7ef7e34fca97cb44d86f7f1e6832bb0490471263b4  mips32r5el--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2023.11-1.sha256
+sha256  7c92a47bd9e22445ec4bde739866f5ab75dfacac8a73d687165774c5a124b7cf  mips32r5el--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2023.11-1.sha256
+sha256  114c1b6cfc6b0eae974fb1141b40ec4fc49f10c398fd345845afbcc34a345e22  mips32r6el--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2023.11-1.sha256
+sha256  6dd4457db666b58707f5e2d36d5c3045506f6f90d8f754d6321fa6758be3aa0e  mips32r6el--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2023.11-1.sha256
+sha256  d1e03c69e1365582c2ab8962a4279c0f83753dc95b754d9deec96aa18eec54ce  mips32r6el--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2023.11-1.sha256
+sha256  35d831a96647305ed674e5127e1f8dc6fc4b14d3f94aa867ef47eeef8c0becb6  mips32r6el--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  22e09f0d9c69a4dbe3bc0602579fff19dc3820d92aed73b202714a8728b4d0d6  mips32r6el--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2023.11-1.sha256
+sha256  383c82e3c0accba7b0b5b1c3bfd5e4ee4521932f525823a95724aa3ff796d0be  mips32r6el--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2023.11-1.sha256
+sha256  dd43c76fa9d5b0894582912cf3c1a562e0b8f401910952aadcec856c209b055c  mips64-n32--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2023.11-1.sha256
+sha256  e17670f46efcac70105bd360573fcee3b9e2410a688806ec90f6012a419b88d2  mips64-n32--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2023.11-1.sha256
+sha256  bf442bd32f0a7cb0fe0e2ea229f08bd65af6f471478599aa0b80ab484186a56f  mips64-n32--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2023.11-1.sha256
+sha256  a7c733e4695d9851bb70d03b40e84ae75383bffd20894293718f24a6284bd071  mips64-n32--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  10b53c93acb9a8cb29137156dc859fd10ccb8a2edee12fbd70e11658fd0c3643  mips64-n32--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2023.11-1.sha256
+sha256  e6fe6d734c2c2044b48413d19b75af3dd8b9e8d470f29c98001ab1d833d7c5bf  mips64-n32--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2023.11-1.sha256
+sha256  d3f022b9a550a4c132b7b569ffee1450ba9aa3821b937df9acb4a5a50e9c0404  mips64el-n32--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2023.11-1.sha256
+sha256  e2d1a56763c8680f458f66962749b14992985721fb63621dd3907096205fdf5b  mips64el-n32--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2023.11-1.sha256
+sha256  688a5749fad712ca241f64be4b6e96cbfab98dbd528eb0e6c477f2d466215b2a  mips64el-n32--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2023.11-1.sha256
+sha256  c108ccfd651d89af088777b5cc1aebb6a2be24107875c93c00af94da3edcec53  mips64el-n32--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  c0fe0e58eff17318fd7783b85d9b7586dfa67cea60d7ff0b245af07e55a8334a  mips64el-n32--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2023.11-1.sha256
+sha256  66f8c87c8649a32c597863791cfec8c44c1edc0a3438dc6919fd164541318fc0  mips64el-n32--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2023.11-1.sha256
+sha256  10b1215c32c441d004c0020c3512ff23447da89fe0a24e86de35590fa8ea74d3  mips64r6el-n32--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2023.11-1.sha256
+sha256  30aa25c3bcbd085d8bd22a1055f083e9bf7d37dcf91847651dda802d1ee99295  mips64r6el-n32--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2023.11-1.sha256
+sha256  ba6a72fdb04b5b4741ad5562a7baf881b83bdad245cdc5cc7ba2b2f1fc481dae  mips64r6el-n32--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2023.11-1.sha256
+sha256  7efe8e663f909e382bfa1035c231051757c3d66a79640864db3b2182b6d122ca  mips64r6el-n32--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  d259f6b0b78da1296106b070630cc08f7d346af4b57d15f348b53a3a531e4e23  mips64r6el-n32--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2023.11-1.sha256
+sha256  f55e95fb54c7d71274f5050941925c11d180fe7e98c0f0d1b91e8b36672e235e  mips64r6el-n32--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2023.11-1.sha256
+sha256  aef966d00fde3297115ac0ae52226b61f8d8f89efc46c15ebf796d8d9a64b951  nios2--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2023.11-1.sha256
+sha256  d9d6137443055c1e7ae086ab746ab1246d0772aec85db61b04e0fcc0acdf655e  nios2--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2023.11-1.sha256
+sha256  cd9489ab73dbcf7a2f915b4c75021c22d43cb4bd3c8a2bd95f324040a2d548c1  openrisc--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2023.11-1.sha256
+sha256  35eb515b554a8dcb60cae731aba49b9588cfec379f434d106de9a971015d7cf1  openrisc--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2023.11-1.sha256
+sha256  7efab1b6d4ef49f0c4be87992567a510f7147a0e131bbfc7f88c06ac399048ff  openrisc--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2023.11-1.sha256
+sha256  2ece0d83ae58072d8ca22043b19f1121ecefadd456ca4d33737696c667307a47  openrisc--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  04e0941036df0478c809c9bda56d2425ccaf48665c311de6605a8b050107665a  openrisc--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2023.11-1.sha256
+sha256  a83587690bef62c3d45458db20efb101b41c55695da2f38fdb2998e4b3ccadc9  openrisc--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2023.11-1.sha256
+sha256  78aca713c2aaf75b176a5334cf3af8387037bcce5960d8638f728feb90c84d84  powerpc-440fp--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2023.11-1.sha256
+sha256  12760035aa457b31b58eefb1b4c0b76b87021b8fddee721c390a536adcc308aa  powerpc-440fp--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2023.11-1.sha256
+sha256  49ae0f78dd343c5b40b2d732b58d34f1203e3e50f13b767d160c98efeda404f4  powerpc-440fp--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2023.11-1.sha256
+sha256  9bfd63773d1cd8e1cf6f83c12dbe0ecf9759df2858da46cc3dac2bfb4c8a7c67  powerpc-440fp--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  b7f5407567e636c6efc765f4a1e32cb64a166c6a863b9ac42589f8834e4ed6d8  powerpc-440fp--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2023.11-1.sha256
+sha256  e60268e6826db3574cf2bc74c53daa92db2dd48de2884f3c25be41656bd4e5ef  powerpc-440fp--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2023.11-1.sha256
+sha256  0b5d51e7b5d991025d934a30711f07cfe482ad3ccccdb4608638eec0910f0d7b  powerpc-e300c3--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2023.11-1.sha256
+sha256  cafdd55bd0f82aaef09203eeee1a7294f6cf8cf6b4cc669f8a5cdd01e897d4e7  powerpc-e300c3--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2023.11-1.sha256
+sha256  9ddec25bccd33ccbabdfa3140a7f1b7283ff2443e83ef5f3be12e95b9a256d7f  powerpc-e300c3--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2023.11-1.sha256
+sha256  fcf15c1bb605abb906b7f6b7d2d5ba1a16de9b2eb03ae4d57d8b4480ce295371  powerpc-e300c3--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  db57a356f63111d7c615cb1f1095f6193c453709facd41c3d492a423f5ff5070  powerpc-e300c3--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2023.11-1.sha256
+sha256  e27984bbee08d4f1a794ce90e1b78e68ee8750403666452525e7360655d99f32  powerpc-e300c3--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2023.11-1.sha256
+sha256  07b26929d9f2a8d0225a1df4b4f01497e475478c4f5d5465a810585dd4b44a4a  powerpc-e500mc--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2023.11-1.sha256
+sha256  e0b50deb4ffba15fcead9ecea75a6f4af6feca6012a60ddd76591874a47e5338  powerpc-e500mc--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2023.11-1.sha256
+sha256  89302d5660e58e68fdf75d238ead582c586d26c0aa717bb5cd3d1f024420c400  powerpc-e500mc--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2023.11-1.sha256
+sha256  59274e8641885915e226083f4474606f17600cc09e8a097129e9e04ee29a672a  powerpc-e500mc--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  5f9db756eeb6d8c76574a578f823368a78e437204534d071fed63fe967156dd6  powerpc-e500mc--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2023.11-1.sha256
+sha256  7b6921f004698556681aa26ea0091931b5bd71bf0a785ff947d5b02c86d77f37  powerpc-e500mc--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2023.11-1.sha256
+sha256  814de1a235c805ec6a0035cf8633e5a31fdcec93a3aaaabf44cb0ca23eaa1d93  powerpc64-e5500--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2023.11-1.sha256
+sha256  3e55842372cfb4ac35ccfb4a1cf1ccc1a207eaa27fa0c8d32641cda07316b93b  powerpc64-e5500--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2023.11-1.sha256
+sha256  1e4e9684763822079cc3df10b290510cb4241706f287835ec1a07ec309d2b8a7  powerpc64-e6500--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2023.11-1.sha256
+sha256  ef93463f56824079cc4cc849892004d9d06316011c51063d6c88838369065717  powerpc64-e6500--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2023.11-1.sha256
+sha256  facb722bb19e7bf837a65a3ff15d4d80918dc36fe3a3f87a760d759f616d1d91  powerpc64-e6500--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2023.11-1.sha256
+sha256  fff880e6fc09efe3d5aaaa6a561fb6af3885dbeae8a73b1981c072196c3abc4a  powerpc64-e6500--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2023.11-1.sha256
+sha256  d8c135613d6d75d9974c3da437628bea05d93c7db3a86bc092979621621cb773  powerpc64-power8--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2023.11-1.sha256
+sha256  cd74cbce020c82966bdf2d4a1cb3de682043939c6dd3ad211d45ddfe56edcaaa  powerpc64-power8--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2023.11-1.sha256
+sha256  6dbcdd017bbb21179f47e17298b3de78a44d6991f51f57b584f30bb76817c76f  powerpc64-power8--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2023.11-1.sha256
+sha256  f8496ecc9019cabb3fc1515da26a051abae4cc60c530619f0bef5d82c56f8a7a  powerpc64-power8--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2023.11-1.sha256
+sha256  04effeaf9d9e1961fe65f54015b92e329ce2cbe6c66af10b21519d0cd06a7236  powerpc64le-power8--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2023.11-1.sha256
+sha256  606f82f3b218791f4411082ff7f6c7ab6e8955b5a3537f0f61646b9594402458  powerpc64le-power8--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2023.11-1.sha256
+sha256  79ae7450434e969643018e4ddb249716c9c631a2a39937b5cd183393477d5410  powerpc64le-power8--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2023.11-1.sha256
+sha256  c9402692c883f5512b966fe517038d9b30b93de328dd5dd2e7af20d25e4509ca  powerpc64le-power8--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2023.11-1.sha256
+sha256  19bd2ecfd1f7a56795ed1807ddadbbe3d0807fc19bb95625ca5a126810bd3fc4  riscv32-ilp32d--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2023.11-1.sha256
+sha256  7a53268f429109ee416df5ed6ef47b1a2d88d7760371aabaf8f4f24481dfb89e  riscv64-lp64d--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2023.11-1.sha256
+sha256  80e84af7ebed4e8e52fc2d17994f7bcb2e7bdc069e2d1f1c4656977cd73d9d5d  riscv64-lp64d--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2023.11-1.sha256
+sha256  023dadabe58ff6079b27ebfde9495440180dc473b8c5da2c55e95ce68e095c15  riscv64-lp64d--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2023.11-1.sha256
+sha256  09522ec60b13766090acaa715402cb11edaa39217642fbd7315fbe37b6032275  riscv64-lp64d--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  fcfa3624eb6024b55c264ec87790265beab393cfc8f867afda8954e4c3b744c4  riscv64-lp64d--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2023.11-1.sha256
+sha256  aebb6034d3512e3c29337c368dcf4a1e58756c725032d814047a3635178cb5ad  riscv64-lp64d--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2023.11-1.sha256
+sha256  716031aaa6b2d566b0c9abf3992f1b7dabc845eb81934ec97ce0ff37157c9269  s390x-z13--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2023.11-1.sha256
+sha256  4ff3c21eb060c9df2e795fab18fa267300a581ba3fa55e62084e9233c386515f  s390x-z13--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2023.11-1.sha256
+sha256  96b9082e3ee2b7c7b8170fa8d93f50629d170f4dfc345978327ed562d0efe42b  sh-sh4--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2023.11-1.sha256
+sha256  e957c0854780cb48b0fcb54eddf9ef40ed496b8fb3d0c905f9c36dd8263f3cf0  sh-sh4--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2023.11-1.sha256
+sha256  57e28d5a164fdcaed5a6cfd1225e346e873d4e48f8f1ced8153af0c8669bd081  sh-sh4--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2023.11-1.sha256
+sha256  b6847ac7355ad469d752799ffa08df4eef2a7ba49974242e1cefa9d9720bc894  sh-sh4--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  ee15660db075af19c7e768da73c6f57336b4201bd397e20fdd0357630fdf4e40  sh-sh4--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2023.11-1.sha256
+sha256  8d0e0f3a54cb5b601d7c9c093138ba537e11f400a3e44ee0b10d28b96f9704fb  sh-sh4--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2023.11-1.sha256
+sha256  760b5970d4c9b82bd6d469a142713bc70564a83d86123b1c5ae1fb0ccf9711d7  sh-sh4aeb--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2023.11-1.sha256
+sha256  e734eeba730881e1135abb94797ece8865b924ff31c918df93fcfbf21dddba7d  sh-sh4aeb--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2023.11-1.sha256
+sha256  d2a7024ca6869117118e136c8577d11c954acfd4aa71112f431be0c76fffea2f  sh-sh4aeb--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2023.11-1.sha256
+sha256  3e48605bbf9407f9625cc367b55ab35f20a308cb44c69e85583b2fe10c9c604d  sh-sh4aeb--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2023.11-1.sha256
+sha256  8ee180782f8094d90e28e4977ea018094363d0678c1d149838098bedcab4aa71  sparc64--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2023.11-1.sha256
+sha256  78eeafc8c9b28dbf5a90d2f8ebc4e1a0623147e5f4bdbcd29b32d6ee760c9d1b  sparc64--glibc--stable-2023.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2022.08-2.sha256
 sha256  ccd4110fa574d2323f038394c0603245384002fbe906204db36fe200c9c8f886  sparcv8--uclibc--bleeding-edge-2022.08-2.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2022.08-1.sha256
 sha256  da3b9f0a936401cbd3cc305b86d3611531391354cc0226a0eeb3ce4ddcc7b7dc  sparcv8--uclibc--stable-2022.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2023.08-1.sha256
-sha256  e896274d4c540a45da02c1a167264116314b5e3afd298b79f28554b0f4eb498d  x86-64--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2023.08-1.sha256
-sha256  d6eca7f1ea736ef6f868a027a9d0baa875f9513755026aed2badc04a2b9cd7bd  x86-64--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2023.08-1.sha256
-sha256  cdef47dd21b099c0b3d97e89ce2a2eb3939e6021ca8f77b8adb0f7ae36f01dc4  x86-64--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2023.08-1.sha256
-sha256  e07d11f32a7552bd5155530333d7b3ac9ef5627e10072fd05fbc093cd1f88c50  x86-64--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  8f35f75ce07f76a776dc08fa4b5f36bb0295c62aa70db0b4eca51a99a80b3bba  x86-64--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2023.08-1.sha256
-sha256  cd6ead4a50380fa3346d1d20697f9ad4f3ca93f52d9e5c4000d06f340d766580  x86-64--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2023.08-1.sha256
-sha256  dbb470879dff87a6a99f6736959f5b38f6cce665b1f9c56c1c6450663c0f07de  x86-64-v2--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2023.08-1.sha256
-sha256  fd5a2031e1ef2d01de8ba26ce7c445ba7c7fd9ddae9507dfdde8a784d32c7bb7  x86-64-v2--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2023.08-1.sha256
-sha256  0fca4c4eb07abd94535a961304af89a9a0e805f7f208b51d806e8ff1817e9f01  x86-64-v2--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2023.08-1.sha256
-sha256  dcb7044492f51a5bc7920b78f377d37b48dedb9082cc38c6d6ad4058373f2616  x86-64-v2--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  8fa29561f0b783c88a9929cd909fdc86ca4430656c6a7887ac412fbc38892b02  x86-64-v2--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2023.08-1.sha256
-sha256  8c412f719f30ce1ea1f7123cdbc72a432e46d47596fb55c35d6db64e571e3c05  x86-64-v2--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2023.08-1.sha256
-sha256  8c2a9de04b56a33ca55190e4479d5ebea17e853fd1ad38eb4750868f2bf459ee  x86-64-v3--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2023.08-1.sha256
-sha256  fc3be4d3e6f04f48c11cd33689b9fad37af2c7b23ffc23bc2d72108b012e9b81  x86-64-v3--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2023.08-1.sha256
-sha256  ee3c55397a4dacb12ce8dad82e9e1da6aec3014458385665892524125882a82c  x86-64-v3--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2023.08-1.sha256
-sha256  b714633981e49954f0164795508710183ddfeb471c748328e5088809ca3cc588  x86-64-v3--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  1954fdc6a49d0f5c784fa270269c908138518106b4e445d0961fe245b9f408a9  x86-64-v3--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2023.08-1.sha256
-sha256  addce3971dd028ea8772e3f683d2b65e5703de1279d4f5d0c82269570dfb98c2  x86-64-v3--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2023.08-1.sha256
-sha256  59cc1a8d860fd63a597efa863a47dfdecb489723678dfee6386e0970fb556693  x86-64-v4--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2023.08-1.sha256
-sha256  48e8c2095b065a658f55a19ecf2e3c15533b5e8d4d3b7cf1676305c6b660a135  x86-64-v4--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2023.08-1.sha256
-sha256  03ad7a76121551bce3645835286c43d75e73d397f715fb41e60635f9139711f2  x86-64-v4--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2023.08-1.sha256
-sha256  e8c74dfe36a4e6c79808d7fe10ddcee546fdbdcb2994bd60bfbf8e6a14ab7abd  x86-64-v4--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  6220868a0f3ba104a21eb6bdecaed30fb5e625a39899abd753b1d60ef3204196  x86-64-v4--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2023.08-1.sha256
-sha256  1cddc357e6af9f10814e628b92acdb3142a305f5050541eeb82463060295bc63  x86-64-v4--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2023.08-1.sha256
-sha256  64aa0e9a7face18330aee47f4314229c10c559fea9d0ff4ccf0f8a5dbee81b94  x86-64-core-i7--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2023.08-1.sha256
-sha256  78360790108be258bd5f9d4a0dfbc7fc51159cff9943d25b2bf40db0b6530593  x86-64-core-i7--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2023.08-1.sha256
-sha256  4c49c759c7371330df3e83a28f9428a832455c9efab8450b30d124e766815ebc  x86-64-core-i7--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2023.08-1.sha256
-sha256  7e16c0e6f2924e0c57c3c7f7ebe48af42f97bab77978fbe72dbee49eddbbdc73  x86-64-core-i7--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  3a2aabaf3287f2c2149809cd4bfa335730edfaed13a93dcc3a3550d7a00e09d1  x86-64-core-i7--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2023.08-1.sha256
-sha256  4fd2aa823492307e840152cc5d0b56dac22b2891975c465a83e14cb42bc0caa1  x86-64-core-i7--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2023.08-1.sha256
-sha256  4c6fa3c7f43ae68f7bff28f609176e8cd06985dd90582c27e81b2ed5f0a69dd4  x86-core2--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2023.08-1.sha256
-sha256  63a868a1813f67a1f54c6213fe2514e7f5c94bf440cff7941442e5ebe3aa0a8b  x86-core2--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2023.08-1.sha256
-sha256  1d2c421fe9f2f4fb8fffb427264c7be39b9fcba1e4cb56486a6676082f07dbe3  x86-core2--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2023.08-1.sha256
-sha256  74a544e52bebd8bd1aeb30838bc59c86dc220648f324a7a7b61d2cdea8fdae50  x86-core2--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  21efd75d421e72d5612b4f8b7a1daa649e5fa78c73ad47ec55629df5d486a137  x86-core2--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2023.08-1.sha256
-sha256  f161582dda7a8d4cd8fabb728dda0844f70aa0008d94be1b91d012a0a7966315  x86-core2--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2023.08-1.sha256
-sha256  97041d43941afefc4b950623be6a364434adc6a31f5a506ea578c9530a6e0f04  x86-i686--glibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2023.08-1.sha256
-sha256  bba2e990fa8cd6a156c0a4acd909e9f8265708772f2b2c438fe2c294bdbae313  x86-i686--glibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2023.08-1.sha256
-sha256  f2efb6b34c5b04940163fa2c91b9fcc9f76c5a5532bca2f44279fd318f460123  x86-i686--musl--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2023.08-1.sha256
-sha256  5109b0d57432800a34a402cea789993f0670cfeda5f174b61e0bc19c69e98078  x86-i686--musl--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  2222e4ef0e26185c4c6f39d08eacb4ce3a1dab3e0dbc09d37708d72d5df39417  x86-i686--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2023.08-1.sha256
-sha256  294d84dbc6043e17a2e357b2a1377b2b57039dffd6d766a2851adec7d2d5da21  x86-i686--uclibc--stable-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2023.08-1.sha256
-sha256  79b002a8d1d6dee72c75a336e0fb3b07cdf4cd373de842e5f3f6c67e502f9c94  xtensa-lx60--uclibc--bleeding-edge-2023.08-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2023.08-1.sha256
-sha256  f9f8d55ef6c29c69174084f05310cd69a1cb3626831e5c806f30d9b5a842a35a  xtensa-lx60--uclibc--stable-2023.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2023.11-1.sha256
+sha256  c97b280a36ae4411ec97717b2c67622912ef436efa55a31f888187492d4e5e4b  x86-64--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2023.11-1.sha256
+sha256  e3c0ef1618df3a3100a8a167066e7b19fdd25ee2c4285cf2cfe3ef34f0456867  x86-64--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2023.11-1.sha256
+sha256  b362a4b12a19e2baa3590386a531d8b65abad0d323aba317aea5146da13b8659  x86-64--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2023.11-1.sha256
+sha256  d1df97230234a52c60e53fa7d1a6f14721295b8b49f40801c0e3ca1017b5bee3  x86-64--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  e32b885a41257dd5809f99d6d165994da3d1ce9efe2051f5c223a8243aaa37d9  x86-64--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2023.11-1.sha256
+sha256  1b77c4238b3e1958472094f46f866cfe7eab6c25d728db8c3ece8121e2095035  x86-64--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2023.11-1.sha256
+sha256  6b8cc256ccc35777b4d5b6a2baaa2d9a4cbb48f4e111860d20b310f983cf00e0  x86-64-v2--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2023.11-1.sha256
+sha256  45b1749ac5473f4ef629a32dcc423419b608c9cb80840b49501afb8af008c381  x86-64-v2--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2023.11-1.sha256
+sha256  ef2e717b55f34ad320c532a21782c308fdff5a462b413af868f52543dee043cf  x86-64-v2--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2023.11-1.sha256
+sha256  ae070e245dfc0bf882b6dcc4ad6c080b11f0b8d2f235f65c0cc1069a06f5e4a0  x86-64-v2--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  530f31ce5f8d002eb7e044f61b49e242d1e15a182e7e09ccf9f64080e6a28ac9  x86-64-v2--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2023.11-1.sha256
+sha256  a11189869ca3636abd12691758ab08dd41ef54c3cdcf936a141d48c4f2903237  x86-64-v2--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2023.11-1.sha256
+sha256  49031a3567c018a94d8158f8f5767d3438da21c8ad493c90c641d11e55f44d81  x86-64-v3--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2023.11-1.sha256
+sha256  19376ffd5187f2c96d99a9f12d15ae51c8bf351d25a7186e379fae815feedd22  x86-64-v3--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2023.11-1.sha256
+sha256  6817017e68cb3d8e09eb048ccd70ee66e5cd72e49fb77806825614802a62077e  x86-64-v3--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2023.11-1.sha256
+sha256  05f73caedf28c257d66e4365b9e496069bdc1294bfa1b9697e64a380d63eaf99  x86-64-v3--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  45ee398da5195584062e573eed27a660d99a10e8f129c6fb27b2d6b418a05bae  x86-64-v3--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2023.11-1.sha256
+sha256  9848d205bcbdba3fd2e1c61cdd5d33ed03f842639d4f4e0a0057c410811bed79  x86-64-v3--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2023.11-1.sha256
+sha256  d57fc66d8ae7e7aedf543bf4993fa36be68aeb1020c30d32d26d0fad8952db63  x86-64-v4--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2023.11-1.sha256
+sha256  095220c834fb1c1a796e6db7847c9dc191fedca6ae731708a9864f1c0ec0f752  x86-64-v4--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2023.11-1.sha256
+sha256  50757334efcabf2d35083498df04a945cb7e3730dd3893cc478832a02d21147b  x86-64-v4--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2023.11-1.sha256
+sha256  437516c415eacd377946df6167196dd4337da030f304d8c81b5b6889317b136c  x86-64-v4--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  f6e25121564440796a9cb196bf9de87e1ed51456d508deb8b061ab4727971ff6  x86-64-v4--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2023.11-1.sha256
+sha256  a35e650c422e64939c8d4578b39fce5c73995688420e51aa6c0f553ba97ba838  x86-64-v4--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2023.11-1.sha256
+sha256  00e1992817c73d2df99f188240e244442f3d50a2a9a994d95ade453916c16ac3  x86-64-core-i7--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2023.11-1.sha256
+sha256  a3cd2806008fd2bd75bee34d098003ef2cfb06665d15e92d305617d4e021b74e  x86-64-core-i7--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2023.11-1.sha256
+sha256  cf084bdf1f62c35996dc922d9c794a08d53ff0d71e888a0bbc4717431aa7c2c6  x86-64-core-i7--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2023.11-1.sha256
+sha256  38a7be51cdeb738f7d724ba3efe207fddab523c8b128bbbb33f9b7a56d0e70f1  x86-64-core-i7--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  4f08c426b0ebb88a1e66831db780168c5716e319e905b8d41c5f5dba1e98d543  x86-64-core-i7--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2023.11-1.sha256
+sha256  92ee30927596669f133982681010edaaf63100fde41ffea6a778aae367b2ca86  x86-64-core-i7--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2023.11-1.sha256
+sha256  76135ed57c361ac9c3722ff8db64332cffa77669b7051469eb3ef169df790bb6  x86-core2--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2023.11-1.sha256
+sha256  adde0a7579bd8c7c6b4dd7af2997a6841a541d1e94426d2ad7ebdbb26105b536  x86-core2--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2023.11-1.sha256
+sha256  26206a934621b95ccf5380fe3f69e2218a9531a850dd05f9cdee5cc66e23963e  x86-core2--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2023.11-1.sha256
+sha256  7202c3eb1f71ebbef5db2b042ba7e803574ccf66987c406f3711d98878dbbe24  x86-core2--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  4d73fbe36e86263679a4d5f7331977657cf793fe1ef337ffb6492aedf9d86e1b  x86-core2--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2023.11-1.sha256
+sha256  825c95bf3f28a950f90f9f8827c3ee4536729285603ff53611ae260c4beb2ce8  x86-core2--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2023.11-1.sha256
+sha256  007266510779d041524cc1fce4eac2af1ffe38db50d2221cbe09a519c61190c3  x86-i686--glibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2023.11-1.sha256
+sha256  13afd0f9b7fd7e3c1c598b294494e23ddacb39df23e30a999fbadff31a97c514  x86-i686--glibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2023.11-1.sha256
+sha256  02c465b5612607931c9f0f7eec0239b0ecebab2af3cef79c28993c7ce7f5b079  x86-i686--musl--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2023.11-1.sha256
+sha256  5d0a0abd6f6227622b217183ab06bcdf63fd6834bcb2a2335666bbb734f3fb11  x86-i686--musl--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  6a40f5bb22f1fb1de6cc6986f31afdfbef5c5c866f3a3a387e1dfc567ed98b8e  x86-i686--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2023.11-1.sha256
+sha256  c23e32f9616df27a1b8f77700d7b988c55dce6443598907ceface720c6e960a3  x86-i686--uclibc--stable-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2023.11-1.sha256
+sha256  9434e3522601c9b494bd223fa04376b9b489db47e823266b124f5b7a3b97486c  xtensa-lx60--uclibc--bleeding-edge-2023.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2023.11-1.sha256
+sha256  aa28cb17b03d7fa29c8911a8f9c7b26c2d90c222b1b0a1c727ecc5533b14023e  xtensa-lx60--uclibc--stable-2023.11-1.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 6f4be09793..4a09fd8825 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -7,979 +7,1003 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
@@ -997,265 +1021,265 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/relea
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2023.11-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
