From: Ed Blake <ed.blake@sondrel.com>
Date: Fri, 22 Mar 2019 16:59:45 +0000
Subject: [Buildroot] [PATCH 0/2] toolchain-external: add OpenMP support
Message-ID: <20190322165929.14306-1-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds OpenMP support to toolchain-external. The first
patch adds a new 'BR2_TOOLCHAIN_HAS_OPENMP' option which causes
libgomp.so.* to be added to TOOLCHAIN_EXTERNAL_LIBS, and the second
patch enables BR2_TOOLCHAIN_HAS_OPENMP for all supporting external
toolchains.

Ed Blake (2):
  toolchain-external: add option for OpenMP support
  toolchain-external: enable OpenMP for supporting toolchains

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
 13 files changed, 18 insertions(+)

-- 
2.17.1
