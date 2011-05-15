From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2011 22:00:16 +0200
Subject: [Buildroot] [PATCH 2/2] gcc: remove references to
	arm-softfloat.patch.conditional
In-Reply-To: <cover.1305489609.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305489609.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7c46868238a1a6b937419f8db94e2459155b7cb0.1305489609.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The arm-softfloat.patch.conditional patches are no longer in Buildroot
since 9af188d883b2657bd967e6621011d4bbe1bb3441 (October 2009), which
removed support for gcc 3.x and 4.0.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 7123615..94613fa 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -210,19 +210,6 @@ ifneq ($(wildcard $(GCC_PATCH_DIR)),)
 	toolchain/patch-kernel.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch $(GCC_PATCH_EXTRA)
 endif
 
-	# Note: The soft float situation has improved considerably with gcc 3.4.x.
-	# We can dispense with the custom spec files, as well as libfloat for the arm case.
-	# However, we still need a patch for arm. There's a similar patch for gcc 3.3.x
-	# which needs to be integrated so we can kill of libfloat for good, except for
-	# anyone (?) who might still be using gcc 2.95. mjn3
-ifeq ($(BR2_SOFT_FLOAT),y)
-ifeq ("$(strip $(ARCH))","arm")
-	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) arm-softfloat.patch.conditional
-endif
-ifeq ("$(strip $(ARCH))","armeb")
-	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) arm-softfloat.patch.conditional
-endif
-endif
 ifeq ($(ARCH)-$(BR2_GCC_SHARED_LIBGCC),powerpc-y)
 ifneq ($(BR2_SOFT_FLOAT),)
 	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
-- 
1.7.1
