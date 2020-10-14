From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 00:00:42 +0200
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate with
 new PowerPC toolchains
Message-ID: <20201014215744.3E4BD8762B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b0ce88b48e29d0703ca82a5be172b0525c518bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options   | 395 +++++++++++++++++++++
 .../toolchain-external-bootlin.hash                |  32 ++
 .../toolchain-external-bootlin.mk                  |  96 +++++
 3 files changed, 523 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 5f2343582d..3c94ae1535 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -24,8 +24,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_nios2
 	default y if BR2_or1k
+	default y if BR2_powerpc && BR2_powerpc_440fp
+	default y if BR2_powerpc && BR2_powerpc_e300c3
 	default y if BR2_powerpc && BR2_powerpc_e500mc
 	default y if BR2_powerpc64 && BR2_powerpc_e5500
+	default y if BR2_powerpc64 && BR2_powerpc_e6500
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
@@ -2519,6 +2522,298 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_OPENRISC_UCLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
+	bool "powerpc-440fp glibc bleeding-edge 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_440fp
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Bootlin toolchain for the powerpc-440fp architecture, using
+	  the glibc C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
+	bool "powerpc-440fp glibc stable 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_440fp
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Bootlin toolchain for the powerpc-440fp architecture, using
+	  the glibc C library. This is a stable version, which means
+	  it is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
+	bool "powerpc-440fp musl bleeding-edge 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_440fp
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the powerpc-440fp architecture, using
+	  the musl C library. This is a bleeding-edge version, which
+	  means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
+	bool "powerpc-440fp musl stable 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_440fp
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the powerpc-440fp architecture, using
+	  the musl C library. This is a stable version, which means
+	  it is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
+	bool "powerpc-440fp uclibc bleeding-edge 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_440fp
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the powerpc-440fp architecture, using
+	  the uclibc C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
+	bool "powerpc-440fp uclibc stable 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_440fp
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the powerpc-440fp architecture, using
+	  the uclibc C library. This is a stable version, which means
+	  it is using stable and proven versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
+	bool "powerpc-e300c3 glibc bleeding-edge 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_e300c3
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Bootlin toolchain for the powerpc-e300c3 architecture,
+	  using the glibc C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
+	bool "powerpc-e300c3 glibc stable 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_e300c3
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Bootlin toolchain for the powerpc-e300c3 architecture,
+	  using the glibc C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
+	bool "powerpc-e300c3 musl bleeding-edge 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_e300c3
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the powerpc-e300c3 architecture,
+	  using the musl C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
+	bool "powerpc-e300c3 musl stable 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_e300c3
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the powerpc-e300c3 architecture,
+	  using the musl C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
+	bool "powerpc-e300c3 uclibc bleeding-edge 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_e300c3
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the powerpc-e300c3 architecture,
+	  using the uclibc C library. This is a bleeding-edge
+	  version, which means it is using the latest versions of
+	  gcc, gdb and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
+	bool "powerpc-e300c3 uclibc stable 2020.08-1"
+	depends on BR2_powerpc
+	depends on BR2_powerpc_e300c3
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	help
+	  Bootlin toolchain for the powerpc-e300c3 architecture,
+	  using the uclibc C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	bool "powerpc-e500mc glibc bleeding-edge 2020.08-1"
 	depends on BR2_powerpc
@@ -2717,6 +3012,106 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 
 	  https://toolchains.bootlin.com/
 
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
+	bool "powerpc64-e6500 glibc bleeding-edge 2020.08-1"
+	depends on BR2_powerpc64
+	depends on BR2_powerpc_e6500
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Bootlin toolchain for the powerpc64-e6500 architecture,
+	  using the glibc C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
+	bool "powerpc64-e6500 glibc stable 2020.08-1"
+	depends on BR2_powerpc64
+	depends on BR2_powerpc_e6500
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	help
+	  Bootlin toolchain for the powerpc64-e6500 architecture,
+	  using the glibc C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
+	bool "powerpc64-e6500 musl bleeding-edge 2020.08-1"
+	depends on BR2_powerpc64
+	depends on BR2_powerpc_e6500
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the powerpc64-e6500 architecture,
+	  using the musl C library. This is a bleeding-edge version,
+	  which means it is using the latest versions of gcc, gdb and
+	  binutils.
+
+	  https://toolchains.bootlin.com/
+
+config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
+	bool "powerpc64-e6500 musl stable 2020.08-1"
+	depends on BR2_powerpc64
+	depends on BR2_powerpc_e6500
+	depends on BR2_USE_MMU
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Bootlin toolchain for the powerpc64-e6500 architecture,
+	  using the musl C library. This is a stable version, which
+	  means it is using stable and proven versions of gcc, gdb
+	  and binutils.
+
+	  https://toolchains.bootlin.com/
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-power8 glibc bleeding-edge 2020.08-1"
 	depends on BR2_powerpc64
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
index 2262d265a4..8764f395fa 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
@@ -200,6 +200,30 @@ sha256  697ef122917022f400003931bc6da75fe07bb5234ef8186cbe027e560f04a168  openri
 sha256  e45d02c9272c909db1c92b6403ed1e0813889ef0c22b2f5166d2675f62d3f20f  openrisc--uclibc--bleeding-edge-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs/openrisc--uclibc--stable-2020.08-1.sha256
 sha256  62c60f9f99828a01f3a16060ceba74b8e2603a8ca3585649434a66f721ecdf75  openrisc--uclibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2020.08-1.sha256
