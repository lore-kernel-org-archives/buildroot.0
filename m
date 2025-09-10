Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD06CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164E1418E6;
	Wed, 10 Sep 2025 21:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFMIlcQKzoBo; Wed, 10 Sep 2025 21:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45CC41963
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45CC41963;
	Wed, 10 Sep 2025 21:34:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB26234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16D384080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pem-C0wzaDi9 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F24A41526
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F24A41526
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DD4D83E4D; Wed, 10 Sep 2025 21:34:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 23:25:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27ea54c9762f27999033fc61c7ae8a978c9afdae
X-Git-Newrev: 6b20ffb4cbcd9109117c923059184880ae336ff6
X-Patchwork-Hint: ignore
Message-Id: <20250910213446.0DD4D83E4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/external: remove Linaro arm
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b20ffb4cbcd9109117c923059184880ae336ff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain is more than 7 years old now, and not maintained anymore.
Let's therefore remove it from Buildroot. There are still some
alternatives in-tree, such as ARM and Bootlin toolchains

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Romain:
  - rename TestExternalToolchainLinaroArm to TestExternalToolchainArmGnu
  - update toolchain prefix arm-linux-gnueabihf to arm-none-linux-gnueabihf
  - replace BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM by BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
    since the ARM toolchain can't be enabled due to missing NEON support
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                                   |  7 ++++++
 .../config-fragments/autobuild/linaro-arm.config   |  5 ----
 .../autobuild/toolchain-configs.csv                |  1 -
 support/testing/tests/package/test_gst1_python.py  |  3 ++-
 support/testing/tests/toolchain/test_external.py   |  6 ++---
 toolchain/toolchain-external/Config.in             |  2 --
 .../toolchain-external-linaro-arm/Config.in        | 27 ----------------------
 .../Config.in.options                              |  9 --------
 .../toolchain-external-linaro-arm.hash             |  3 ---
 .../toolchain-external-linaro-arm.mk               | 16 -------------
 10 files changed, 12 insertions(+), 67 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a43c86c9c..6867f129d1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+	bool "Linaro ARM 2018.05 external toolchain is deprecated"
+	select BR2_LEGACY
+	help
+	  Linaro ARM 2018.05 is no longer maintained and has been
+	  removed from Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	bool "Linaro AArch64 BE 2018.05 external toolchain is deprecated"
 	select BR2_LEGACY
diff --git a/support/config-fragments/autobuild/linaro-arm.config b/support/config-fragments/autobuild/linaro-arm.config
deleted file mode 100644
index d72e19b3ad..0000000000
--- a/support/config-fragments/autobuild/linaro-arm.config
+++ /dev/null
@@ -1,5 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_ARM_EABIHF=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 87c58946bc..a559221b99 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -61,4 +61,3 @@ support/config-fragments/autobuild/br-powerpc-internal-full.config,any
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
-support/config-fragments/autobuild/linaro-arm.config,x86
diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index caae3e6b2d..e5fe71b7d9 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -10,7 +10,8 @@ class TestGst1Python(TestPythonPackageBase):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
         BR2_PACKAGE_GSTREAMER1=y
         BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
         BR2_PACKAGE_GST1_PLUGINS_BAD=y
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 27dfd68500..aed3664a02 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -37,15 +37,15 @@ class TestExternalToolchain(infra.basetest.BRTest):
             self.assertTrue(os.path.exists(interp_path))
 
 
-class TestExternalToolchainLinaroArm(TestExternalToolchain):
+class TestExternalToolchainArmGnu(TestExternalToolchain):
     config = BASIC_CONFIG + \
         """
         BR2_arm=y
         BR2_cortex_a8=y
         BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+        BR2_TOOLCHAIN_EXTERNAL_ARM_ARM=y
         """
-    toolchain_prefix = "arm-linux-gnueabihf"
+    toolchain_prefix = "arm-none-linux-gnueabihf"
 
     def test_run(self):
         TestExternalToolchain.common_check(self)
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 007d91d451..2599015d4b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -19,7 +19,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
-source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
@@ -111,7 +110,6 @@ source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.o
 
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
 
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
deleted file mode 100644
index 8b3b4c844e..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-comment "Linaro toolchains available for Cortex-A + EABIhf"
-	depends on BR2_arm
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
-
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-	bool "Linaro ARM 2018.05"
-	depends on BR2_arm
-	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	help
-	  Linaro toolchain for the ARM architecture. It uses Linaro
-	  GCC 2018.05 (based on gcc 7.3.1), Linaro GDB 2018.05 (based on
-	  GDB 8.1), glibc 2.25, Binutils 2018.05 (based on 2.28). It
-	  generates code that runs on all Cortex-A profile devices,
-	  but tuned for the Cortex-A9. The code generated is Thumb 2,
-	  with the hard floating point calling convention, and uses
-	  the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
deleted file mode 100644
index dcbc6599d9..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arm-linux-gnueabihf"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-linaro-arm"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
deleted file mode 100644
index 7169e0b936..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  0613b5be14eb7d50a772bbd72069c428558e6e53fa5fce7201d75a13a475ffff  gcc-linaro-7.3.1-2018.05-i686_arm-linux-gnueabihf.tar.xz
-sha256  7248bf105d0d468887a9b8a7120bb281ac8ad0223d9cb3d00dc7c2d498485d91  gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk b/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
deleted file mode 100644
index fda356bcea..0000000000
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# toolchain-external-linaro-arm
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION = 2018.05
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)/arm-linux-gnueabihf
-
-ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-i686_arm-linux-gnueabihf.tar.xz
-else
-TOOLCHAIN_EXTERNAL_LINARO_ARM_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARM_VERSION)-x86_64_arm-linux-gnueabihf.tar.xz
-endif
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
