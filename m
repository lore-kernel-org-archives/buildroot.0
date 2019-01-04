From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jan 2019 12:45:02 +0100
Subject: [Buildroot] [git commit] toolchain-external: update Arm AArch64-BE
 toolchain 8.2-2018.11
Message-ID: <20190104114554.2548882A9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=216aefa20562e13995274b1a7283976c22a6bbd0
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

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-arm-aarch64-be/Config.in  | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                          | 6 +++---
 .../toolchain-external-arm-aarch64-be.mk                            | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 1e303c5ec2..d992be0190 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2018.08"
+	bool "Arm AArch64 BE 2018.11"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 9ab0eb519c..580e10dd79 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.08/gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz.asc
-md5 789171dc11bc2e37e90ea3c6de46c719 gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-2018.11/gcc-arm-8.2-2018.11-x86_64-aarch64_be-linux-gnu.tar.xz.asc
+md5 ab9a31ebe529b0a0cae78e610a9ffa0b gcc-arm-8.2-2018.11-x86_64-aarch64_be-linux-gnu.tar.xz
 # locally calculated
-sha256 2cd8a1a35a892db5f0cd738a8b17bd1563f6d6e4be43a2b527b355bcfb295df8 gcc-arm-8.2-2018.08-x86_64-aarch64_be-linux-gnu.tar.xz
+sha256 36df73194804ac52053edf469c7ace73fb4b243a8306dadfb7b95c4f485abde4 gcc-arm-8.2-2018.11-x86_64-aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 4a4e5a01b6..a41d9cadf2 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2018.08
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2018.11
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-8.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-linux-gnu.tar.xz
