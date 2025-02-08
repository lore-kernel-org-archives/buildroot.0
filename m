Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C064C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 20:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9784B4198C;
	Sat,  8 Feb 2025 20:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-ZaZpdneWHL; Sat,  8 Feb 2025 20:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1C741954
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1C741954;
	Sat,  8 Feb 2025 20:46:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C3C1B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 20:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17595414E0
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 20:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eKWs85Xl-nY for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 20:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CA5841429
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CA5841429
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 20:45:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12FDF8704F; Sat,  8 Feb 2025 20:45:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 21:38:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44e739d031c8c5ed70a8ea513ff95dc8780a2a0f
X-Git-Newrev: edb4d9724b024717ce0c03932c4c2ae6f4b633f3
X-Patchwork-Hint: ignore
Message-Id: <20250208204556.12FDF8704F@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: drop
 Microblaze/bleeding-edge
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

commit: https://git.buildroot.net/buildroot/commit/?id=edb4d9724b024717ce0c03932c4c2ae6f4b633f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 14.x has a significant bug where libatomic lacks some important
functions, causing the toolchain to be pretty much
unusable. Therefore, let's drop this toolchain entirely from our
listing for now.

See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280 for more
details.

Fixes:

  http://autobuild.buildroot.net/results/dd081ca3c5746b980b0bcdf1f12b1a26c6b7ef86/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/scripts/gen-bootlin-toolchains             |   6 +
 .../tests/toolchain/test_external_bootlin.py       |  84 -------------
 .../toolchain-external-bootlin/Config.in.options   | 140 ---------------------
 .../toolchain-external-bootlin.hash                |  12 --
 .../toolchain-external-bootlin.mk                  |  36 ------
 5 files changed, 6 insertions(+), 272 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index df16cff5c4..9ba5827cf6 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -478,6 +478,12 @@ def get_toolchains():
             elif parts[2].startswith("bleeding-edge-"):
                 variant = "bleeding-edge"
                 version = parts[2][len("bleeding-edge-"):]
+
+            # GCC 14.x on Microblaze is very broken, see
+            # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280
+            if arch in ["microblazeel", "microblazebe"] and variant == "bleeding-edge":
+                continue
+
             tmp[(arch, libc, variant)] = version
 
         if len(tmp) == 0:
diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 6bcebf80c0..74fe1635c9 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -795,20 +795,6 @@ class TestExternalToolchainBootlinM68kcoldfireUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinMicroblazebeGlibcBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_microblazebe=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "microblaze-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinMicroblazebeGlibcStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -823,20 +809,6 @@ class TestExternalToolchainBootlinMicroblazebeGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinMicroblazebeMuslBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_microblazebe=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "microblaze-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinMicroblazebeMuslStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -851,20 +823,6 @@ class TestExternalToolchainBootlinMicroblazebeMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinMicroblazebeUclibcBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_microblazebe=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "microblaze-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinMicroblazebeUclibcStable(TestExternalToolchain):
     config = """
         BR2_microblazebe=y
@@ -879,20 +837,6 @@ class TestExternalToolchainBootlinMicroblazebeUclibcStable(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinMicroblazeelGlibcBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_microblazeel=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "microblazeel-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinMicroblazeelGlibcStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -907,20 +851,6 @@ class TestExternalToolchainBootlinMicroblazeelGlibcStable(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinMicroblazeelMuslBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_microblazeel=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "microblazeel-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinMicroblazeelMuslStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
@@ -935,20 +865,6 @@ class TestExternalToolchainBootlinMicroblazeelMuslStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
-class TestExternalToolchainBootlinMicroblazeelUclibcBleedingEdge(TestExternalToolchain):
-    config = """
-        BR2_microblazeel=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-    toolchain_prefix = "microblazeel-linux"
-
-    def test_run(self):
-        TestExternalToolchain.common_check(self)
-
-
 class TestExternalToolchainBootlinMicroblazeelUclibcStable(TestExternalToolchain):
     config = """
         BR2_microblazeel=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 1bbc0239e6..471dc55f44 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -1372,29 +1372,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
-	bool "microblazebe glibc bleeding-edge 2024.05-1"
-	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Bootlin toolchain for the microblazebe architecture, using
-	  the glibc C library. This is a bleeding-edge version, which
-	  means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	bool "microblazebe glibc stable 2024.05-1"
 	depends on BR2_microblazebe
@@ -1418,29 +1395,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
-	bool "microblazebe musl bleeding-edge 2024.05-1"
-	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-	help
-	  Bootlin toolchain for the microblazebe architecture, using
-	  the musl C library. This is a bleeding-edge version, which
-	  means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	bool "microblazebe musl stable 2024.05-1"
 	depends on BR2_microblazebe
@@ -1464,30 +1418,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
-	bool "microblazebe uclibc bleeding-edge 2024.05-1"
-	depends on BR2_microblazebe
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_USE_WCHAR
-	select BR2_ENABLE_LOCALE
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	help
-	  Bootlin toolchain for the microblazebe architecture, using
-	  the uclibc C library. This is a bleeding-edge version,
-	  which means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	bool "microblazebe uclibc stable 2024.05-1"
 	depends on BR2_microblazebe
@@ -1512,29 +1442,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
-	bool "microblazeel glibc bleeding-edge 2024.05-1"
-	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	help
-	  Bootlin toolchain for the microblazeel architecture, using
-	  the glibc C library. This is a bleeding-edge version, which
-	  means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	bool "microblazeel glibc stable 2024.05-1"
 	depends on BR2_microblazeel
@@ -1558,29 +1465,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
-	bool "microblazeel musl bleeding-edge 2024.05-1"
-	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_MUSL
-	help
-	  Bootlin toolchain for the microblazeel architecture, using
-	  the musl C library. This is a bleeding-edge version, which
-	  means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	bool "microblazeel musl stable 2024.05-1"
 	depends on BR2_microblazeel
@@ -1604,30 +1488,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
-	bool "microblazeel uclibc bleeding-edge 2024.05-1"
-	depends on BR2_microblazeel
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
-	select BR2_USE_WCHAR
-	select BR2_ENABLE_LOCALE
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	help
-	  Bootlin toolchain for the microblazeel architecture, using
-	  the uclibc C library. This is a bleeding-edge version,
-	  which means it is using the latest versions of gcc, gdb and
-	  binutils.
-
-	  https://toolchains.bootlin.com/
-
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	bool "microblazeel uclibc stable 2024.05-1"
 	depends on BR2_microblazeel
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index daa5c4cc79..1515f35a91 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -104,28 +104,16 @@ sha256  92b41ec8da2da233c65ce96ad9db5e849d0d687378c799f774df6efe7c8f0e28  m68k-6
 sha256  6ef31adc06bb53b0b9252bbf7cdc93c22f0d6838dc9f51a4dc6e0fe2016eceff  m68k-coldfire--uclibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2024.05-1.sha256
 sha256  370953f7c1e3bcf8b4e6849906991019f742fbde8532850aabd4eb3978e4a933  m68k-coldfire--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2024.05-1.sha256
-sha256  f8fe7afda005b6f3fc3a602c6d8d1e1d524b2ebb5452a736351994723a9faf72  microblazebe--glibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2024.05-1.sha256
 sha256  7a24a6cd76175d77134a0d02852204c548c9d2722e08ecc02ccf49f4c477792d  microblazebe--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2024.05-1.sha256
-sha256  5e51c0576acc7043d74644fed43b10e0aa75c4025741edcdd3e636d528270973  microblazebe--musl--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2024.05-1.sha256
 sha256  f1e0d9406fdb211c9f44b71d4d3b4b68ac5dec4e379b24ff8a488f7945b99dfe  microblazebe--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  fb2a4dc7407699c36046f1fc0ff10833805dfb9c8aa4e2c30adcda45de7474f6  microblazebe--uclibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2024.05-1.sha256
 sha256  17c6aa01b8421961b17eca4950cab8d292aa87d073f325525de1e77c5f7a5546  microblazebe--uclibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2024.05-1.sha256
-sha256  686905d647c24fb1f95dedb95c4a764d263a577cce673ea629d87c1a8986e9c8  microblazeel--glibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2024.05-1.sha256
 sha256  2468c298089873e4d86026b84ca68e46b4802413639a55f2db1c6aba181d66d6  microblazeel--glibc--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2024.05-1.sha256
-sha256  ef1d35997bea684dfe5ee759b6668c309ee308956a3c82188402f5c42eba92db  microblazeel--musl--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2024.05-1.sha256
 sha256  72611e45e0a77eac21b04bfae70395b8bcfaf2c969fe51638db48a94ca9030f4  microblazeel--musl--stable-2024.05-1.tar.xz
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2024.05-1.sha256
-sha256  bdf72671801ff48b232f12f13de5f3aaf3180a8e93c680ab59a1023aac3ddfd7  microblazeel--uclibc--bleeding-edge-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2024.05-1.sha256
 sha256  49657597e55aa7d771cb4546c1d37d7ab9408b426d8c45f1bf61d90a53322a65  microblazeel--uclibc--stable-2024.05-1.tar.xz
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2024.05-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index a3d8ce215c..2ba7bf10da 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -318,72 +318,36 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-coldfire--uclibc--stable-$(TOOLCHAIN_EX
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
-TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
-TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2024.05-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
