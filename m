From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  2 Nov 2020 19:09:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump to version 1.26.6
Message-ID: <20201102180927.31003-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

libqmi update is needed for ModemManager update.

tested:

                             andes-nds32 [ 1/45]: FAILED
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: SKIPPED
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: SKIPPED
                      br-arm-full-static [12/45]: OK
                br-i386-pentium-mmx-musl [13/45]: OK
                   br-i386-pentium4-full [14/45]: OK
                    br-microblazeel-full [15/45]: OK
                      br-mipsel-o32-full [16/45]: OK
                 br-mips32r6-el-hf-glibc [17/45]: OK
                      br-mips64-n64-full [18/45]: OK
                 br-mips64r6-el-hf-glibc [19/45]: OK
                       br-m68k-5208-full [20/45]: SKIPPED
                      br-m68k-68040-full [21/45]: OK
                          br-nios2-glibc [22/45]: OK
                      br-openrisc-uclibc [23/45]: OK
                  br-powerpc-e500mc-full [24/45]: OK
               br-powerpc-603e-basic-cpp [25/45]: SKIPPED
             br-powerpc64le-power8-glibc [26/45]: OK
               br-powerpc64-power7-glibc [27/45]: OK
                              br-riscv32 [28/45]: FAILED
                              br-riscv64 [29/45]: OK
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: OK
                         br-sparc-uclibc [32/45]: OK
                        br-sparc64-glibc [33/45]: OK
                          br-xtensa-full [34/45]: OK
                    br-x86-64-core2-full [35/45]: OK
                          br-x86-64-musl [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 5 skipped, 2 build failed, 0 legal-info failed

the failures are not related to this upgrade:
* andes-nds32: libffi has not been ported to nds32le-buildroot-linux-gnu
(the usual one)
* br-riscv32: RPC support not available in C library, please disable
BR2_TOOLCHAIN_EXTERNAL_INET_RPC (problem with Bootlin, which uses
glibc >= 2.32, which has removed SUN-RPC implementation. This is being
discussed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101180154.14307-1-petr.vorel at gmail.com/#2566327)

Kind regards,
Petr
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index e166b66b22..1304a072e2 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  208fe3e94dabe1d8117d1023d841737b6fe92aaff21ef8f35bbed15417ee507f  libqmi-1.24.14.tar.xz
+sha256  a71963bb1097a42665287e40a9a36f95b8f9d6d6a4b7a5de22d660328af97cb9  libqmi-1.26.6.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 0398100be7..6b5ccfcdea 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.24.14
+LIBQMI_VERSION = 1.26.6
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-- 
2.29.1
