From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Jan 2011 22:55:37 +0100
Subject: [Buildroot] [git commit master 1/1] target gcc: cleanup
Message-ID: <20110102220443.EAB8C8F346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=81f1f99dc5e54f02fd09e8b5a152b7beba5dbec5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WITH_TARGET_{GMP/MPC/MPFR} is unneeded since we are providing a sysroot.

It also breaks build-gcc under certain conditions.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
