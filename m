From: Ed Blake <ed.blake@sondrel.com>
Date: Tue, 26 Mar 2019 12:30:44 +0000
Subject: [Buildroot] [PATCH v2 0/4] toolchain-external: add OpenMP support
Message-ID: <20190326123032.9905-1-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds OpenMP support to toolchain-external. The first
patch adds a new 'BR2_TOOLCHAIN_HAS_OPENMP' option which causes
libgomp.so.* to be added to TOOLCHAIN_EXTERNAL_LIBS, the second patch
causes BR2_GCC_ENABLE_OPENMP to select BR2_TOOLCHAIN_HAS_OPENMP, the 
third patch enables BR2_TOOLCHAIN_HAS_OPENMP for all supporting
external toolchains, and the fourth patch updates packages to check
BR2_TOOLCHAIN_HAS_OPENMP instead of BR2_GCC_ENABLE_OPENMP.

Ed Blake (4):
  toolchain-external: introduce BR2_TOOLCHAIN_HAS_OPENMP
  package/gcc: select BR2_TOOLCHAIN_HAS_OPENMP if BR2_GCC_ENABLE_OPENMP
  toolchain-external: enable OpenMP for supporting toolchains
  package: use BR2_TOOLCHAIN_HAS_OPENMP

 package/fftw/fftw.mk                                          | 4 ++--
 package/flann/flann.mk                                        | 2 +-
 package/gcc/Config.in.host                                    | 1 +
 package/opencv3/opencv3.mk                                    | 2 +-
 toolchain/Config.in                                           | 3 +++
 toolchain/toolchain-external/pkg-toolchain-external.mk        | 4 ++++
 .../toolchain-external-arm-aarch64-be/Config.in               | 1 +
 .../toolchain-external-arm-aarch64/Config.in                  | 1 +
 .../toolchain-external/toolchain-external-arm-arm/Config.in   | 1 +
 .../toolchain-external-codescape-img-mips/Config.in           | 1 +
 .../toolchain-external-codescape-mti-mips/Config.in           | 1 +
 .../toolchain-external-codesourcery-amd64/Config.in           | 1 +
 .../toolchain-external-codesourcery-mips/Config.in            | 1 +
 .../toolchain-external-linaro-aarch64-be/Config.in            | 1 +
 .../toolchain-external-linaro-aarch64/Config.in               | 1 +
 .../toolchain-external-linaro-arm/Config.in                   | 1 +
 .../toolchain-external-linaro-armeb/Config.in                 | 1 +
 17 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.17.1
