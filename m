From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 20:07:35 +0200
Subject: [Buildroot] [git commit] package/llvm: bump to version 7.0.0
Message-ID: <20180930181808.AF7E38A47C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09a76d507dac9f03944f0f9d25c6bc9ee476e556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LLVM_BUILD_GLOBAL_ISEL does no longer exist

LICENSE.TXT hash changed due to the Copyright date update.

Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/llvm/llvm.hash | 4 ++--
 package/llvm/llvm.mk   | 7 +------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/llvm/llvm.hash b/package/llvm/llvm.hash
index 6a09e5804c..200907fc89 100644
--- a/package/llvm/llvm.hash
+++ b/package/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 b6d6c324f9c71494c0ccaf3dac1f16236d970002b42bb24a6c9e1634f7d0f4e2  llvm-6.0.1.src.tar.xz
-sha256 abd4d8794808bacb1eb6924d49efafd9ab6eef88faaaeb5d3cfa13ee3670d672 LICENSE.TXT
+sha256 8bc1f844e6cbde1b652c19c1edebc1864456fd9c78b8c1bea038e51b363fe222 llvm-7.0.0.src.tar.xz
+sha256 0303dfeaac87b80d2d1e543aa38d5be77b0eac93c3d04fe7e3c8eaa71a778667 LICENSE.TXT
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 756b46a865..1f9bd447f5 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLVM_VERSION = 6.0.1
+LLVM_VERSION = 7.0.0
 LLVM_SITE = http://llvm.org/releases/$(LLVM_VERSION)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = NCSA
@@ -30,11 +30,6 @@ LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 # will try to use target's libc.
 HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
 
-# Disable experimental Global Instruction Selection support.
-# https://llvm.org/docs/GlobalISel.html
-HOST_LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
-LLVM_CONF_OPTS += -DLLVM_BUILD_GLOBAL_ISEL=OFF
-
 # Get target architecture
 LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
