Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D6BC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 20:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7197F40146;
	Sat, 24 Sep 2022 20:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7197F40146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-Cn5DaGygx5; Sat, 24 Sep 2022 20:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA54F40139;
	Sat, 24 Sep 2022 20:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA54F40139
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 437121BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C60841B7A
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C60841B7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id algaU56px53e for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 20:54:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABD694093D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABD694093D
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 20:54:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id E1B29100003;
 Sat, 24 Sep 2022 20:53:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 22:53:58 +0200
Message-Id: <20220924205358.1489231-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664052840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3aXnYZbkPWSarGM2zMS5vAxhe2hI/xA8/94e7heP8h4=;
 b=DN5eTptzBpw6l1F2VuuRv+tH2YK5pphhZDW9zR1MueMsAxgJsK9N8NZwFa5EwfvTsnbaO3
 FXjcWPUZ8VgnkrR/TmS16lfo9rFfPpDTNDzA56O/oDu7LduNQNiK7+fvWz7mNVkuYhhrYa
 LoulnBh2gty2O6ul/ixBmDBfYLvQRd496EqkOCds3BpeVcIqResT4HjUAX7BukrpSGlLPv
 7CPehqbRmbf0go7ULcJPK6Ff3j5yIi8ZAa/ClIXlStYzeH5myecZRjRNx3VG4QTYBvKGhq
 v0NuuRwJ9BYwogDtqRyj+hiJptLKT8j4gGKMGPh3jSHQQ12sqQhe3Z8otLJkBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DN5eTptz
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-bootlin: update to 2022.08
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit is the result of running
support/scripts/gen-bootlin-toolchains now that 2022.08 toolchains
have been made available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/toolchain/test_external_bootlin.py  |  163 +++
 .../Config.in.options                         | 1098 +++++++++++------
 .../toolchain-external-bootlin.hash           |  798 ++++++------
 .../toolchain-external-bootlin.mk             |  454 ++++---
 4 files changed, 1547 insertions(+), 966 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external_bootlin.py b/support/testing/tests/toolchain/test_external_bootlin.py
