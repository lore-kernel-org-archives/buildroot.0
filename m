Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701DAC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2EB50344;
	Fri, 28 Feb 2025 16:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMNc37xyzrag; Fri, 28 Feb 2025 16:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E255033A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E255033A;
	Fri, 28 Feb 2025 16:58:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 122A21DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AFCE42E02
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gLO0lpxAmiM for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92EEA42E08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92EEA42E08
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CC368118C; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9fb788dc175efecdcd6bbb456893337def82addf
X-Git-Newrev: 49cc81057b35f07223a98ef36f5f3ec28a626ecc
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.8CC368118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/toolchain-external:
 remove Bootlin nios2 external toolchain
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49cc81057b35f07223a98ef36f5f3ec28a626ecc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We are going to remove nios2 support, so remove the Bootlin nios2
external toolchain.

Remove this toolchain from the Buildroot testsuite.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   | 12 ++++++
 .../tests/toolchain/test_external_bootlin.py       | 28 ------------
 .../toolchain-external-bootlin/Config.in.options   | 50 ----------------------
 .../toolchain-external-bootlin.hash                |  4 --
 .../toolchain-external-bootlin.mk                  | 12 ------
 5 files changed, 12 insertions(+), 94 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fd12f8d49f..54c251be1f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
+	bool "Bootlin nios2 glibc bleeding-edge toolchain removed"
+	select BR2_LEGACY
+	help
+	  The nios2 Bootlin toolchains have been removed.
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
+	bool "Bootlin nios2 glibc stable toolchain removed"
+	select BR2_LEGACY
+	help
+	  The nios2 Bootlin toolchains have been removed.
+
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb has been removed"
 	select BR2_LEGACY
diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index c137444cbc..6bcebf80c0 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -1653,34 +1653,6 @@ class TestExternalToolchainBootlinMips64r6eln32UclibcStable(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinNios2GlibcBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_nios2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "nios2-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
-class TestExternalToolchainBootlinNios2GlibcStable(TestExternalToolchain):
-    config = """
-        BR2_nios2=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "nios2-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinOpenriscGlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_or1k=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 098e44fc36..1bbc0239e6 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -22,7 +22,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64 && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
-	default y if BR2_nios2
 	default y if BR2_or1k
 	default y if BR2_powerpc && BR2_powerpc_440fp
 	default y if BR2_powerpc && BR2_powerpc_e300c3
@@ -2782,55 +2781,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
-	bool "nios2 glibc bleeding-edge 2024.05-1"
-	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Bootlin toolchain for the nios2 architecture, using the
-	  glibc C library. This is a bleeding-edge version, which
-	  means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
-	bool "nios2 glibc stable 2024.05-1"
-	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Bootlin toolchain for the nios2 architecture, using the
-	  glibc C library. This is a stable version, which means it
-	  is using stable and proven versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
 	bool "openrisc glibc bleeding-edge 2024.05-1"
 	depends on BR2_or1k
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index adc42531cc..daa5c4cc79 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -212,10 +212,6 @@ sha256  cce09fc456b592a993a7c8d182cdd1f04397a8160f176d9ac6799d8e2e09cef7  mips64
 sha256  e12b6536fbacb624b0d938345fb29b202c8b174893d0d8fbefde46fbe727c729  mips64r6el-n32--uclibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2024.05-1.sha256
 sha256  a0db853f4c40d120d22e6762ca4bff64e0c3e3db74ab59950967917aeb9bf330  mips64r6el-n32--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2024.05-1.sha256
-sha256  5d034a538a8613ef324ae96f097c122ed99574ec8707e3274743e4d79efd374c  nios2--glibc--bleeding-edge-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2024.05-1.sha256
-sha256  db7a12e0b22037f3aad01cd126b5f1bfe7dc514e37f8c484eb587b861f20fbcd  nios2--glibc--stable-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2024.05-1.sha256
 sha256  0de17cd13642f71f112d086c1df4b34670440ceb459478a0f3d55007945633ca  openrisc--glibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2024.05-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 18639db1b3..a3d8ce215c 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -642,18 +642,6 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_E
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
-endif
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
