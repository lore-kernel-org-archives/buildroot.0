From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Jul 2010 10:02:23 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: enforce
	--disable-multilib
Message-ID: <20100730081549.9220B8367D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d4f9ba707044fec2fa227c1e71db28e49807bae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 5575d205c (toolchain: remove multilib) we were no longer passing
--disable-multilib, which broke builds for multilib-capable archs (like
x86-64, ppc, ..).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/binutils/binutils.mk  |    2 ++
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index ddf9f39..85b605e 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -74,6 +74,7 @@ $(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
 		$(BR2_CONFIGURE_DEVEL_SYSROOT) \
 		$(BR2_CONFIGURE_STAGING_SYSROOT) \
 		$(DISABLE_NLS) \
+		--disable-multilib \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(EXTRA_BINUTILS_CONFIG_OPTIONS) \
@@ -128,6 +129,7 @@ $(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched
 		--infodir=/usr/share/info \
 		$(DISABLE_NLS) \
 		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
+		--disable-multilib \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 	)
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index d140db1..0b7fd48 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -203,6 +203,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--disable-libssp \
 		--without-headers \
 		--with-newlib \
+		--disable-multilib \
 		$(GCC_TLS) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -272,6 +273,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		--with-gnu-ld \
 		--enable-shared \
 		--disable-libssp \
+		--disable-multilib \
 		$(GCC_TLS) \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -353,6 +355,7 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		--enable-target-optspace \
 		--with-gnu-ld \
 		--disable-libssp \
+		--disable-multilib \
 		$(GCC_TLS) \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_HOST_GMP) \
@@ -485,6 +488,7 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		--disable-__cxa_atexit \
 		--with-gnu-ld \
 		--disable-libssp \
+		--disable-multilib \
 		$(GCC_TLS) \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
-- 
1.7.1