index 923bb0da94..96a8780d36 100644
--- a/support/testing/tests/toolchain/test_external_bootlin.py
+++ b/support/testing/tests/toolchain/test_external_bootlin.py
@@ -1593,6 +1593,34 @@ class TestExternalToolchainBootlinNios2GlibcStable(TestExternalToolchain):
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinOpenriscGlibcBleedingEdge(TestExternalToolchain):
+    config = """
+        BR2_or1k=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "or1k-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
+class TestExternalToolchainBootlinOpenriscGlibcStable(TestExternalToolchain):
+    config = """
+        BR2_or1k=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "or1k-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinOpenriscMuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_or1k=y
@@ -2599,6 +2627,21 @@ class TestExternalToolchainBootlinX8664v2GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v2GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v2MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2614,6 +2657,21 @@ class TestExternalToolchainBootlinX8664v2MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v2MuslStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v2UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2629,6 +2687,21 @@ class TestExternalToolchainBootlinX8664v2UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v2UclibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v2=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v3GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2644,6 +2717,21 @@ class TestExternalToolchainBootlinX8664v3GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v3GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v3MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2659,6 +2747,21 @@ class TestExternalToolchainBootlinX8664v3MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v3MuslStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v3UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2674,6 +2777,21 @@ class TestExternalToolchainBootlinX8664v3UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v3UclibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v3=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v4GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2689,6 +2807,21 @@ class TestExternalToolchainBootlinX8664v4GlibcBleedingEdge(TestExternalToolchain
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v4GlibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v4MuslBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2704,6 +2837,21 @@ class TestExternalToolchainBootlinX8664v4MuslBleedingEdge(TestExternalToolchain)
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v4MuslStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664v4UclibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
@@ -2719,6 +2867,21 @@ class TestExternalToolchainBootlinX8664v4UclibcBleedingEdge(TestExternalToolchai
         TestExternalToolchain.common_check(self)
 
 
+class TestExternalToolchainBootlinX8664v4UclibcStable(TestExternalToolchain):
+    config = """
+        BR2_x86_64=y
+        BR2_x86_x86_64_v4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    toolchain_prefix = "x86_64-linux"
+
+    def test_run(self):
+        TestExternalToolchain.common_check(self)
+
+
 class TestExternalToolchainBootlinX8664corei7GlibcBleedingEdge(TestExternalToolchain):
     config = """
         BR2_x86_64=y
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index c9eec1915b..7ae56a9d79 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -58,10 +58,10 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Bootlin toolchain variant"
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
-	bool "aarch64 glibc bleeding-edge 2021.11-1"
+	bool "aarch64 glibc bleeding-edge 2022.08-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -81,10 +81,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
-	bool "aarch64 glibc stable 2021.11-1"
+	bool "aarch64 glibc stable 2022.08-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -104,10 +104,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
-	bool "aarch64 musl bleeding-edge 2021.11-1"
+	bool "aarch64 musl bleeding-edge 2022.08-1"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -127,10 +127,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
-	bool "aarch64 musl stable 2021.11-1"
+	bool "aarch64 musl stable 2022.08-2"
 	depends on BR2_aarch64
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -149,9 +149,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
-	bool "aarch64 uclibc bleeding-edge 2021.11-1"
+	bool "aarch64 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_aarch64
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -172,9 +172,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
-	bool "aarch64 uclibc stable 2021.11-1"
+	bool "aarch64 uclibc stable 2022.08-1"
 	depends on BR2_aarch64
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -195,10 +195,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
-	bool "aarch64be glibc bleeding-edge 2021.11-1"
+	bool "aarch64be glibc bleeding-edge 2022.08-1"
 	depends on BR2_aarch64_be
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -218,10 +218,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
-	bool "aarch64be glibc stable 2021.11-1"
+	bool "aarch64be glibc stable 2022.08-1"
 	depends on BR2_aarch64_be
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -241,9 +241,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
-	bool "aarch64be uclibc bleeding-edge 2021.11-1"
+	bool "aarch64be uclibc bleeding-edge 2022.08-1"
 	depends on BR2_aarch64_be
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -264,9 +264,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
-	bool "aarch64be uclibc stable 2021.11-1"
+	bool "aarch64be uclibc stable 2022.08-1"
 	depends on BR2_aarch64_be
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -287,10 +287,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
-	bool "arcle-750d uclibc bleeding-edge 2021.11-1"
+	bool "arcle-750d uclibc bleeding-edge 2022.08-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -311,7 +311,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
-	bool "arcle-750d uclibc stable 2021.11-1"
+	bool "arcle-750d uclibc stable 2022.08-1"
 	depends on BR2_arcle
 	depends on BR2_arc750d
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -335,11 +335,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 glibc bleeding-edge 2021.11-1"
+	bool "arcle-hs38 glibc bleeding-edge 2022.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -359,7 +359,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
-	bool "arcle-hs38 glibc stable 2021.11-3"
+	bool "arcle-hs38 glibc stable 2022.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
 	depends on BR2_USE_MMU
@@ -383,10 +383,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
-	bool "arcle-hs38 uclibc bleeding-edge 2021.11-1"
+	bool "arcle-hs38 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -407,7 +407,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
-	bool "arcle-hs38 uclibc stable 2021.11-1"
+	bool "arcle-hs38 uclibc stable 2022.08-1"
 	depends on BR2_arcle
 	depends on BR2_archs38
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -431,12 +431,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
-	bool "armv5-eabi glibc bleeding-edge 2021.11-1"
+	bool "armv5-eabi glibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -456,12 +456,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
-	bool "armv5-eabi glibc stable 2021.11-1"
+	bool "armv5-eabi glibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -481,12 +481,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
-	bool "armv5-eabi musl bleeding-edge 2021.11-1"
+	bool "armv5-eabi musl bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -506,12 +506,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
-	bool "armv5-eabi musl stable 2021.11-1"
+	bool "armv5-eabi musl stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -531,11 +531,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
-	bool "armv5-eabi uclibc bleeding-edge 2021.11-1"
+	bool "armv5-eabi uclibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -556,11 +556,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
-	bool "armv5-eabi uclibc stable 2021.11-1"
+	bool "armv5-eabi uclibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV5
 	depends on BR2_ARM_EABI
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -581,12 +581,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf glibc bleeding-edge 2021.11-1"
+	bool "armv6-eabihf glibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -606,12 +606,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
-	bool "armv6-eabihf glibc stable 2021.11-1"
+	bool "armv6-eabihf glibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -631,12 +631,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv6-eabihf musl bleeding-edge 2021.11-1"
+	bool "armv6-eabihf musl bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -656,12 +656,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
-	bool "armv6-eabihf musl stable 2021.11-1"
+	bool "armv6-eabihf musl stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -681,11 +681,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv6-eabihf uclibc bleeding-edge 2021.11-1"
+	bool "armv6-eabihf uclibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -706,11 +706,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
-	bool "armv6-eabihf uclibc stable 2021.11-1"
+	bool "armv6-eabihf uclibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV6
 	depends on BR2_ARM_EABIHF
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -731,12 +731,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf glibc bleeding-edge 2021.11-1"
+	bool "armv7-eabihf glibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -756,12 +756,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
-	bool "armv7-eabihf glibc stable 2021.11-1"
+	bool "armv7-eabihf glibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -781,12 +781,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armv7-eabihf musl bleeding-edge 2021.11-1"
+	bool "armv7-eabihf musl bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -806,12 +806,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
-	bool "armv7-eabihf musl stable 2021.11-1"
+	bool "armv7-eabihf musl stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -831,11 +831,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armv7-eabihf uclibc bleeding-edge 2021.11-1"
+	bool "armv7-eabihf uclibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -856,11 +856,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
-	bool "armv7-eabihf uclibc stable 2021.11-1"
+	bool "armv7-eabihf uclibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -881,12 +881,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf glibc bleeding-edge 2021.11-1"
+	bool "armebv7-eabihf glibc bleeding-edge 2022.08-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -906,12 +906,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
-	bool "armebv7-eabihf glibc stable 2021.11-1"
+	bool "armebv7-eabihf glibc stable 2022.08-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -931,12 +931,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
-	bool "armebv7-eabihf musl bleeding-edge 2021.11-1"
+	bool "armebv7-eabihf musl bleeding-edge 2022.08-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -956,12 +956,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
-	bool "armebv7-eabihf musl stable 2021.11-1"
+	bool "armebv7-eabihf musl stable 2022.08-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -981,11 +981,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
-	bool "armebv7-eabihf uclibc bleeding-edge 2021.11-1"
+	bool "armebv7-eabihf uclibc bleeding-edge 2022.08-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1006,11 +1006,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
-	bool "armebv7-eabihf uclibc stable 2021.11-1"
+	bool "armebv7-eabihf uclibc stable 2022.08-1"
 	depends on BR2_armeb
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABIHF
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1031,10 +1031,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
-	bool "armv7m uclibc bleeding-edge 2021.11-1"
+	bool "armv7m uclibc bleeding-edge 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1053,10 +1053,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
-	bool "armv7m uclibc stable 2021.11-1"
+	bool "armv7m uclibc stable 2022.08-1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7M
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1075,9 +1075,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
-	bool "m68k-68xxx uclibc bleeding-edge 2021.11-1"
+	bool "m68k-68xxx uclibc bleeding-edge 2022.08-1"
 	depends on BR2_m68k_m68k
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1098,9 +1098,9 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE
-	bool "m68k-68xxx uclibc stable 2021.11-1"
+	bool "m68k-68xxx uclibc stable 2022.08-1"
 	depends on BR2_m68k_m68k
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1163,11 +1163,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
-	bool "microblazebe glibc bleeding-edge 2021.11-1"
+	bool "microblazebe glibc bleeding-edge 2022.08-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1186,11 +1186,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
-	bool "microblazebe glibc stable 2021.11-1"
+	bool "microblazebe glibc stable 2022.08-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1209,11 +1209,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
-	bool "microblazebe musl bleeding-edge 2021.11-1"
+	bool "microblazebe musl bleeding-edge 2022.08-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1232,11 +1232,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
-	bool "microblazebe musl stable 2021.11-1"
+	bool "microblazebe musl stable 2022.08-1"
 	depends on BR2_microblazebe
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1255,10 +1255,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
-	bool "microblazebe uclibc bleeding-edge 2021.11-1"
+	bool "microblazebe uclibc bleeding-edge 2022.08-1"
 	depends on BR2_microblazebe
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1279,10 +1279,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
-	bool "microblazebe uclibc stable 2021.11-1"
+	bool "microblazebe uclibc stable 2022.08-1"
 	depends on BR2_microblazebe
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1303,11 +1303,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
-	bool "microblazeel glibc bleeding-edge 2021.11-1"
+	bool "microblazeel glibc bleeding-edge 2022.08-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1326,11 +1326,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
-	bool "microblazeel glibc stable 2021.11-1"
+	bool "microblazeel glibc stable 2022.08-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1349,11 +1349,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
-	bool "microblazeel musl bleeding-edge 2021.11-1"
+	bool "microblazeel musl bleeding-edge 2022.08-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1372,11 +1372,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
-	bool "microblazeel musl stable 2021.11-1"
+	bool "microblazeel musl stable 2022.08-1"
 	depends on BR2_microblazeel
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1395,10 +1395,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
-	bool "microblazeel uclibc bleeding-edge 2021.11-1"
+	bool "microblazeel uclibc bleeding-edge 2022.08-1"
 	depends on BR2_microblazeel
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1419,10 +1419,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
-	bool "microblazeel uclibc stable 2021.11-1"
+	bool "microblazeel uclibc stable 2022.08-1"
 	depends on BR2_microblazeel
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1443,12 +1443,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
-	bool "mips32 glibc bleeding-edge 2021.11-1"
+	bool "mips32 glibc bleeding-edge 2022.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1468,12 +1468,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
-	bool "mips32 glibc stable 2021.11-1"
+	bool "mips32 glibc stable 2022.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1493,12 +1493,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
-	bool "mips32 musl bleeding-edge 2021.11-1"
+	bool "mips32 musl bleeding-edge 2022.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1518,12 +1518,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
-	bool "mips32 musl stable 2021.11-1"
+	bool "mips32 musl stable 2022.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1542,11 +1542,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
-	bool "mips32 uclibc bleeding-edge 2021.11-1"
+	bool "mips32 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1567,11 +1567,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
-	bool "mips32 uclibc stable 2021.11-1"
+	bool "mips32 uclibc stable 2022.08-1"
 	depends on BR2_mips
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1592,12 +1592,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
-	bool "mips32el glibc bleeding-edge 2021.11-1"
+	bool "mips32el glibc bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1617,12 +1617,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
-	bool "mips32el glibc stable 2021.11-1"
+	bool "mips32el glibc stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1642,12 +1642,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
-	bool "mips32el musl bleeding-edge 2021.11-1"
+	bool "mips32el musl bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1667,12 +1667,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
-	bool "mips32el musl stable 2021.11-1"
+	bool "mips32el musl stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1691,11 +1691,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32el uclibc bleeding-edge 2021.11-1"
+	bool "mips32el uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1716,11 +1716,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
-	bool "mips32el uclibc stable 2021.11-1"
+	bool "mips32el uclibc stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1741,12 +1741,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r5el glibc bleeding-edge 2021.11-1"
+	bool "mips32r5el glibc bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1766,12 +1766,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
-	bool "mips32r5el glibc stable 2021.11-1"
+	bool "mips32r5el glibc stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1791,12 +1791,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
-	bool "mips32r5el musl bleeding-edge 2021.11-1"
+	bool "mips32r5el musl bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1816,12 +1816,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
-	bool "mips32r5el musl stable 2021.11-1"
+	bool "mips32r5el musl stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1841,11 +1841,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r5el uclibc bleeding-edge 2021.11-1"
+	bool "mips32r5el uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1866,11 +1866,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
-	bool "mips32r5el uclibc stable 2021.11-1"
+	bool "mips32r5el uclibc stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r5
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -1891,12 +1891,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
-	bool "mips32r6el glibc bleeding-edge 2021.11-1"
+	bool "mips32r6el glibc bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1916,12 +1916,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
-	bool "mips32r6el glibc stable 2021.11-1"
+	bool "mips32r6el glibc stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1941,12 +1941,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
-	bool "mips32r6el musl bleeding-edge 2021.11-1"
+	bool "mips32r6el musl bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1966,12 +1966,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
-	bool "mips32r6el musl stable 2021.11-1"
+	bool "mips32r6el musl stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -1991,11 +1991,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
-	bool "mips32r6el uclibc bleeding-edge 2021.11-1"
+	bool "mips32r6el uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2016,11 +2016,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
-	bool "mips32r6el uclibc stable 2021.11-1"
+	bool "mips32r6el uclibc stable 2022.08-1"
 	depends on BR2_mipsel
 	depends on BR2_mips_32r6
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2041,13 +2041,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64-n32 glibc bleeding-edge 2021.11-1"
+	bool "mips64-n32 glibc bleeding-edge 2022.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2067,13 +2067,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
-	bool "mips64-n32 glibc stable 2021.11-1"
+	bool "mips64-n32 glibc stable 2022.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2093,13 +2093,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
-	bool "mips64-n32 musl bleeding-edge 2021.11-1"
+	bool "mips64-n32 musl bleeding-edge 2022.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2119,13 +2119,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
-	bool "mips64-n32 musl stable 2021.11-1"
+	bool "mips64-n32 musl stable 2022.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2145,12 +2145,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64-n32 uclibc bleeding-edge 2021.11-1"
+	bool "mips64-n32 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2171,12 +2171,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
-	bool "mips64-n32 uclibc stable 2021.11-1"
+	bool "mips64-n32 uclibc stable 2022.08-1"
 	depends on BR2_mips64
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2197,13 +2197,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 glibc bleeding-edge 2021.11-1"
+	bool "mips64el-n32 glibc bleeding-edge 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2223,13 +2223,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
-	bool "mips64el-n32 glibc stable 2021.11-1"
+	bool "mips64el-n32 glibc stable 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2249,13 +2249,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64el-n32 musl bleeding-edge 2021.11-1"
+	bool "mips64el-n32 musl bleeding-edge 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2275,13 +2275,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
-	bool "mips64el-n32 musl stable 2021.11-1"
+	bool "mips64el-n32 musl stable 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2301,12 +2301,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64el-n32 uclibc bleeding-edge 2021.11-1"
+	bool "mips64el-n32 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2327,12 +2327,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
-	bool "mips64el-n32 uclibc stable 2021.11-1"
+	bool "mips64el-n32 uclibc stable 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2353,13 +2353,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 glibc bleeding-edge 2021.11-1"
+	bool "mips64r6el-n32 glibc bleeding-edge 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2379,13 +2379,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
-	bool "mips64r6el-n32 glibc stable 2021.11-1"
+	bool "mips64r6el-n32 glibc stable 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2405,13 +2405,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
-	bool "mips64r6el-n32 musl bleeding-edge 2021.11-1"
+	bool "mips64r6el-n32 musl bleeding-edge 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2431,13 +2431,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
-	bool "mips64r6el-n32 musl stable 2021.11-1"
+	bool "mips64r6el-n32 musl stable 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2457,12 +2457,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
-	bool "mips64r6el-n32 uclibc bleeding-edge 2021.11-1"
+	bool "mips64r6el-n32 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2483,12 +2483,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
-	bool "mips64r6el-n32 uclibc stable 2021.11-1"
+	bool "mips64r6el-n32 uclibc stable 2022.08-1"
 	depends on BR2_mips64el
 	depends on BR2_mips_64r6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_MIPS_SOFT_FLOAT
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2509,10 +2509,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
-	bool "nios2 glibc bleeding-edge 2021.11-1"
+	bool "nios2 glibc bleeding-edge 2022.08-1"
 	depends on BR2_nios2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2532,10 +2532,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
-	bool "nios2 glibc stable 2021.11-1"
+	bool "nios2 glibc stable 2022.08-1"
 	depends on BR2_nios2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2554,8 +2554,32 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
-	bool "openrisc musl bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE
+	bool "openrisc glibc bleeding-edge 2022.08-1"
+	depends on BR2_or1k
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the openrisc architecture, using the
+	  glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE
+	bool "openrisc glibc stable 2022.08-1"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
@@ -2569,6 +2593,30 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the openrisc architecture, using the
+	  glibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
+	bool "openrisc musl bleeding-edge 2022.08-1"
+	depends on BR2_or1k
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_EXTERNAL_MUSL
 	help
 	  Bootlin toolchain for the openrisc architecture, using the
@@ -2579,11 +2627,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
-	bool "openrisc musl stable 2021.11-5"
+	bool "openrisc musl stable 2022.08-1"
 	depends on BR2_or1k
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2602,10 +2650,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
-	bool "openrisc uclibc bleeding-edge 2021.11-5"
+	bool "openrisc uclibc bleeding-edge 2022.08-1"
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2626,10 +2674,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
-	bool "openrisc uclibc stable 2021.11-5"
+	bool "openrisc uclibc stable 2022.08-1"
 	depends on BR2_or1k
 	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2650,11 +2698,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp glibc bleeding-edge 2021.11-1"
+	bool "powerpc-440fp glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2674,11 +2722,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
-	bool "powerpc-440fp glibc stable 2021.11-1"
+	bool "powerpc-440fp glibc stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2698,11 +2746,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
-	bool "powerpc-440fp musl bleeding-edge 2021.11-1"
+	bool "powerpc-440fp musl bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2721,11 +2769,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
-	bool "powerpc-440fp musl stable 2021.11-1"
+	bool "powerpc-440fp musl stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2744,10 +2792,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-440fp uclibc bleeding-edge 2021.11-1"
+	bool "powerpc-440fp uclibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2768,10 +2816,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
-	bool "powerpc-440fp uclibc stable 2021.11-1"
+	bool "powerpc-440fp uclibc stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2792,11 +2840,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 glibc bleeding-edge 2021.11-1"
+	bool "powerpc-e300c3 glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2816,11 +2864,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
-	bool "powerpc-e300c3 glibc stable 2021.11-1"
+	bool "powerpc-e300c3 glibc stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2840,11 +2888,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
-	bool "powerpc-e300c3 musl bleeding-edge 2021.11-1"
+	bool "powerpc-e300c3 musl bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2863,11 +2911,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
-	bool "powerpc-e300c3 musl stable 2021.11-1"
+	bool "powerpc-e300c3 musl stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2886,10 +2934,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e300c3 uclibc bleeding-edge 2021.11-1"
+	bool "powerpc-e300c3 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2910,10 +2958,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
-	bool "powerpc-e300c3 uclibc stable 2021.11-1"
+	bool "powerpc-e300c3 uclibc stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -2934,11 +2982,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc glibc bleeding-edge 2021.11-1"
+	bool "powerpc-e500mc glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2958,11 +3006,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
-	bool "powerpc-e500mc glibc stable 2021.11-1"
+	bool "powerpc-e500mc glibc stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -2982,11 +3030,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
-	bool "powerpc-e500mc musl bleeding-edge 2021.11-1"
+	bool "powerpc-e500mc musl bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3005,11 +3053,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
-	bool "powerpc-e500mc musl stable 2021.11-1"
+	bool "powerpc-e500mc musl stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3028,10 +3076,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
-	bool "powerpc-e500mc uclibc bleeding-edge 2021.11-1"
+	bool "powerpc-e500mc uclibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3052,10 +3100,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
-	bool "powerpc-e500mc uclibc stable 2021.11-1"
+	bool "powerpc-e500mc uclibc stable 2022.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3076,11 +3124,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e5500 glibc bleeding-edge 2021.11-1"
+	bool "powerpc64-e5500 glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3100,11 +3148,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
-	bool "powerpc64-e5500 glibc stable 2021.11-1"
+	bool "powerpc64-e5500 glibc stable 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3124,11 +3172,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-e6500 glibc bleeding-edge 2021.11-1"
+	bool "powerpc64-e6500 glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3148,11 +3196,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
-	bool "powerpc64-e6500 glibc stable 2021.11-1"
+	bool "powerpc64-e6500 glibc stable 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3172,11 +3220,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
-	bool "powerpc64-e6500 musl bleeding-edge 2021.11-1"
+	bool "powerpc64-e6500 musl bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3196,11 +3244,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
-	bool "powerpc64-e6500 musl stable 2021.11-1"
+	bool "powerpc64-e6500 musl stable 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3220,11 +3268,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64-power8 glibc bleeding-edge 2021.11-2"
+	bool "powerpc64-power8 glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3244,11 +3292,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
-	bool "powerpc64-power8 glibc stable 2021.11-1"
+	bool "powerpc64-power8 glibc stable 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3268,11 +3316,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64-power8 musl bleeding-edge 2021.11-2"
+	bool "powerpc64-power8 musl bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3292,11 +3340,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
-	bool "powerpc64-power8 musl stable 2021.11-1"
+	bool "powerpc64-power8 musl stable 2022.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3316,11 +3364,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
-	bool "powerpc64le-power8 glibc bleeding-edge 2021.11-2"
+	bool "powerpc64le-power8 glibc bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3340,11 +3388,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
-	bool "powerpc64le-power8 glibc stable 2021.11-1"
+	bool "powerpc64le-power8 glibc stable 2022.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3364,11 +3412,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
-	bool "powerpc64le-power8 musl bleeding-edge 2021.11-2"
+	bool "powerpc64le-power8 musl bleeding-edge 2022.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3388,11 +3436,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
-	bool "powerpc64le-power8 musl stable 2021.11-1"
+	bool "powerpc64le-power8 musl stable 2022.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3412,13 +3460,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
-	bool "riscv32-ilp32d glibc bleeding-edge 2021.11-1"
+	bool "riscv32-ilp32d glibc bleeding-edge 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_32
 	depends on BR2_RISCV_ABI_ILP32D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3438,13 +3486,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d glibc bleeding-edge 2021.11-1"
+	bool "riscv64-lp64d glibc bleeding-edge 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3464,13 +3512,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
-	bool "riscv64-lp64d glibc stable 2021.11-1"
+	bool "riscv64-lp64d glibc stable 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3490,13 +3538,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
-	bool "riscv64-lp64d musl bleeding-edge 2021.11-1"
+	bool "riscv64-lp64d musl bleeding-edge 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3516,13 +3564,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
-	bool "riscv64-lp64d musl stable 2021.11-1"
+	bool "riscv64-lp64d musl stable 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3542,13 +3590,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
-	bool "riscv64-lp64d uclibc bleeding-edge 2021.11-1"
+	bool "riscv64-lp64d uclibc bleeding-edge 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3569,13 +3617,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
-	bool "riscv64-lp64d uclibc stable 2021.11-1"
+	bool "riscv64-lp64d uclibc stable 2022.08-1"
 	depends on BR2_riscv
 	depends on BR2_riscv_g
 	depends on BR2_RISCV_64
 	depends on BR2_RISCV_ABI_LP64D
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3596,11 +3644,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
-	bool "s390x-z13 glibc bleeding-edge 2021.11-1"
+	bool "s390x-z13 glibc bleeding-edge 2022.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3620,11 +3668,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
-	bool "s390x-z13 glibc stable 2021.11-1"
+	bool "s390x-z13 glibc stable 2022.08-1"
 	depends on BR2_s390x
 	depends on BR2_s390x_z13
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3644,11 +3692,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4 glibc bleeding-edge 2021.11-1"
+	bool "sh-sh4 glibc bleeding-edge 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3668,11 +3716,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
-	bool "sh-sh4 glibc stable 2021.11-1"
+	bool "sh-sh4 glibc stable 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3692,11 +3740,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
-	bool "sh-sh4 musl bleeding-edge 2021.11-1"
+	bool "sh-sh4 musl bleeding-edge 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3716,11 +3764,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
-	bool "sh-sh4 musl stable 2021.11-1"
+	bool "sh-sh4 musl stable 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3739,10 +3787,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
-	bool "sh-sh4 uclibc bleeding-edge 2021.11-1"
+	bool "sh-sh4 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3763,10 +3811,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
-	bool "sh-sh4 uclibc stable 2021.11-1"
+	bool "sh-sh4 uclibc stable 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3787,11 +3835,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
-	bool "sh-sh4aeb glibc bleeding-edge 2021.11-1"
+	bool "sh-sh4aeb glibc bleeding-edge 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3811,11 +3859,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
-	bool "sh-sh4aeb glibc stable 2021.11-1"
+	bool "sh-sh4aeb glibc stable 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3835,11 +3883,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
-	bool "sh-sh4aeb musl bleeding-edge 2021.11-1"
+	bool "sh-sh4aeb musl bleeding-edge 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3859,11 +3907,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
-	bool "sh-sh4aeb musl stable 2021.11-1"
+	bool "sh-sh4aeb musl stable 2022.08-1"
 	depends on BR2_sh
 	depends on BR2_sh4aeb
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3882,11 +3930,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
-	bool "sparc64 glibc bleeding-edge 2021.11-1"
+	bool "sparc64 glibc bleeding-edge 2022.08-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3906,11 +3954,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
-	bool "sparc64 glibc stable 2021.11-1"
+	bool "sparc64 glibc stable 2022.08-1"
 	depends on BR2_sparc64
 	depends on BR2_sparc_v9
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -3930,10 +3978,10 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
-	bool "sparcv8 uclibc bleeding-edge 2021.11-3"
+	bool "sparcv8 uclibc bleeding-edge 2022.08-2"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -3954,7 +4002,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
-	bool "sparcv8 uclibc stable 2021.11-1"
+	bool "sparcv8 uclibc stable 2022.08-1"
 	depends on BR2_sparc
 	depends on BR2_sparc_v8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -3978,13 +4026,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
-	bool "x86-64 glibc bleeding-edge 2021.11-5"
+	bool "x86-64 glibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4004,13 +4052,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
-	bool "x86-64 glibc stable 2021.11-5"
+	bool "x86-64 glibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4030,13 +4078,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
-	bool "x86-64 musl bleeding-edge 2021.11-5"
+	bool "x86-64 musl bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4056,13 +4104,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
-	bool "x86-64 musl stable 2021.11-5"
+	bool "x86-64 musl stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4081,12 +4129,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
-	bool "x86-64 uclibc bleeding-edge 2021.11-5"
+	bool "x86-64 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4107,12 +4155,12 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
-	bool "x86-64 uclibc stable 2021.11-5"
+	bool "x86-64 uclibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4133,7 +4181,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 glibc bleeding-edge 2021.11-5"
+	bool "x86-64-v2 glibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4143,7 +4191,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4162,8 +4210,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
-	bool "x86-64-v2 musl bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE
+	bool "x86-64-v2 glibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4174,6 +4222,36 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64-v2 architecture, using the
+	  glibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
+	bool "x86-64-v2 musl bleeding-edge 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4192,8 +4270,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v2 uclibc bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE
+	bool "x86-64-v2 musl stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4202,7 +4280,36 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64-v2 architecture, using the
+	  musl C library. This is a stable version, which means it is
+	  using stable and proven versions of gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
+	bool "x86-64-v2 uclibc bleeding-edge 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4222,8 +4329,38 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE
+	bool "x86-64-v2 uclibc stable 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64-v2 architecture, using the
+	  uclibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 glibc bleeding-edge 2021.11-5"
+	bool "x86-64-v3 glibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4235,7 +4372,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4254,8 +4391,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
-	bool "x86-64-v3 musl bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE
+	bool "x86-64-v3 glibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4268,6 +4405,38 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64-v3 architecture, using the
+	  glibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
+	bool "x86-64-v3 musl bleeding-edge 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4286,8 +4455,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v3 uclibc bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE
+	bool "x86-64-v3 musl stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4298,7 +4467,38 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64-v3 architecture, using the
+	  musl C library. This is a stable version, which means it is
+	  using stable and proven versions of gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
+	bool "x86-64-v3 uclibc bleeding-edge 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4318,8 +4518,40 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE
+	bool "x86-64-v3 uclibc stable 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64-v3 architecture, using the
+	  uclibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 glibc bleeding-edge 2021.11-5"
+	bool "x86-64-v4 glibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4332,7 +4564,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4351,8 +4583,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
-	bool "x86-64-v4 musl bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE
+	bool "x86-64-v4 glibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4366,6 +4598,39 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX512
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Bootlin toolchain for the x86-64-v4 architecture, using the
+	  glibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
+	bool "x86-64-v4 musl bleeding-edge 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_X86_CPU_HAS_AVX512
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4384,8 +4649,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
-config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-v4 uclibc bleeding-edge 2021.11-5"
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE
+	bool "x86-64-v4 musl stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4397,7 +4662,39 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_AVX
 	depends on BR2_X86_CPU_HAS_AVX2
 	depends on BR2_X86_CPU_HAS_AVX512
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the x86-64-v4 architecture, using the
+	  musl C library. This is a stable version, which means it is
+	  using stable and proven versions of gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
+	bool "x86-64-v4 uclibc bleeding-edge 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_X86_CPU_HAS_AVX512
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4417,8 +4714,41 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE
+	bool "x86-64-v4 uclibc stable 2022.08-1"
+	depends on BR2_x86_64
+	depends on BR2_X86_CPU_HAS_MMX
+	depends on BR2_X86_CPU_HAS_SSE
+	depends on BR2_X86_CPU_HAS_SSE2
+	depends on BR2_X86_CPU_HAS_SSE3
+	depends on BR2_X86_CPU_HAS_SSSE3
+	depends on BR2_X86_CPU_HAS_SSE4
+	depends on BR2_X86_CPU_HAS_SSE42
+	depends on BR2_X86_CPU_HAS_AVX
+	depends on BR2_X86_CPU_HAS_AVX2
+	depends on BR2_X86_CPU_HAS_AVX512
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the x86-64-v4 architecture, using the
+	  uclibc C library. This is a stable version, which means it
+	  is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 glibc bleeding-edge 2021.11-1"
+	bool "x86-64-core-i7 glibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4428,7 +4758,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4448,7 +4778,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
-	bool "x86-64-core-i7 glibc stable 2021.11-1"
+	bool "x86-64-core-i7 glibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4458,7 +4788,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4478,7 +4808,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
-	bool "x86-64-core-i7 musl bleeding-edge 2021.11-1"
+	bool "x86-64-core-i7 musl bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4488,7 +4818,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4508,7 +4838,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
-	bool "x86-64-core-i7 musl stable 2021.11-1"
+	bool "x86-64-core-i7 musl stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4518,7 +4848,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4538,7 +4868,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
-	bool "x86-64-core-i7 uclibc bleeding-edge 2021.11-1"
+	bool "x86-64-core-i7 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4547,7 +4877,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4568,7 +4898,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
-	bool "x86-64-core-i7 uclibc stable 2021.11-1"
+	bool "x86-64-core-i7 uclibc stable 2022.08-1"
 	depends on BR2_x86_64
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4577,7 +4907,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_X86_CPU_HAS_SSE4
 	depends on BR2_X86_CPU_HAS_SSE42
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4598,7 +4928,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
-	bool "x86-core2 glibc bleeding-edge 2021.11-1"
+	bool "x86-core2 glibc bleeding-edge 2022.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4606,7 +4936,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4626,7 +4956,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
-	bool "x86-core2 glibc stable 2021.11-1"
+	bool "x86-core2 glibc stable 2022.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4634,7 +4964,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4654,7 +4984,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
-	bool "x86-core2 musl bleeding-edge 2021.11-1"
+	bool "x86-core2 musl bleeding-edge 2022.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4662,7 +4992,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4681,7 +5011,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
-	bool "x86-core2 musl stable 2021.11-1"
+	bool "x86-core2 musl stable 2022.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
@@ -4689,7 +5019,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4707,14 +5037,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
-	bool "x86-core2 uclibc bleeding-edge 2021.11-1"
+	bool "x86-core2 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4735,14 +5065,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
-	bool "x86-core2 uclibc stable 2021.11-1"
+	bool "x86-core2 uclibc stable 2022.08-1"
 	depends on BR2_i386
 	depends on BR2_X86_CPU_HAS_MMX
 	depends on BR2_X86_CPU_HAS_SSE
 	depends on BR2_X86_CPU_HAS_SSE2
 	depends on BR2_X86_CPU_HAS_SSE3
 	depends on BR2_X86_CPU_HAS_SSSE3
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4763,7 +5093,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
-	bool "x86-i686 glibc bleeding-edge 2021.11-1"
+	bool "x86-i686 glibc bleeding-edge 2022.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -4774,7 +5104,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4794,7 +5124,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
-	bool "x86-i686 glibc stable 2021.11-1"
+	bool "x86-i686 glibc stable 2022.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -4805,7 +5135,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4825,7 +5155,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
-	bool "x86-i686 musl bleeding-edge 2021.11-1"
+	bool "x86-i686 musl bleeding-edge 2022.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -4836,7 +5166,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4855,7 +5185,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
-	bool "x86-i686 musl stable 2021.11-1"
+	bool "x86-i686 musl stable 2022.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -4866,7 +5196,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_FORTRAN
@@ -4884,7 +5214,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
-	bool "x86-i686 uclibc bleeding-edge 2021.11-1"
+	bool "x86-i686 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -4894,7 +5224,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4915,7 +5245,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
-	bool "x86-i686 uclibc stable 2021.11-1"
+	bool "x86-i686 uclibc stable 2022.08-1"
 	depends on BR2_i386
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
@@ -4925,7 +5255,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_c3
 	depends on !BR2_x86_winchip_c6
 	depends on !BR2_x86_winchip2
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4946,11 +5276,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
-	bool "xtensa-lx60 uclibc bleeding-edge 2021.11-1"
+	bool "xtensa-lx60 uclibc bleeding-edge 2022.08-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
@@ -4971,11 +5301,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE
 	  https://toolchains.bootlin.com/
 
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE
-	bool "xtensa-lx60 uclibc stable 2021.11-1"
+	bool "xtensa-lx60 uclibc stable 2022.08-1"
 	depends on BR2_xtensa
 	depends on BR2_XTENSA_CUSTOM
 	depends on BR2_XTENSA_LITTLE_ENDIAN
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 99e9ffc9ef..9565ab1c1e 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -1,394 +1,416 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2021.11-1.sha256
-sha256  55b90e0e844ac02a7fc3352be42b7cb9bb3ec582c23649dbb77e05c60eb84434  aarch64--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2021.11-1.sha256
-sha256  dec070196608124fa14c3f192364c5b5b057d7f34651ad58ebb8fc87959c97f7  aarch64--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2021.11-1.sha256
-sha256  c56f51c518eca9e614cc639ffb99719531c1022275045a43dfcdf79a142ba4dc  aarch64--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2021.11-1.sha256
-sha256  6919b4cf04b8c5628a2a93bcf4b05e1143ab15dfb4bc2acde02a2e3c075bf041  aarch64--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  9ba30538bb38a3ee4db5289469fd0a539ba248b00da4e1b1b6f5c3724c20deef  aarch64--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2021.11-1.sha256
-sha256  ec629adb0acd80d56b00f35e9fe823571bdcdb72072c7fc2d50607b3882c1f98  aarch64--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2021.11-1.sha256
-sha256  8d610107f7bea8957d71dca45bb84368c74e01da786a113d1089b72ee79ca095  aarch64be--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2021.11-1.sha256
-sha256  6327121b67799ea967882cba746d25cf6a274a061f283d5c1b2818a651da0c9a  aarch64be--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  809d448f3f54fd9a4b01440acc697c022f3f0107e1bf0e9de3ee454a57be99e4  aarch64be--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2021.11-1.sha256
-sha256  08898011a5f12bf3fa0646a794bb63422fa24d20eb79d01665b2f91aa65f75aa  aarch64be--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  088b03942306b572db93025eae703086ddbfe9886e14544cf68ecd9dfa0ad4b4  arcle-750d--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2021.11-1.sha256
-sha256  6a7454aa1559ef304dfa55361763167848eb6d47539be31b24c7cf6723f581fd  arcle-750d--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2021.11-1.sha256
-sha256  e2a35602cf3a518e16681184c5ac095693dbc1d3edd1ae219da2dfff0cce7d67  arcle-hs38--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2021.11-3.sha256
-sha256  c7c00e3dcdb5123098cea365cfcf261e36adcf816bdd62e4e1ad661e1145f084  arcle-hs38--glibc--stable-2021.11-3.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  552b2387ed8129fd205d3387ca508f816d1a67b90dd1d5ea16ff4872c5129fd9  arcle-hs38--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2021.11-1.sha256
-sha256  85ea258031a8c304dce0a660c18e67ec415a032f0d9f2c4080f04a47efb44c48  arcle-hs38--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2021.11-1.sha256
-sha256  72a1964f1ba61d730b6be3b178bb4bc24de191a2ad8ada36e067d57011aae1a4  armv5-eabi--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2021.11-1.sha256
-sha256  22de590c491057d2f974b315055b357511319227c6084cccb1532e30c829687c  armv5-eabi--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2021.11-1.sha256
-sha256  4906e6b454c1f9b2041d617df7e253f96288050f9760859868d60857e6bab924  armv5-eabi--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2021.11-1.sha256
-sha256  2201fa9ce6d1226dafaf060cc568029d853af158b2ab182dcb8c7956bd993408  armv5-eabi--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  0187e76a377a096f7228b243637224cbe0dca12f5736202f813473723c566ea3  armv5-eabi--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2021.11-1.sha256
-sha256  888e65c2a75d125422ef4d2c144e3fed37d9a00169a78b4613fac34e7f9349ce  armv5-eabi--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2021.11-1.sha256
-sha256  c585b4129f60d3ae45c7b77fc6baf87f1c6a3d6d66b06059e1bf9f6e2fcf2899  armv6-eabihf--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2021.11-1.sha256
-sha256  c40177a063aa7db47747cbf4f26254d63abee9e20d8d88210261b50f03b51b22  armv6-eabihf--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2021.11-1.sha256
-sha256  d6114bbde0a308cf7057aa9c4f5641432c1e785d3decc650f64f5cb261370078  armv6-eabihf--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2021.11-1.sha256
-sha256  41c463f2cd2984a2d53e5dee2e9a81b09c6cac2ba7b306766bdfc8f4865977bf  armv6-eabihf--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  aca019db7e6167d5cf8d8ff68b10bad7d9dd7ae8784f991960754e8d027f424e  armv6-eabihf--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2021.11-1.sha256
-sha256  e7e19796a2f0b0d839508a721506e148cb4383ed82dcc2ff4b3c0c496a4229f3  armv6-eabihf--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2021.11-1.sha256
-sha256  1d2b488d047d1a1694305613adb918167a36bf0857cd6bda3ce87a0e4c2b7f28  armv7-eabihf--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2021.11-1.sha256
-sha256  6d10f356811429f1bddc23a174932c35127ab6c6f3b738b768f0c29c3bf92f10  armv7-eabihf--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2021.11-1.sha256
-sha256  31a373fded82805ac4ddac7608c5075b2086999dcd46ce6ba33c432b24faffaf  armv7-eabihf--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2021.11-1.sha256
-sha256  767c99155f74d5620cfd59d0224df2f82dec7ce58be24d702081dca9793408a9  armv7-eabihf--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  8d6cea2dfec2205ead2e6476f664d81442228d3b1e3fb9b320a54c68706ab9a2  armv7-eabihf--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2021.11-1.sha256
-sha256  3f8b1101a7318e2a6260a6b1c916b9b3bc69e8fd866d9e88eb85d3a496ad5064  armv7-eabihf--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2021.11-1.sha256
-sha256  1f7c0485d07718ed8b99288b5e2ec825d6931c92d7db8c880892682f7d717a40  armebv7-eabihf--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2021.11-1.sha256
-sha256  bfc67cd580e357cf390cb3590fa89e738818af11ae9167e263178304c1656ccb  armebv7-eabihf--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2021.11-1.sha256
-sha256  488ec97dbbd37c5431c60b0bf6485948ba026ca5097e9e258f4847fbccaa0181  armebv7-eabihf--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2021.11-1.sha256
-sha256  2a8d0752eaa480eff29b274e88c20e13ad41059f213991769b14684f219d7e12  armebv7-eabihf--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  a9665d2792bf9219c4a7153879d681b5f12c48e47b48969b1a87443b7ed9f26f  armebv7-eabihf--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2021.11-1.sha256
-sha256  84c7a58351ec618a48a5b357777c48dbbfd52dc48983ebf988a29483693bacbf  armebv7-eabihf--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  392215b53d8c03ca501481f6cfaa720676cf5a67ad1f25647f5a096398f57b28  armv7m--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2021.11-1.sha256
-sha256  2fca1ac4e767f8ce182a92c74f7b1e4866e7b74b447a2e4c62176379421bedbe  armv7m--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  2b694fb4397421504e805a71db182efd55b25fa6403ecf225cddd4a8212903b0  m68k-68xxx--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2021.11-1.sha256
-sha256  9b3afcd370cbe4912f730696d89ca5f8d26581992c80bdff027b2dd6a8910899  m68k-68xxx--uclibc--stable-2021.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2022.08-1.sha256
+sha256  d11a94113dc92fe1c141096dbeb1c3fe2adb0552b495bb9e3e41fad96b4b429a  aarch64--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2022.08-1.sha256
+sha256  844df3c99508030ee9cb1152cb182500bb9816ff01968f2e18591d51d766c9e7  aarch64--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2022.08-1.sha256
+sha256  20d9b6cca203d18355a57cc8014ebf701e548922149aeec0d6109399bcc37b42  aarch64--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--stable-2022.08-2.sha256
+sha256  06f5e1d63be86dfbe3c8f7508164464116d43a044b9bef20fe97277f34400bc2  aarch64--musl--stable-2022.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  24d3c9c294ef15669fa6182dff951f3850320e590b869587cc1650633f6c9b7f  aarch64--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--uclibc--stable-2022.08-1.sha256
+sha256  b448a1752a58d6bb118c030028cd26f070cedccc0edc95ce8d684cced1bd1c0d  aarch64--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--bleeding-edge-2022.08-1.sha256
+sha256  456b684924d581749fc6c2889320170b1bb5e3227324922109432e2a1dd54d91  aarch64be--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--glibc--stable-2022.08-1.sha256
+sha256  6cbc48f30cc0e8178cf083eeb48123c519f6e5e0a628a531a415d8907027b2d3  aarch64be--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  923441910c0d132e94a0f0681c403feea78d84a47b593f7946640c2e687771b0  aarch64be--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--uclibc--stable-2022.08-1.sha256
+sha256  b29fc8d852f531aaa094cda9ab08d0f28817f7404990f3b3a20b2ce180091566  aarch64be--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  bea37db5d3f229318c44d59efa444f5c2012bc773dbf23f1914669110c931f9b  arcle-750d--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs/arcle-750d--uclibc--stable-2022.08-1.sha256
+sha256  b333bfbb6b664f7f38a36a5648bac3567cec3f3672c12eadb368b3fc773e5570  arcle-750d--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--bleeding-edge-2022.08-1.sha256
+sha256  2c5fd77f67f2126412fcc7b163e492452f8bb0a2c7fa943cb7350387d00e2a46  arcle-hs38--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--glibc--stable-2022.08-1.sha256
+sha256  af8295901ad4bd359dc3e5da442ad9e6d0474e96cd38f31479d8c714bf4315e2  arcle-hs38--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  c6a00bae6d5e1bb343c339a942466f5f0de7d736671a6ba2d3f76890d9b0d486  arcle-hs38--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs/arcle-hs38--uclibc--stable-2022.08-1.sha256
+sha256  8fbe4086d5dafb1e0cd69f3762cb4d8c1273ee8b6bbbd8850fce54a5a8dad374  arcle-hs38--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2022.08-1.sha256
+sha256  4c015e4fcee7eab2782f6be04acdb15c55986b98f6e1f4c0e23458461f76c84f  armv5-eabi--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2022.08-1.sha256
+sha256  6230d9835894347f5c2b84e81d6d4825bb5315908a4ab50edd6270c8ba4477bf  armv5-eabi--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--bleeding-edge-2022.08-1.sha256
+sha256  fbc0db4138768433fc1704e2d7a82c7f527c82549c1562d09e12c154037a4f2c  armv5-eabi--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--musl--stable-2022.08-1.sha256
+sha256  74c4d7969e8c92b3ce848e957fc0aae3238eb826e0707692adf4993de5323a72  armv5-eabi--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  5072d99dc06123d197fc171d3dcfc15d7c1767dbcba0f0b95ed3b8de7fb78d2d  armv5-eabi--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--stable-2022.08-1.sha256
+sha256  6a39098391ecaab84c090fb7aba02e595ea07d4916b687bc1e2a6731a4c60506  armv5-eabi--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2022.08-1.sha256
+sha256  123e69824b789c752c980f36fb3923bb88baa23c05beff138c8fe119d3a2d1f3  armv6-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--stable-2022.08-1.sha256
+sha256  474167bc7f97af44a73a1f96ed088d201a42645af2e99f7c9c57bf0d45966407  armv6-eabihf--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--bleeding-edge-2022.08-1.sha256
+sha256  f971220c45074a93ec52298917a30a93f541599c545c389618984e2b603ee34b  armv6-eabihf--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--musl--stable-2022.08-1.sha256
+sha256  91cc2a45cccd9eb89b2737fbd4461c73bb589882d1a377408d0e3cefc24ca59a  armv6-eabihf--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  320df86444cced5d346f7bd5baa9b3cab04ffe5004feab16286ee7b25b14e2cf  armv6-eabihf--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--uclibc--stable-2022.08-1.sha256
+sha256  80a3ca5009440e2a0924eea60f915c75f10067427fb0312591b0936a8146cec0  armv6-eabihf--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2022.08-1.sha256
+sha256  7a3ceba0e5ed7ccb16da16e630a905c76c2ea58f66d161d6d45dce33321e70f6  armv7-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2022.08-1.sha256
+sha256  64329b3e72350ceda65997368395a945ef83769013d82414dc5f2021c33f2d44  armv7-eabihf--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--bleeding-edge-2022.08-1.sha256
+sha256  9f9837426dc798d8bd70458b6eb1f7c8f278a5bba5a212462bd8672d61177d83  armv7-eabihf--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--musl--stable-2022.08-1.sha256
+sha256  71f156ab45a9d9790d3b36ff970d9ce2e476e96b2ea94eb17aac632777e14eca  armv7-eabihf--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  01182a4fcdfcffe53bb2ade152e0bca40b36c1817c78cfb155306ae5250e0e7b  armv7-eabihf--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2022.08-1.sha256
+sha256  9e4191ab996fdf5f4e8de7e4617c67cbf46127ca2754fca0ad45d60e393ace05  armv7-eabihf--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--bleeding-edge-2022.08-1.sha256
+sha256  d5dff34e074b56a6132361415e8416c0efec583b2a001005d51ff54f2eaed4d4  armebv7-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--glibc--stable-2022.08-1.sha256
+sha256  ba6916b3045cdbaa251673acf1585254b929b2ee641282ce0c4d694211489fb4  armebv7-eabihf--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--bleeding-edge-2022.08-1.sha256
+sha256  f33c5cdedb914e11f2c7c0095c476f410e0d1d231848b2efbac1cb53f0262625  armebv7-eabihf--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--musl--stable-2022.08-1.sha256
+sha256  7cec24dbf74fed46d461cc92aae0147069f13f1fa55ec76b317c2d3fa8398570  armebv7-eabihf--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  e469ec0b72464c8722cf51c2ed09fc435815b72a4e82011843ecba75d99c30f7  armebv7-eabihf--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs/armebv7-eabihf--uclibc--stable-2022.08-1.sha256
+sha256  7f95f52d5a56f824269effc28cfbd9c8722de6d612899e888b5651c762a4d800  armebv7-eabihf--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  8eb72d7d9585b7305112d9c2ad3e6156b148f88acdf933381a414cb2c77ff797  armv7m--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs/armv7m--uclibc--stable-2022.08-1.sha256
+sha256  f6ae943fe56fbda046b27015e5b1bab6fc647b29f65d2d1720afc43ab36e876e  armv7m--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  cf4a2e56a0f325db586f80cef6bb252eff70d34981445e1bb77336fd03617df4  m68k-68xxx--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs/m68k-68xxx--uclibc--stable-2022.08-1.sha256
+sha256  885983f2c4273934018ade58b33863b43bf69d05a95342526b4ef4da7bdd7ab0  m68k-68xxx--uclibc--stable-2022.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--bleeding-edge-2021.11-1.sha256
 sha256  0e6743d8679cfe197223e011a2e1e064a213f6032d2f4b0d922b9124fe981d84  m68k-coldfire--uclibc--bleeding-edge-2021.11-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-coldfire/tarballs/m68k-coldfire--uclibc--stable-2021.11-1.sha256
 sha256  27ed1e76826a8824d72ef702d3a770544757a0d297c9992eb623012f1d9b387c  m68k-coldfire--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2021.11-1.sha256
-sha256  1512dde9d646c4c34e5a637d5d6b3be777e199e3f16340ed26e8f0b085cdbdf0  microblazebe--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2021.11-1.sha256
-sha256  c853fe33b9454d3e31951ef99c53b6a6ad09f2458cf79ad4b1680c125a011899  microblazebe--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2021.11-1.sha256
-sha256  65d6486dd8fd8c6a0aad44346d77a8d4f2473230b967ac7fa12e639603e9f007  microblazebe--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2021.11-1.sha256
-sha256  5195575b4bd178dbdc8080e728fa485df13ede62ae684cdda131c1d55e655b11  microblazebe--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  c0d8bf9ce99eada90be299e7d448b9cc578005d26b80205788a639c587071a36  microblazebe--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2021.11-1.sha256
-sha256  2de12511a0a9b8369f769ccd0ecf32939948b95079e0fd57d3ea390ad4c4ff43  microblazebe--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2021.11-1.sha256
-sha256  fa871c5a4fc700f5a7d9e04ddda271d69395066afea98df2de2bba78826b461e  microblazeel--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2021.11-1.sha256
-sha256  f7c64f142f970cd084ffa0e14bc3ac957db921e559eb036cb0f098d2f187328b  microblazeel--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2021.11-1.sha256
-sha256  6978582d587f89fd02d11e89f1b0eee320ad45c42a51ec4fca8fc24b69f65c46  microblazeel--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2021.11-1.sha256
-sha256  4bd56f3fa100b71174888fc4da1f710ed2f56433edc570ba435f2ffdfc3bcc49  microblazeel--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  ee3cf68bb5680b44087aa8e805f74397fb34283ce9ad4d7a303f777e2242b796  microblazeel--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2021.11-1.sha256
-sha256  61a33972e3a282c5334717eef0922a3617c881dd3c28a0aed7dfaf69df8493c8  microblazeel--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2021.11-1.sha256
-sha256  b4b28cc187dbcd6d55e3c00a1b4a08cf68797946c284a48f30be2f659756b2d7  mips32--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2021.11-1.sha256
-sha256  42c6d72edd35249cda113796aa776556f8e8aa285fa8e511d2784a65c4df71d6  mips32--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2021.11-1.sha256
-sha256  7609a3d3601e9aaf8c08f68f1d70539858f17229ca4985842d290e8c35e1b7e3  mips32--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2021.11-1.sha256
-sha256  999faca83c3490662ba5ae855935dd9bde270d11d234294cd6c9cc9ca0bfe17c  mips32--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  58240ac30e5bbec4cb07d92ad4250693cd4f4c9761e6e9602e3cbe0d9077ea4e  mips32--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2021.11-1.sha256
-sha256  e010dd9fca694f658af457e473831ec9a22da7262ed9f460fee1bf30081d4a1a  mips32--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2021.11-1.sha256
-sha256  6167ef7286741551ccb53ffb62e45611fc258e62cd1880418a2cf94051a51e05  mips32el--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2021.11-1.sha256
-sha256  018e3393e1ba50444ae0a05db05a295553b3af224afdf20b52f9d271f1ec91a4  mips32el--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2021.11-1.sha256
-sha256  66f7991de789d4a9ea0206e4f1c7e380521778b771295315af8e98984a1a2b1d  mips32el--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2021.11-1.sha256
-sha256  381ec343ffde3c905addfe27e5ae737b4709142d5949c327f783c26d0acd05d1  mips32el--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  ce6e49762e54ba4a2a6477d14dd6f37b3d6d116905150a80cd4ed2afeaec2633  mips32el--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2021.11-1.sha256
-sha256  18baf32f742acd9c9eab78eca040f265194bb10589d6e8bccb964ccd8a22307a  mips32el--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2021.11-1.sha256
-sha256  5524925d82e1c28cbc272d94e8b9f40603d623875d09989a862fda7b88e5f163  mips32r5el--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2021.11-1.sha256
-sha256  5911d789152f922adbf99d231f3267c0e7aec8942b73a759a44d1410ed6d6493  mips32r5el--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2021.11-1.sha256
-sha256  a599b59ab19aa10d841fbf50f58fdf2a09263a3cdcb01499225f259ef5615be1  mips32r5el--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2021.11-1.sha256
-sha256  5ea65771ca522b77f3cc39f12ef09eda59d9e4743dc7057067f73e86983107c2  mips32r5el--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  84bef9c460f2abf00fa5c18f850a9d9e4fdf9e7d593a1ad5f7b6efe34dfcf037  mips32r5el--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2021.11-1.sha256
-sha256  48b058d3057a611eb3d09b3a206bc38e449f0ea0cd7c8ebf2ee99da9182d0707  mips32r5el--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2021.11-1.sha256
-sha256  161ec4ca6dad1b5d3e79880e30c7f618e24fc1c8dbfcbaec50db02ac73c111af  mips32r6el--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2021.11-1.sha256
-sha256  c50ba26a9fad62180dc4816cfa6451f82ba3ea9c9f069899874c012a5472fa77  mips32r6el--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2021.11-1.sha256
-sha256  81637b0ddfda0ed02bd549fda70efddbcabe6ad943156311d034f3b8a8bce086  mips32r6el--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2021.11-1.sha256
-sha256  d858e9b2a7d826f23cd6432e5c1cad2f4f98447682cdcf7df1430daabfbf49c0  mips32r6el--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  40b78cbfb757b328f5b0a861c6ed1e4f716784bdc2d5e6eba9d2dcad5057002c  mips32r6el--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2021.11-1.sha256
-sha256  e39de078f5f713ab385e5f008e181062265e6a3979904263d283f90304146014  mips32r6el--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2021.11-1.sha256
-sha256  d8543128dc7a115fdee418dfee954d65cb0fb60aae161222fc03177a190bfef1  mips64-n32--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2021.11-1.sha256
-sha256  8d5c891bb2eecccf1f9c51095d266c899dae4dd7e75ef19ff6c66c8e4602919c  mips64-n32--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2021.11-1.sha256
-sha256  7cf2177c2e41651a25676a9d1c96bbe8c254f94db920a1b3a7aa5708b17b1ef1  mips64-n32--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2021.11-1.sha256
-sha256  ac997df9a0f82f0ce60ac904ce75245741fa432c4d85c8e8ae88c35296dfaa99  mips64-n32--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  e5119b684b078fd0c3bf7f7eb09ab31dff666cbbbc3d91118ae912e197ca3852  mips64-n32--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2021.11-1.sha256
-sha256  8f5c1293e789eb04ab3f0bcb415c6ee0ef5ae26cd77354374984752548ac4e2c  mips64-n32--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2021.11-1.sha256
-sha256  d1063f99d389f0065b8db5331597969450f1f813265ddf9205215fec5500997c  mips64el-n32--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2021.11-1.sha256
-sha256  73bbd84905e1fd094f7426f64e01f6058f21409218306b80e94bd2ad0aaa8ad3  mips64el-n32--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2021.11-1.sha256
-sha256  a0a48faf217468e9eb1dd820d16ced1caa8f00706e9f48cb1e64899963f3bcba  mips64el-n32--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2021.11-1.sha256
-sha256  c9c895ea09900ec5c63931af0716cf12f48f7c9826629ac48c4cee4e596af5ee  mips64el-n32--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  5d3573faab6757efd4e2a78e2c1361d3e8e7b821fd385d016fbe71c56d9cc1d2  mips64el-n32--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2021.11-1.sha256
-sha256  cd95e539cbb343c3e57c9f2d7d786ea2b0b58009f1b87a4b48eb9d4bb73a205a  mips64el-n32--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2021.11-1.sha256
-sha256  7b551725f9e6f5eefc56ad67b5daa10812d4895842ec5986eeb93a79455e4762  mips64r6el-n32--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2021.11-1.sha256
-sha256  c575274871f30d019c121947e0f65973475e16baf621f235c54bfc292353d5d0  mips64r6el-n32--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2021.11-1.sha256
-sha256  2b85466873cf847b62b5c66198cc01002890a7a41e5cc9262b4906dcef640ead  mips64r6el-n32--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2021.11-1.sha256
-sha256  4210ca4ded17fdeb7cc7a5cf0d7d4676161d711f70708ca50be62ce397687672  mips64r6el-n32--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  de1a1cff7c02d804aa949b813d92c3d55a33e47602bd538bac6deaa155c93c6d  mips64r6el-n32--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2021.11-1.sha256
-sha256  30d82c7ca41a0df9931a29a46ed881f21a889e9e59baf04e820c6679be87a7fb  mips64r6el-n32--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2021.11-1.sha256
-sha256  5c2dc11062f4817e81a328b12ab30be486b7e68c7c876eb45fffca72332a8804  nios2--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2021.11-1.sha256
-sha256  f6f37f1e551edda0251ece8d906ed720bd8ec45da9d4b3e1d13721bdc9ef2882  nios2--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2021.11-5.sha256
-sha256  03f46c8fdded0002a2a04749bcf86136ec26a841654bf9fdc14575cc510739c6  openrisc--musl--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2021.11-5.sha256
-sha256  409e4a7473125e7de7c8b0e6bc1cb971d53e63ac057e9a19102e4ce1467f442a  openrisc--musl--stable-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2021.11-5.sha256
-sha256  9028d4e526f9e805b021791443805541a179eaf2e47a2af4dfbefb2021e44e9f  openrisc--uclibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2021.11-5.sha256
-sha256  f07d8e465f7e94e55330cfb55bbaf9fc27e4bb7b688271ead60a15aec3dbbf76  openrisc--uclibc--stable-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2021.11-1.sha256
-sha256  53afdbe1e48d0c60d560db8d17042a99288661fe10eebbfcfec4e56a6c2ca594  powerpc-440fp--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2021.11-1.sha256
-sha256  d7fc756c954184cfc4e6118e0e0ac33613916973f6af4aafaa162959662aea96  powerpc-440fp--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2021.11-1.sha256
-sha256  094bad002682608cfc7b095a35c3d495cad793ec0f15a7c035a11eae69d0211e  powerpc-440fp--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2021.11-1.sha256
-sha256  187226d9c427e91bae57058060950cfbd61fb89993edf42386a2c4281ca681ba  powerpc-440fp--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  6c5d3ef56effad9bea791ee814f108929e967eb88a992d21b7d9f9d8d51a048a  powerpc-440fp--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2021.11-1.sha256
-sha256  9a9663674fc2af69b403bfacc5c9d6c0d7ea7c7aa4b93c928bfd79bfb634b828  powerpc-440fp--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2021.11-1.sha256
-sha256  89164ef2be5f5eb5f0de9d8d821d76a1e69c963529bc450a1caf61944665f929  powerpc-e300c3--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2021.11-1.sha256
-sha256  1665004c81e0dfe1c8aa15a691232537c27a4343d80f8c035f83623b65d99ae3  powerpc-e300c3--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2021.11-1.sha256
-sha256  6bbb7d8416708754debc216f122366d7cc25b9372b59e16590f2d942fc727cee  powerpc-e300c3--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2021.11-1.sha256
-sha256  e97a52ed0d2f617f869e055d076c62e0698cdffd17e8b5945d0285f98cb57de2  powerpc-e300c3--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  9b886501833b6785bdbfff90e3d7b191eca4e59fea0c039c772c43825032fb86  powerpc-e300c3--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2021.11-1.sha256
-sha256  31fc2c3b1f2878eb71766c7c0d8b88cdd4c1b2b66e34237917557df818e1c4e0  powerpc-e300c3--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2021.11-1.sha256
-sha256  a2505f7d2968c5324747653da2b367fde7c86c68fcfcb2051c07b27fc0726988  powerpc-e500mc--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2021.11-1.sha256
-sha256  f9a86eee7817042d26aeda8473c23d7da22920ace233e7ad8714cc87409767ca  powerpc-e500mc--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2021.11-1.sha256
-sha256  0f58c7a792de85703c715100dc8fde2575acd4f41523dbcf2ca920611f8e38f3  powerpc-e500mc--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2021.11-1.sha256
-sha256  367219213274c0b291855354f5cf2f59a915cf0d9538db9236d7829423a79c92  powerpc-e500mc--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  0c9616694108bcc879fdbd804b6ec42b17101bddea2a9426f023f625c3def39b  powerpc-e500mc--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2021.11-1.sha256
-sha256  5a6e8489e39ddd73d413926c1d00b7cb214e5a083bdea6bf7fbcd5b4a3b82d47  powerpc-e500mc--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2021.11-1.sha256
-sha256  62c53dd85d6172a1d13833d2303561a6e943d73836faa3be0eb5c8d937ae3bf1  powerpc64-e5500--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2021.11-1.sha256
-sha256  4c8c2884ed5f42155508ffb5c62343312427904f469ce003bfb6b547075cd4aa  powerpc64-e5500--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2021.11-1.sha256
-sha256  62845f66f9b29c001e85b86557b953b2275fd1ecbf681500521b8386d8df1ed6  powerpc64-e6500--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2021.11-1.sha256
-sha256  054d3793f1c8c42ff9310163d4eb45ce09be7654f01221ff28914bc28950f832  powerpc64-e6500--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2021.11-1.sha256
-sha256  21452d9a1e4a5fe980054c0367f00f640ff0f6af4f0443469c340106f902c9c6  powerpc64-e6500--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2021.11-1.sha256
-sha256  015285c7313ffd6c25984db3df003a703868758919f59e8d0b9b45cd494e54cd  powerpc64-e6500--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2021.11-2.sha256
-sha256  19618e538bd170e3ed458a1ff9593ca169078eb9a990cbab0af635aed622429e  powerpc64-power8--glibc--bleeding-edge-2021.11-2.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2021.11-1.sha256
-sha256  7b35b694e79b4829e5f2fdb2bd1570035619f665be2a73d0568e4c1f4b6ce56d  powerpc64-power8--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2021.11-2.sha256
-sha256  6f5a6674bbe028bcf2cb6820a57b53e06b06ab4b7359397b77fada3ef06635b5  powerpc64-power8--musl--bleeding-edge-2021.11-2.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2021.11-1.sha256
-sha256  9dff16b6af51f0492093f08e4d7571b787afa37e059ea1105ded18a7fa7baa88  powerpc64-power8--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2021.11-2.sha256
-sha256  624b2bb3763e3bd085b69c39cb9a1574d60dbb29780469c2b171bba564c3d1d3  powerpc64le-power8--glibc--bleeding-edge-2021.11-2.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2021.11-1.sha256
-sha256  04473768185c3a1848f4f323380dc7caffa13d1e1bcb49317cebf090917fee2a  powerpc64le-power8--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2021.11-2.sha256
-sha256  e81d0b3c9128cd0069dc8bcfbf512e395175e4c4f0a9ed500a3d7b15a76f8e65  powerpc64le-power8--musl--bleeding-edge-2021.11-2.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2021.11-1.sha256
-sha256  09dafac6313ad49731de6d93ef2f1c2806a6a78127d0441adcee76a7a256f4e3  powerpc64le-power8--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2021.11-1.sha256
-sha256  63defd144fdb1d40712316e2c3acd37275d6407b52d70efcd36e7f7129b4a0d0  riscv32-ilp32d--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2021.11-1.sha256
-sha256  13984509df102d452f64fbe576e9240920bc677838c2380e57fad8236fca70bc  riscv64-lp64d--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2021.11-1.sha256
-sha256  70fe7d9fc74220b08b2ae0d3527641f4b938a1e4eb6bb305b2ac68fa76f2d6a4  riscv64-lp64d--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2021.11-1.sha256
-sha256  0ba18be42bc1aac9992384c86efeb83cb55215eab565f71cef340f61a1fec420  riscv64-lp64d--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2021.11-1.sha256
-sha256  42ca8024547e51e6126e3c9e711d80815aa4b2997900dfc8af4b9514105e8b78  riscv64-lp64d--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  02dd9fe4a024f84c7f73b7155640066017c7d18dd90c4da6efe6f0e66d24f75c  riscv64-lp64d--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2021.11-1.sha256
-sha256  01f061e1b3d106d25614ae5bd64df3a3588bc960caa3bbad14b50f718a558f41  riscv64-lp64d--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2021.11-1.sha256
-sha256  d8e657ba00929007e938c7fc398fb5aee8abeceea3ad1cd304c05e7f47d9ef30  s390x-z13--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2021.11-1.sha256
-sha256  04d8c28bc1af09a949cfe76991379fef4b0876448192625a22c028c7daf92e3f  s390x-z13--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2021.11-1.sha256
-sha256  64c14617fb95b1eeb50564d1e0ccbf73fa73e5e58aea6b192549fc7127e4bd5c  sh-sh4--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2021.11-1.sha256
-sha256  702125cce2aaee4025cc4eb07614fe51a4e56498e8d0b2b8a5863d31840829e0  sh-sh4--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2021.11-1.sha256
-sha256  37fefd46ded9067cb836f067073c4df501265e86d887ff91015087747a5613d4  sh-sh4--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2021.11-1.sha256
-sha256  7f77aefe39c1dc9bfe1fe637c7c957fba19898d0b04db4ba7a0b76bb97ed72e9  sh-sh4--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  3285ac52a681a951d7d080d6645f3d02451de644582928d71469813e95bd928f  sh-sh4--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2021.11-1.sha256
-sha256  841c400d303021311895bf61fa7d16292ef19cf021ea06c091a424f43294f6a5  sh-sh4--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2021.11-1.sha256
-sha256  b1ebde33ada33d1006046c589891d96af902eefcea1d9e103ae738c9fe26c36f  sh-sh4aeb--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2021.11-1.sha256
-sha256  3afebc93a72af85a31c6d096b5939c60bb87939b051c6cddc52e1e540714267a  sh-sh4aeb--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2021.11-1.sha256
-sha256  c9216bd579ac3f0fa7d0efb9e1892f5d34eba10ee183d03fc87ca17c4b8eb6d4  sh-sh4aeb--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2021.11-1.sha256
-sha256  1e58aaab9d77019df71777a3c9a2457f691355a6a7aed6b9897921e38571117a  sh-sh4aeb--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2021.11-1.sha256
-sha256  0b83bb7f3ce7b67a5c359c95c695398054d13903259014147d4c99e2884e1377  sparc64--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2021.11-1.sha256
-sha256  0ef307f6c91733ee82ce65801768013f7e6220b605f4e152158cb55b4f983582  sparc64--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2021.11-3.sha256
-sha256  3c85420becb7caa84a9a229483f3f2d7158eb66817acdfa5d5700c3a05436cba  sparcv8--uclibc--bleeding-edge-2021.11-3.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2021.11-1.sha256
-sha256  f6d35e33338b26e71403b4c6d3944ab561f2a6e9b801ab33fbb401b4722044dd  sparcv8--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2021.11-5.sha256
-sha256  024fd8edc91b9bfd643f8cf94e3f3ff2a6457aea654d10ef3516db8c3d94d5f5  x86-64--glibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2021.11-5.sha256
-sha256  6fe812add925493ea0841365f1fb7ca17fd9224bab61a731063f7f12f3a621b0  x86-64--glibc--stable-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2021.11-5.sha256
-sha256  468e6b73146595923fe87980a30adb54cd78f4c1e2f228e1a2c9bb705ea4243d  x86-64--musl--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2021.11-5.sha256
-sha256  2943617f6537ca195a66fb9db4a801a5dd1c108741c400d530d558d06908dd75  x86-64--musl--stable-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2021.11-5.sha256
-sha256  4aa8b8e2806d6fc87ba64ccec0a59b8a2fb5d157cda006d893e3f2264b7f0f10  x86-64--uclibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2021.11-5.sha256
-sha256  e68fd1b23f4a5c5132f2122e4012c17eb24e5179b2ff45bb793a27ac30dd454f  x86-64--uclibc--stable-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2021.11-5.sha256
-sha256  af20cf98ce937f298e0958e16793bb4c7b08236bc69ab11574a4266cccc3823d  x86-64-v2--glibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2021.11-5.sha256
-sha256  17add21a0337d2f7d0d79d1f21db88098c3474920d71f902be46e8995eb86d35  x86-64-v2--musl--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2021.11-5.sha256
-sha256  b3ef49012af9fc9c2c8a44b0a20722be69b518cec5db06e48480291fc28aefe0  x86-64-v2--uclibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2021.11-5.sha256
-sha256  244d4afab02b9c54c76385657d26798515331d7d4fa90928315366f31b9cc39e  x86-64-v3--glibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2021.11-5.sha256
-sha256  551cff1b6425e2a6ced7b7ad032fba49b43ed095faae38d1842260ac0b5d6dbf  x86-64-v3--musl--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2021.11-5.sha256
-sha256  30188f50adef711b55ac1d5be7218e0d6ee4200ddb8660e4d4971a9cefe22f91  x86-64-v3--uclibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2021.11-5.sha256
-sha256  0cd2de7c4103aa8cf47b72dc71146eb3bf7742a18d56c93128340ab3f4175804  x86-64-v4--glibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2021.11-5.sha256
-sha256  e159da16459e0f0d06a9a7467d5121202ab95e2fa6bf8abffdc0008c72fe9b07  x86-64-v4--musl--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2021.11-5.sha256
-sha256  984f011d170d3e46322ae4a110c86ebf995598d877f410201b3fb3d86e25dac2  x86-64-v4--uclibc--bleeding-edge-2021.11-5.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2021.11-1.sha256
-sha256  a3dbfcd3347a72ca344ae77882f929615776ea9b1b058eeea0a0915e7db89b69  x86-64-core-i7--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2021.11-1.sha256
-sha256  3d443bb0bc6d16982824952a02dcb8b7d10c258b4e0debb47708fb9a02573951  x86-64-core-i7--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2021.11-1.sha256
-sha256  c724f0a8338c57e65479844eeb1725ffce2157a195067601e8893c0f781d2a86  x86-64-core-i7--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2021.11-1.sha256
-sha256  008aa485ad85deda4af41f6ab162ee33be96c2f479e93a03dd9ee360fbf461b1  x86-64-core-i7--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  99ac2c1fb6bd819222578d4d3c2d3043d3f08f48a988fe7a56ecb2dc44950ebb  x86-64-core-i7--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2021.11-1.sha256
-sha256  f7224ebf557f96b3854c4760f0d561f33f02e71586e6c5b958fdb686ecf5a058  x86-64-core-i7--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2021.11-1.sha256
-sha256  51a7aa03b16fca52a6ac88c7272a727a56a120fb1a03edaff7da741471dffa63  x86-core2--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2021.11-1.sha256
-sha256  6afb13f10694756f2c7b69e0e5fdd416d3c446d2d630ed9a707797613c38fb15  x86-core2--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2021.11-1.sha256
-sha256  b779acc67eff7ae349a1ecb6d092576131537ce4d92530447d6483e3b7320186  x86-core2--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2021.11-1.sha256
-sha256  9f79cd4443386b9611d917506bcb6fd9d844e7934905a7368827441644ae7821  x86-core2--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  1a3803d19a6d65a943dab7c4cfb29f37e1c96b1155bdd6c04e5fc609c135b970  x86-core2--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2021.11-1.sha256
-sha256  235be5851ccdbf579163a0d57b4caba48c63c808f7a08e6476f56c3537636520  x86-core2--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2021.11-1.sha256
-sha256  bb21d6fdb83ef1603346c27572a0622a890633d4fc1ab28bf0aa387a44c8dfee  x86-i686--glibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2021.11-1.sha256
-sha256  9deb1c61a3196114ba1996c0cbe4c4135af9e82f1a0f9111084c86badee3ff30  x86-i686--glibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2021.11-1.sha256
-sha256  313e4bbd8a19fc927b2d9d059cfacdb89cb41213d34158cac2ba00b071468273  x86-i686--musl--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2021.11-1.sha256
-sha256  fa6cd3e2aa25287e03070eba526983a902d8622ad148b57027acf85d690eaf27  x86-i686--musl--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  4ee09d8c4524e6e6f19db07ed49f8e43a60e806bc57134f9ac2477d41c98340e  x86-i686--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2021.11-1.sha256
-sha256  d15cfe391474ea19e6a468c011955027581c6a16953380baf3c5718ad42fc45d  x86-i686--uclibc--stable-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2021.11-1.sha256
-sha256  469450c734051b9dfb7021532a5ec6fb35b3cf79a95613836e654c3e666b4150  xtensa-lx60--uclibc--bleeding-edge-2021.11-1.tar.bz2
-# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2021.11-1.sha256
-sha256  2fd9dc2d1ec8a167ae3c353682bc4d166f25a7db1c1b889e3058bc644bd3f92c  xtensa-lx60--uclibc--stable-2021.11-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--bleeding-edge-2022.08-1.sha256
+sha256  e0af9e5a647b432c22693c6a7e7114ecd5475007b2b17d10075d61509246d81d  microblazebe--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--glibc--stable-2022.08-1.sha256
+sha256  1b73e8ef541ab0a43314ec8354368adfb333657f3ae3e2ef4cb966721db2d068  microblazebe--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--bleeding-edge-2022.08-1.sha256
+sha256  8a2570a5f490249a7a02afef62c00140e2eb3fa2cdf41e5897f484e41f5c55a1  microblazebe--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--musl--stable-2022.08-1.sha256
+sha256  90c26fedc85eba703e37e85036e284bb73475bb07d004ceedc27a4e64110ecad  microblazebe--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  44b04fb51396e84b51f395bf1f08176b759cc8a85080980c45653ff0bd8b3602  microblazebe--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs/microblazebe--uclibc--stable-2022.08-1.sha256
+sha256  23189d4f0ec2a1de15d7e30e7d12327fe7c620b395b6e402b6be42c3ad148656  microblazebe--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--bleeding-edge-2022.08-1.sha256
+sha256  2371b597fad7ec6092e1417c21343cd78f59c0b68c189d77a306bfcebd1dda31  microblazeel--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--glibc--stable-2022.08-1.sha256
+sha256  9507f13355a37ab0401c3225251d9760a0e40475243744b2e9bd5f11113ca8a0  microblazeel--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--bleeding-edge-2022.08-1.sha256
+sha256  b67eef1613e960df351a4600c845d6ac24c60a3b2362f195c4b69bf21f7874e0  microblazeel--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--musl--stable-2022.08-1.sha256
+sha256  44b767649a3d8a9546dd27c1b53aea8a3f106e99d9ae650e1746551c78f7cf8c  microblazeel--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  08e0a44f0beb4675745d25a1f98afa31a672caec5150da73a8b23038e931426e  microblazeel--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs/microblazeel--uclibc--stable-2022.08-1.sha256
+sha256  70883813924f9a1756e08258d8c41e06bb6d4e9571fdb020b2097dd4823ffb9f  microblazeel--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--bleeding-edge-2022.08-1.sha256
+sha256  69f8608d78e295bc9c78a57f47d3f2aa1d74a8ee69307e1f112588dc08c29adc  mips32--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--glibc--stable-2022.08-1.sha256
+sha256  27fdea806e3d02441ed034f500843b9137b34ec144cab9d2aeb991644f32af5b  mips32--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--bleeding-edge-2022.08-1.sha256
+sha256  190023be69fdedbcc758184cbd02e0e64df99c5d1d2f9330c239c97cdca4928e  mips32--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--musl--stable-2022.08-1.sha256
+sha256  5e971b1420f29c5c694a93591f7eda5048d7dc792bff6d2117b6f2866970fd5a  mips32--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  c937259732031ca4c640257774e80b0d6b42cc3e90e6677d6b3a014b0e3fd155  mips32--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs/mips32--uclibc--stable-2022.08-1.sha256
+sha256  e670cf475c47dabac6e8fb4ffc0df5bb9c4ffeb55aeff55099ffd0b969e919ce  mips32--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--bleeding-edge-2022.08-1.sha256
+sha256  0984a478a526e943e22fbe979bd083acf34bcd99e1366c8aca11d4ed43af8b66  mips32el--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--glibc--stable-2022.08-1.sha256
+sha256  8e5d9b8ba0b4f7add2001143ffd92718c037c27aa2cef64d79aa577e6b0bf2e1  mips32el--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2022.08-1.sha256
+sha256  89b6b64b9839c506e38e5c57d01de0a15018a6d82c41cc3b001708725032ecba  mips32el--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--stable-2022.08-1.sha256
+sha256  ca6ddc1ec4b053116f854767c04c49ebd3442e15ad6529eaeafa4fd0272021ff  mips32el--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  dd0d1144113a79aa32457d008302e11e354d949a63718f0984a5dbe185099275  mips32el--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--uclibc--stable-2022.08-1.sha256
+sha256  f20f373afdec0e36afefd0b1eec7dfb9609e110ef19feb40df7e37196a23ccbf  mips32el--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--bleeding-edge-2022.08-1.sha256
+sha256  dc6cee7db89c2263c8de0a8c902dabfed02186ccb9b6f643bf2b3fcaa6f694d3  mips32r5el--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--glibc--stable-2022.08-1.sha256
+sha256  d7e14faebf10897799426c8579b9e01c3479a290bb6b30ef37a2b4e1fbe4e440  mips32r5el--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--bleeding-edge-2022.08-1.sha256
+sha256  d6aa828f18fddb4a4bdb78720ac1ecca76f0a0941d2fc3854a75a10ffe5069f3  mips32r5el--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--musl--stable-2022.08-1.sha256
+sha256  c29003698f82de6a6c5a3b4b4029e1a6f563d4417296941d84882f9e3cf4c573  mips32r5el--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  38fbc1b77e010723ef939ee52e6fc42adc0042139fe61f018c4b67767966e36f  mips32r5el--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs/mips32r5el--uclibc--stable-2022.08-1.sha256
+sha256  f04408f2903b0488392cc097062d0295d6d2d02000f09edfe63a33237a09695c  mips32r5el--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--bleeding-edge-2022.08-1.sha256
+sha256  be3eb28eff19cfe7471e92716cfce112eddb13a27322f7abd0987b3864b33776  mips32r6el--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--glibc--stable-2022.08-1.sha256
+sha256  4c89db5c2548d1fda32c61f86399d5c53749becfb260e22776866b3b0343deed  mips32r6el--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--bleeding-edge-2022.08-1.sha256
+sha256  4f3312d85183c8ac83e793ec4f8788053215381edca1904b1286bc0eca0dab36  mips32r6el--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--musl--stable-2022.08-1.sha256
+sha256  46b7d074f395cf1264109b78053c944b54c580812999b017fee60ecf196efda6  mips32r6el--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  5adc9fffcca0e6ea08edccfc72ff5330ffd7949c0f236ff198f93afba29d308e  mips32r6el--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs/mips32r6el--uclibc--stable-2022.08-1.sha256
+sha256  03d90d509f745f29ad04ebc9ef29e38b8d015c25c5bb0d5e0ddd214a1d28b26d  mips32r6el--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--bleeding-edge-2022.08-1.sha256
+sha256  764aef21ef143613595595ed0ff81491636b2381b77ef082dbb4a2e2f17542a8  mips64-n32--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--glibc--stable-2022.08-1.sha256
+sha256  4bc1a70194be6d87502f403ab59d95bfeacbdc3903f8b45464734f7447301cd3  mips64-n32--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--bleeding-edge-2022.08-1.sha256
+sha256  f50358647c98c6b4eb373e732187e3b405402487b5e55d2ef63481d4a4ed017b  mips64-n32--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--musl--stable-2022.08-1.sha256
+sha256  fa77ef0623b92baf20405cee90d52c6d91e2daddfed0a89a28b781fd36a4279c  mips64-n32--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  f03f7070063921143cc01d9591b10abfa185617c71008adc2c7e059202d42c43  mips64-n32--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs/mips64-n32--uclibc--stable-2022.08-1.sha256
+sha256  892f2e5912c48901e2c40df7eac1109d7fd02c6b2aa9b6c13d8659dae50e781f  mips64-n32--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--bleeding-edge-2022.08-1.sha256
+sha256  5c9e79402471f35401ac8737fdee39156f1db1e72f5c9c4c2b4fea988fbc0c72  mips64el-n32--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--glibc--stable-2022.08-1.sha256
+sha256  59e2fe9b268fdbd8b4bcba14574c1293171675249a0e6913e1525adee66a7b36  mips64el-n32--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--bleeding-edge-2022.08-1.sha256
+sha256  c6c76749c40d41a020bf0943bb5f3d67ad0a9a9994a4883c73c7302944f87814  mips64el-n32--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--musl--stable-2022.08-1.sha256
+sha256  6e0cd1b77c9333807fa575aff24a7274817840442f9cd32c653a70a07d3b5b55  mips64el-n32--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  b9c573bfbda5ba60bb80652879664cb0d515b179c9d06ca1321f506d26f7a7af  mips64el-n32--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs/mips64el-n32--uclibc--stable-2022.08-1.sha256
+sha256  850817e5d1f99c11dae52abdd35518b855382587ffd4345c44131d26b04d6dcd  mips64el-n32--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--bleeding-edge-2022.08-1.sha256
+sha256  a665beeacd598da7de8f4ae44b938fb374d4a301daeae99de14e67d3fd5696c0  mips64r6el-n32--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--glibc--stable-2022.08-1.sha256
+sha256  8a0f0a4fc4e1a09f20ec45005dcf6f074be416fa26838eb19831a47f00da6391  mips64r6el-n32--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--bleeding-edge-2022.08-1.sha256
+sha256  ed9b42fb60074f31664626796b1a47f9ec4b46a25dee78904dbda93613b50bae  mips64r6el-n32--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--musl--stable-2022.08-1.sha256
+sha256  03e4d97084f8f5cc7bb1452a862e1e3856b2a63b903779be0cda0577195603c0  mips64r6el-n32--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  e5aeb7b0bd9bbc5c283eeb28545f35f3fcec43e72ed9c7d0e8fa9fd112ec20eb  mips64r6el-n32--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs/mips64r6el-n32--uclibc--stable-2022.08-1.sha256
+sha256  7d523cea26e84487860de83556c10d790876c98f27d9e7987c1b1ecdcc4a43e7  mips64r6el-n32--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2022.08-1.sha256
+sha256  bbb95de0b45d06429b9212682df0392f1c8255aaae9febeef586ed556c0cb537  nios2--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--stable-2022.08-1.sha256
+sha256  bcc84bf3a37c1d19e4de21d0eee6848d9917b5cc6cba7e734ce2fffa4aefc2bd  nios2--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--bleeding-edge-2022.08-1.sha256
+sha256  69461f231e4d994a6b0fa6dc2e71610037f277d7bccb7b43acef43a3245bff7f  openrisc--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--glibc--stable-2022.08-1.sha256
+sha256  e8122c2b52ed2ebf7b65384f9fe0782b95cb541702341ea73046165acc80cf4b  openrisc--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--bleeding-edge-2022.08-1.sha256
+sha256  562582da8b5a386624a7c18cbe0511f8f4bed206f2de7009e66b75214f56dd32  openrisc--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--musl--stable-2022.08-1.sha256
+sha256  cf2b57067d9621f0eb74622412e8ca3eaa85e98a2044e5974cfc573eeb6cc8f0  openrisc--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  b9125cb9d238100a4ab88795f55d5e92e5cd43e302d7f306dbad0e1900976892  openrisc--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2022.08-1.sha256
+sha256  cdb6df4a341d8d30b005f8175fb79fdbb3fff08b363d83d2bf39bf216f22410f  openrisc--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2022.08-1.sha256
+sha256  d21b08f39f6f6b038fb37e3c71130c8db86c76a060b4b9980efd083bcb9c2b21  powerpc-440fp--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2022.08-1.sha256
+sha256  5d891f8fae87fcd0736e3250864bec3199a03bbce66c21a3b145e34de80c4c7a  powerpc-440fp--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2022.08-1.sha256
+sha256  322acf83e10c951ac8fa1b7826d4d0ae041c1a9ad2c1df45ea9cadf5cbb76922  powerpc-440fp--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2022.08-1.sha256
+sha256  60298c1c675467ccfef3d7021c7d16beff59c4bc10ff86b07b07ed9bc9342903  powerpc-440fp--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  dd3a795f3079d8f559bd81c5ea35b20355c0b2188a5d75c493f7a75da83fde6d  powerpc-440fp--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2022.08-1.sha256
+sha256  61be67b9dc19e764791190d0cae4b23a620ccf9b1715e3e4700983a15ebdca49  powerpc-440fp--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2022.08-1.sha256
+sha256  2b4feb8fe946c4571639590ad7972fccd860b153aa192826861f6a40ba46531f  powerpc-e300c3--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2022.08-1.sha256
+sha256  f4fcbefcf0748198b0fed7b27a7f45023067b8550d1b29857e3de8b3e394d44e  powerpc-e300c3--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2022.08-1.sha256
+sha256  6e8e152d4bc58891c9b93b98e2d4a15ab26f9ceee00725092c0f9c2aff4ed503  powerpc-e300c3--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2022.08-1.sha256
+sha256  0c2418120d9b32faddb59570e18d700c5d17396e6287a368263b59eea1895f08  powerpc-e300c3--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  07a8e609ee1ab8b5aa4c8a2fa07a6c7a2ba47f387ef180e33f8b3972a976a138  powerpc-e300c3--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2022.08-1.sha256
+sha256  a755ab1c79099e089aa238ff5dc012fea756076fb60f39fbf53d151985825eb1  powerpc-e300c3--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2022.08-1.sha256
+sha256  e932a8f76e00140b246ea3a925f6eafc4921cb974b527336ec737be9f1b7ff31  powerpc-e500mc--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2022.08-1.sha256
+sha256  fce8332a339732350350d06340003d450a7ba315cf8c03655be5377b953a843e  powerpc-e500mc--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--bleeding-edge-2022.08-1.sha256
+sha256  33600548051fae6e44fbf34fcf2116ab0c8dc8db79e51d2ed8ffe23baac04447  powerpc-e500mc--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--musl--stable-2022.08-1.sha256
+sha256  1c2fea3db1c5fb058b56739b2e716f8ce8e1e4a605e5a46c45abfcb1a36103ea  powerpc-e500mc--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  6d622a86574d29b1e84aadad1a1a58737c9b0068fcb8093739684ceea949b089  powerpc-e500mc--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--uclibc--stable-2022.08-1.sha256
+sha256  cd3c1a34d7825b268cf1a2aaa906aabcb6ea9a1cb3764efe5efad7d6d56567a4  powerpc-e500mc--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--bleeding-edge-2022.08-1.sha256
+sha256  d05d7d247d53b552fa3656384a4c4252a09aa3b58004854f315f2e576c833fe9  powerpc64-e5500--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2022.08-1.sha256
+sha256  d754ce34ea8d028abed71672c92530a4d1839e4108323f2ff7d6e71d60e4f23a  powerpc64-e5500--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2022.08-1.sha256
+sha256  f601c50d1d1eb6fc9d8162270c5fc631f86cc622d7d732100d2764a31a3a2c41  powerpc64-e6500--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2022.08-1.sha256
+sha256  3327d4b9c27a51efa6f5128d2f582c8685df1a5a095a7fd316ab78573d9d13ec  powerpc64-e6500--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2022.08-1.sha256
+sha256  ee6f75dfde53782763a9d39f8293f93b44e2e1685db967530c3b6011771337e3  powerpc64-e6500--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2022.08-1.sha256
+sha256  66e358b0a46593f32aab0aa942f327787f3d99a55c3ff063001cabcc04deb85c  powerpc64-e6500--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2022.08-1.sha256
+sha256  0cf79c59189f1c9e5b058986b5535b845c53d787a9879923b20ccd4b6561cc3c  powerpc64-power8--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2022.08-1.sha256
+sha256  ece83b6b7ad026eb769d555264dc7565cb7c04f9742355a171882a1817e98b73  powerpc64-power8--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--bleeding-edge-2022.08-1.sha256
+sha256  3eade3adc05e3b09f7b65d31e724d37ceac7c81d78afecf3394a7ad0c84972b5  powerpc64-power8--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--musl--stable-2022.08-1.sha256
+sha256  5196955f9f4b46d12d8e0211ae64902a73bc491cfced31e2d85865bda5ed3443  powerpc64-power8--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--bleeding-edge-2022.08-1.sha256
+sha256  9882709003776bf8da785a30bbd1b75b64d9752ef70bface22ff6434be136682  powerpc64le-power8--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--glibc--stable-2022.08-1.sha256
+sha256  37e404425c3d8176b3a19b5a2ae8b57460871f9aec4e6491ded638f5115f5081  powerpc64le-power8--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--bleeding-edge-2022.08-1.sha256
+sha256  9eb4ca911853d259228229490af9ae6eaf30d79b8d41a29f807cc27979cd9104  powerpc64le-power8--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs/powerpc64le-power8--musl--stable-2022.08-1.sha256
+sha256  c1bce8d56c1b667a382eccc4a061d35add21a68d7479e9c62f8c35271d8c5f32  powerpc64le-power8--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs/riscv32-ilp32d--glibc--bleeding-edge-2022.08-1.sha256
+sha256  47a4b8365d5d772de4b4b1100a221421c5a3cb8ff09d366d4578df2c0cdf23bb  riscv32-ilp32d--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2022.08-1.sha256
+sha256  a5ceafc2d1dbe2598ed9c8018f8f7108b7d5cb4847303842e924976a4cfe14be  riscv64-lp64d--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--stable-2022.08-1.sha256
+sha256  556c860783c69f21d77be8b2856e7dd24f66b115775bb5ef6c8de5f4a6b1b861  riscv64-lp64d--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--bleeding-edge-2022.08-1.sha256
+sha256  3e8d0ac53b9188d46630fe8ade2794e05ae9a2636a45c60b89b62ac1a3f6e6c5  riscv64-lp64d--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--musl--stable-2022.08-1.sha256
+sha256  fd2d6b2ac2b2e02caabd9fa43b506dcc87eb1afbe475999180891a5e0208c436  riscv64-lp64d--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  8469a9c7ec50a401fc6466e81dc0d7032648c4e7f1b602afcf5ddab2ffabaac4  riscv64-lp64d--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--uclibc--stable-2022.08-1.sha256
+sha256  002e98d438519f62a2b2de42acac226051b1887a98523f02d54322275c3ffd25  riscv64-lp64d--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2022.08-1.sha256
+sha256  295e281935dd22433d1a819a7a010356fdf6e19cea27631fdc884d3251c344a0  s390x-z13--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--stable-2022.08-1.sha256
+sha256  965c7ab533e7e4812fc515badc595f0e4f79ab7986eef992889f6a1a225d4c19  s390x-z13--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--bleeding-edge-2022.08-1.sha256
+sha256  413703c54af9fdceb955a311f5db4f3fa34b4170dc5f12b99da3c464915bcbfa  sh-sh4--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--glibc--stable-2022.08-1.sha256
+sha256  5084c4545a60bdec153bcef7dd52a824c3937c85686b223a6e92667d71850963  sh-sh4--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--bleeding-edge-2022.08-1.sha256
+sha256  243079028e9155c7dfcb1c67ae9bd42bfcb9d5a23f9e9078c9ca53613c5d607b  sh-sh4--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--musl--stable-2022.08-1.sha256
+sha256  46ad264d4074ca4ac0ab4acd244145e4820aef315a14bdd9a6e54e888c04b630  sh-sh4--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  7c7a009e0335396839ab1be8b7817084414792ef04aa25df4c178c9d2ec0aa13  sh-sh4--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs/sh-sh4--uclibc--stable-2022.08-1.sha256
+sha256  1b1c22ebf92664df828151eaec3c7fe9a6bb1c48fa177c85a62418ec627b2756  sh-sh4--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--bleeding-edge-2022.08-1.sha256
+sha256  5765af1f25bcc34e31561b7cf955dabae5a3fb1650148a60915cbb4ccd87e49a  sh-sh4aeb--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--glibc--stable-2022.08-1.sha256
+sha256  47f9694a263af6e943acf59d8da9af34b6f9a562d67883f4298b4cc4469fdcff  sh-sh4aeb--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--bleeding-edge-2022.08-1.sha256
+sha256  fa519ec4e29701de84af63943c51c0f740620ce3577ae689d89c2a578ed425de  sh-sh4aeb--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs/sh-sh4aeb--musl--stable-2022.08-1.sha256
+sha256  f3ca7d35bd5ce1b99dd1395b8f2a7c162b23a60eed6ae938cfa2fbd20d25a470  sh-sh4aeb--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--bleeding-edge-2022.08-1.sha256
+sha256  bb08735ffbb2c0e60bd5b1fa1d65fe44f7781a4c57872ede0797a9a495ed575e  sparc64--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs/sparc64--glibc--stable-2022.08-1.sha256
+sha256  9c14934230a73f4ca99d4452dd0f24a033e3843fe2be28cb723f0d66635d4a4f  sparc64--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--bleeding-edge-2022.08-2.sha256
+sha256  ccd4110fa574d2323f038394c0603245384002fbe906204db36fe200c9c8f886  sparcv8--uclibc--bleeding-edge-2022.08-2.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs/sparcv8--uclibc--stable-2022.08-1.sha256
+sha256  da3b9f0a936401cbd3cc305b86d3611531391354cc0226a0eeb3ce4ddcc7b7dc  sparcv8--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--bleeding-edge-2022.08-1.sha256
+sha256  9a09ac03001ef2a6cab391cc658fc2a32730b6a8f25614e97a91b9a79537fe33  x86-64--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--glibc--stable-2022.08-1.sha256
+sha256  861c1e8ad0a66e4c28e7a1f8319d68080ab0ff8d16a765e65540f1957203a190  x86-64--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--bleeding-edge-2022.08-1.sha256
+sha256  18149a2d69d1cd392536a97f53d6a02b90887c7e8b86db871b80396d46b9142d  x86-64--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--musl--stable-2022.08-1.sha256
+sha256  6a47708f72d2c01721e31907ceb524b7980764d3546b9aca4a6804f6d8db2676  x86-64--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  ef40c02af986bb3e4d14c76a3bc60285f5249d0676fb01400081f87b2414438b  x86-64--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs/x86-64--uclibc--stable-2022.08-1.sha256
+sha256  d4fbec618e17a70521c0b6339c9889f298b9806ee342e29ffe05ac76ee87c83c  x86-64--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--bleeding-edge-2022.08-1.sha256
+sha256  7ac996b2ca1acdcdaddce38a3fd19bc30b864f6b73f8e6d0537243e912b5d36f  x86-64-v2--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--glibc--stable-2022.08-1.sha256
+sha256  4313a04996173bd79935ffaec48b97ba7c32332880774ec61b40ab76804b8fbb  x86-64-v2--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--bleeding-edge-2022.08-1.sha256
+sha256  83c57b50ba00555c4e2d7fdfa700b69032f06bfe743b5022a69036b0f18fbfdf  x86-64-v2--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--musl--stable-2022.08-1.sha256
+sha256  a76ebe570be5e74875d8f0b82aba3ad055679e734af5c6bdac036ef5f7c7b6fd  x86-64-v2--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  ab395da0c3d64a8a7121f640d16c8e79d4c187dbd866b42e4456f8c26eeadf4a  x86-64-v2--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs/x86-64-v2--uclibc--stable-2022.08-1.sha256
+sha256  f64742f3c5cfdde7e068c3694e86d9df1b5a5ad8e4b0c9542c1e7de55951459a  x86-64-v2--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--bleeding-edge-2022.08-1.sha256
+sha256  40196066dcd7b6d52b956de823f7840fcae76207030d885bb4d07b692505f71f  x86-64-v3--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--glibc--stable-2022.08-1.sha256
+sha256  97e43a5e7059a6262278795a102c6b0a2895731ba6aba8125ccd8a354cc68216  x86-64-v3--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--bleeding-edge-2022.08-1.sha256
+sha256  6a26d96022edde94de3b2ec9b414b2865cb99430b0eef4b3f263b0f0713875ac  x86-64-v3--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--musl--stable-2022.08-1.sha256
+sha256  082b698fdf995806a4b94c30c7a3c90755747a5cbd73e5f89423052063c7b562  x86-64-v3--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  1102391f5c03c335f7a27d2bf67818f67b675768c9e4fb1beb826624cc468033  x86-64-v3--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs/x86-64-v3--uclibc--stable-2022.08-1.sha256
+sha256  c9f0fb4ea32d5d878ef8b719b750904ad4779a01c54a186a05f0e15f5257a653  x86-64-v3--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--bleeding-edge-2022.08-1.sha256
+sha256  95d25e92e4b4d1b93da6667e61615457d2086efa2ea9f1fbd73404bcad1f3456  x86-64-v4--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--glibc--stable-2022.08-1.sha256
+sha256  93b31a24c7ec8b1d4fc8343edf506b78e2b15d017e7436bf28be4e888af183a1  x86-64-v4--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--bleeding-edge-2022.08-1.sha256
+sha256  e67339ac587bc8815a2ee7fa2e74240ffacae75c26a785d4f3404766c550e15a  x86-64-v4--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--musl--stable-2022.08-1.sha256
+sha256  d20b1866f77a9ea4789404610859ea08e76803bbfca3d92627c9a7ae036eb13f  x86-64-v4--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  4c0ae459a70134fe61b0cb32bfb94e61504efd3e8860cc265dfb3043ec140929  x86-64-v4--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs/x86-64-v4--uclibc--stable-2022.08-1.sha256
+sha256  bec5542fe02be69e4ef8d0722d3c920b64a06206adc580434f2d0088eaa9effa  x86-64-v4--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--bleeding-edge-2022.08-1.sha256
+sha256  995dcaf678cf37b193be86ce6733c0402129fc22eee6a45f76acb86deb8c481d  x86-64-core-i7--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--glibc--stable-2022.08-1.sha256
+sha256  7a31f72e6dc378eac8a97b0915b3619ba95c79f73046d052539c44f91bee9a02  x86-64-core-i7--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--bleeding-edge-2022.08-1.sha256
+sha256  2ff43343f39f99a238502293b6ce20b0324f850c1b606ad4772d7d54f2b73206  x86-64-core-i7--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--musl--stable-2022.08-1.sha256
+sha256  fbfdf31724e24a19af4f83e3a9bc766f8fc455f4c4e912401aec1e81f2e71b4c  x86-64-core-i7--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  86e9c65eebf909f7deae7d75ef3af4fc6bcee51ef21c92f0ed6fa1ae7206ae50  x86-64-core-i7--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs/x86-64-core-i7--uclibc--stable-2022.08-1.sha256
+sha256  cc06ac611d1930a4a87016adfabade8b3bba5ce6ed743a60059fee9d70634de5  x86-64-core-i7--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--bleeding-edge-2022.08-1.sha256
+sha256  3c828987dcd4be469dce355d44e0c42166ab9d939a99b8f1d1463b769f6ecbea  x86-core2--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--glibc--stable-2022.08-1.sha256
+sha256  5bff24ea3e83207e91cae12ca5929da823f3caf2a035ed4995658a5b7b571ecb  x86-core2--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--bleeding-edge-2022.08-1.sha256
+sha256  75b83133ba59c87bd060cd8f516df9685eaa70a7bda544447630c2c0b94dd1fb  x86-core2--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--musl--stable-2022.08-1.sha256
+sha256  61ee5639fa9fb5b454bd675061b539c51615b4e95c7939ca5ef4d46f4e9d8b31  x86-core2--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  5107c9a89a2162393c95d9aa63ea1c85892ea9cb1393556110af844f147f8bad  x86-core2--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs/x86-core2--uclibc--stable-2022.08-1.sha256
+sha256  ce9bed3cc5d21f3b12b7780783b32498beae186e0693f57884d0cffff13d445f  x86-core2--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--bleeding-edge-2022.08-1.sha256
+sha256  6eda31bf8c4504f322e1e2689beb7172f831400061168a03c0c16956a777a806  x86-i686--glibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--glibc--stable-2022.08-1.sha256
+sha256  6364eb674e5594947cc658bd7ff4928624eb03a20469395a0be93761a804723b  x86-i686--glibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--bleeding-edge-2022.08-1.sha256
+sha256  fd94a3905991bab90e5474e7407e6b593222e44947e70e9d0061f393ab420b0d  x86-i686--musl--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--musl--stable-2022.08-1.sha256
+sha256  7cc2a015e12ac0ae1bd2050e9078fbe87241de2e30ecd4b789ba494b08b3382a  x86-i686--musl--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  c61f6090e96813417880150b8c89ad34502c74e5b69b640701e98378441d9cfc  x86-i686--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs/x86-i686--uclibc--stable-2022.08-1.sha256
+sha256  a35b1f2d4ef5ce829d2211efb4735196c0c7dcb451d5d40089c126e8b8e6c02e  x86-i686--uclibc--stable-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--bleeding-edge-2022.08-1.sha256
+sha256  a822972e8865b4bc9ad1a077c38fbe095c89ea018364411240da1183fcf7c2ad  xtensa-lx60--uclibc--bleeding-edge-2022.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs/xtensa-lx60--uclibc--stable-2022.08-1.sha256
+sha256  35df9b38a5b424cc7d18dd7d382a7962c813dcd19b0c6e9887e3fbb4e3a6d44d  xtensa-lx60--uclibc--stable-2022.08-1.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 166cf5f45d..230552af71 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -7,265 +7,265 @@
 # This file was auto-generated by support/scripts/gen-bootlin-toolchains
 # Do not edit
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64BE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = aarch64be--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_750D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-750d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-750d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-3
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCLE_HS38_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = arcle-hs38--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/arcle-hs38/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv5-eabi--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv6-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armebv7-eabihf--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armebv7-eabihf/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = armv7m--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/armv7m/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_68XXX_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = m68k-68xxx--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/m68k-68xxx/tarballs
 endif
@@ -283,901 +283,967 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/relea
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEBE_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazebe--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazebe/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MICROBLAZEEL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = microblazeel--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/microblazeel/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R5EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r5el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r5el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS32R6EL_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips32r6el--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips32r6el/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64R6EL_N32_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = mips64r6el-n32--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/mips64r6el-n32/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = nios2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-2
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64le-power8--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64le-power8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv32-ilp32d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv32-ilp32d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = riscv64-lp64d--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_S390X_Z13_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = s390x-z13--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SH_SH4AEB_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sh-sh4aeb--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sh-sh4aeb/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARC64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparc64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparc64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-3
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = sparcv8--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/sparcv8/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V2_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v2/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V3_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v3/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-5
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_V4_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-v4--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-v4/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-64-core-i7--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-64-core-i7/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-core2--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-core2/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = x86-i686--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/x86-i686/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE),y)
-TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2021.11-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2022.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = xtensa-lx60--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/xtensa-lx60/tarballs
 endif
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
