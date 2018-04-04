From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Apr 2018 17:54:50 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: fix
 HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI typos
Message-ID: <20180404155451.15258-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI variable was incorrectly
used as HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_, which would always
be empty.

In practice, this block of code is only used on Blackfin (which has
BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS unset) and Blackfin doesn't use
float-abi, so this block of code is in fact useless. But even if it's
useless, it's better to have it without typos.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/gcc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f42f36a967..5a1e3d5b0c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -297,8 +297,8 @@ endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FPU),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FPU)"'
 endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_)"'
+ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI),)
+HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI)"'
 endif
 ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_MODE),)
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(HOST_GCC_COMMON_WRAPPER_TARGET_MODE)"'
-- 
2.14.3