+sha256  d7e3ab961be0b39f40b428790e48f9f3e44290bb7bed51446bc7c8d66aacf0da  powerpc-440fp--glibc--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--stable-2020.08-1.sha256
+sha256  99ab7272cf8fec3e0ce67935bea9c077a2e9bd9076388238c3976cdf1e8f19e0  powerpc-440fp--glibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2020.08-1.sha256
+sha256  182dd8d2a4203863c663301b8ee6e59101a0b87dbb03aa3b919944338a2947fe  powerpc-440fp--musl--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--stable-2020.08-1.sha256
+sha256  4658f631506b7d73a7f6816caa6b8e052d5d203e14a77bd6904af8ee9ebf2868  powerpc-440fp--musl--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--bleeding-edge-2020.08-1.sha256
+sha256  e6570a1683260620bec129e849f68488e59460a99158c5c3e48b30432ec043c7  powerpc-440fp--uclibc--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--uclibc--stable-2020.08-1.sha256
+sha256  ed632b806c8e8fa77e0d1f43d57ae169629ce94e4783044771ee60775001d207  powerpc-440fp--uclibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--bleeding-edge-2020.08-1.sha256
+sha256  fe4b9817f060d84118fff5b7d855eacac472975f2adfececb641d2999f94a7ea  powerpc-e300c3--glibc--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--glibc--stable-2020.08-1.sha256
+sha256  77d215d650850af65c3ac1792dcf100322f3dfea78ba174118197ec0c8a49807  powerpc-e300c3--glibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--bleeding-edge-2020.08-1.sha256
+sha256  4aa2b5c3c2c3263edfdf95284f0774aed8a47446b7a362ee44dc24d83db06896  powerpc-e300c3--musl--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--musl--stable-2020.08-1.sha256
+sha256  129d9aab59e9edfc68739b612f2ee4abce5679830250fbcd50b89ec3d2c865c5  powerpc-e300c3--musl--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--bleeding-edge-2020.08-1.sha256
+sha256  54e6960edd6419bb268b651ffedc24af73a72ad9dd145c1849a6e0fb6f997b15  powerpc-e300c3--uclibc--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs/powerpc-e300c3--uclibc--stable-2020.08-1.sha256
+sha256  1057b488623a80037558a1439555b1a15b25a4d7f42dc49d0169349592ad5b3e  powerpc-e300c3--uclibc--stable-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--bleeding-edge-2020.08-1.sha256
 sha256  8cab4fbb645be782a6eaeb7b6afd75fda4c0dc8ca9a4095b0be9b6eeb29a9759  powerpc-e500mc--glibc--bleeding-edge-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e500mc/tarballs/powerpc-e500mc--glibc--stable-2020.08-1.sha256
@@ -216,6 +240,14 @@ sha256  e817af2d5a0fba654e7766dcad89380e278af9feb35c2d0591a0f8d893defa48  powerp
 sha256  418b79f8313ac4ff29cb6c2d639848eb74a0245666142a307374513cffd472e6  powerpc64-e5500--glibc--bleeding-edge-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2020.08-1.sha256
 sha256  a51ddba944394de41b2f7c001772bb68074175d65a0976749da5289a5e705f23  powerpc64-e5500--glibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--bleeding-edge-2020.08-1.sha256
+sha256  c537c2ef618f767762295806658bb0add514453068ea72ce2bd6e6e805e64af5  powerpc64-e6500--glibc--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--glibc--stable-2020.08-1.sha256
+sha256  1d8aaf1492f69496b01fc930fa928ffd3144d1465c7c954128ed31ce576306b6  powerpc64-e6500--glibc--stable-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--bleeding-edge-2020.08-1.sha256
+sha256  c46c7595384929211ce2f54655ceb4eb1d32054923892cd5d10913be364fa6f2  powerpc64-e6500--musl--bleeding-edge-2020.08-1.tar.bz2
+# From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs/powerpc64-e6500--musl--stable-2020.08-1.sha256
+sha256  a295073db591ed16eec90caf5fdef62ccff5550166d36496ab24aa993bdb2a42  powerpc64-e6500--musl--stable-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--bleeding-edge-2020.08-1.sha256
 sha256  cbe65abf36fa807176a01488751a2e45800791534400b803c024e4c29357862c  powerpc64-power8--glibc--bleeding-edge-2020.08-1.tar.bz2
 # From https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-power8/tarballs/powerpc64-power8--glibc--stable-2020.08-1.sha256
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
index 876090c6db..71f53f6d58 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
@@ -606,6 +606,78 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = openrisc--uclibc--stable-$(TOOLCHAIN_EXTERNA
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/openrisc/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-440fp--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e300c3--uclibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-e300c3/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc-e500mc--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
@@ -654,6 +726,30 @@ TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e5500--glibc--stable-$(TOOLCHAIN_E
 TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--glibc--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE),y)
+TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
+TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-e6500--musl--stable-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
+TOOLCHAIN_EXTERNAL_BOOTLIN_SITE = https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e6500/tarballs
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE),y)
 TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION = 2020.08-1
 TOOLCHAIN_EXTERNAL_BOOTLIN_SOURCE = powerpc64-power8--glibc--bleeding-edge-$(TOOLCHAIN_EXTERNAL_BOOTLIN_VERSION).tar.bz2
