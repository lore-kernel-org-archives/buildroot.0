From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Dec 2010 08:39:06 -0300
Subject: [Buildroot] [PATCH 6/6] target gcc: cleanup
In-Reply-To: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293795546-19674-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WITH_TARGET_{GMP/MPC/MPFR} is unneeded since we are providing a sysroot.

It also breaks build-gcc under certain conditions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 633b8aa..80bed5e 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -119,11 +119,8 @@ GCC_HOST_PREREQ += host-mpc
 endif
 
 GCC_TARGET_PREREQ += mpfr gmp
-GCC_WITH_TARGET_GMP = --with-gmp=$(STAGING_DIR)/usr
-GCC_WITH_TARGET_MPFR = --with-mpfr=$(STAGING_DIR)/usr
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 GCC_TARGET_PREREQ += mpc
-GCC_WITH_TARGET_MPC = --with-mpc=$(STAGING_DIR)/usr
 endif
 
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
@@ -506,9 +503,6 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		--disable-multilib \
 		$(GCC_TLS) \
 		$(GCC_SHARED_LIBGCC) \
-		$(GCC_WITH_TARGET_GMP) \
-		$(GCC_WITH_TARGET_MPFR) \
-		$(GCC_WITH_TARGET_MPC) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(GCC_DECIMAL_FLOAT) \
-- 
1.7.2.2
