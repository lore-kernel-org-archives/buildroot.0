From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jan 2019 12:44:51 +0100
Subject: [Buildroot] [git commit] toolchain-external: update Arm ARM
 toolchain 8.2-2018.11
Message-ID: <20190104114554.1C7A188CD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0d02a4679e65f1614c97f5ba9c7b393e8f6afb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
* All GCC 8.2 features. For details on GCC 8 release series.
* Linaro specific pre-processor macros to ensure that this is a
  continuation from the Linaro releases.
* Spectre v1 mitigation backport from upstream FSF trunk include the
  revisions. This is an initial backport of those mitigations in
  the GNU toolchain and should be regarded as support for prototyping
  and early access only. Moreover, while the backports include support
  for the other architectures, they are included for completeness and
  all issues regarding these patches must be taken up upstream in the
  https://gcc.gnu.org/bugzilla by reproducing the same with upstream
  FSF trunk.
  Arm is interested in feedback regarding these workarounds for
  Spectre v1.
  A description of the mitigation has been published on LWN.net.

See "Release Note":
[1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads#

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external-arm-arm/Config.in   | 4 ++--
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash      | 6 +++---
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk        | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 4ec61f2d07..0449737889 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -4,7 +4,7 @@ comment "Arm toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2018.08"
+	bool "Arm ARM 2018.11"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64"
@@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index f13c43a7ef..cd7f526547 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.xz.asc
-md5 dc7455746d90259337fb88c3e67f8855 gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.11/gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz.asc
+md5 59ccf965837ed1c5ba59e5ad4b688b21 gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz
 # locally calculated
-sha256 5b3f20e1327edc3073e545a5bd3d15f33e7f94181ff4e37a76e95924c1b439b9 gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf.tar.xz
+sha256 3f9bc7a68f744a5edc7caebff5f3f2c3bc1ff9d8ac8b05f7680a0071461deede gcc-arm-8.2-2018.11-x86_64-arm-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 03de21a28a..0c21affd7b 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2018.11
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-linux-gnueabihf.tar.xz
