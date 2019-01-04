From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jan 2019 12:45:17 +0100
Subject: [Buildroot] [git commit] toolchain-external: update Arm AArch64
 toolchain 8.2-2018.11
Message-ID: <20190104114554.2657783607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46b6ae6a665225fbbeeb80f8bfba128739a9e4ee
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

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-arm-aarch64/Config.in     | 4 ++--
 .../toolchain-external-arm-aarch64.hash                             | 6 +++---
 .../toolchain-external-arm-aarch64.mk                               | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index ba627129cb..fbb5e025e8 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 2018.08"
+	bool "Arm AArch64 2018.11"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index d651bb0182..cda90f7517 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz.asc
-md5 1c47f4edc431cf19604a9f1b09975269 gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.11/gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz.asc
+md5 319ca548ff05b0ec1008988a7e5ab619 gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
 # locally calculated
-sha256 3e60644846ac60693e58ad71a319d64c5f7bcf95ff34411272c8d9674f85648f gcc-arm-8.2-2018.08-x86_64-aarch64-linux-gnu.tar.xz
+sha256 0142366da2f30feb1c366997cbdaa02286c8f1aa527c0fc177ee5ce8e77970fc gcc-arm-8.2-2018.11-x86_64-aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 515b66cd79..0398bd1297 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 2018.11
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-linux-gnu.tar.xz
