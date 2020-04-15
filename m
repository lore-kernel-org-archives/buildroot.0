From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Apr 2020 20:21:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: bump to version 1.2.6
Message-ID: <20200415182153.14511-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes build on riscv64:

http://autobuild.buildroot.net/results/a334f774e95fb7805568fc3868d5cf1d790a6e73
http://autobuild.buildroot.net/results/9cf80bdd4d329788c89596b56205ef215ee09c35

There is also a fix for build with -fno-common (default for gcc-10)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested

                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: OK
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

                             andes-nds32 [ 1/44]: OK
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: OK
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: OK
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: OK
                br-i386-pentium-mmx-musl [12/44]: OK
                   br-i386-pentium4-full [13/44]: OK
                    br-microblazeel-full [14/44]: OK
                      br-mipsel-o32-full [15/44]: OK
                 br-mips32r6-el-hf-glibc [16/44]: OK
                      br-mips64-n64-full [17/44]: OK
                 br-mips64r6-el-hf-glibc [18/44]: OK
                       br-m68k-5208-full [19/44]: OK
                      br-m68k-68040-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
                  br-powerpc-e500mc-full [23/44]: OK
               br-powerpc-603e-basic-cpp [24/44]: OK
             br-powerpc64le-power8-glibc [25/44]: OK
               br-powerpc64-power7-glibc [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                         br-sparc-uclibc [30/44]: OK
                        br-sparc64-glibc [31/44]: OK
                          br-xtensa-full [32/44]: OK
                    br-x86-64-core2-full [33/44]: OK
                          br-x86-64-musl [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: OK
                            sourcery-arm [39/44]: OK
                     sourcery-arm-thumb2 [40/44]: OK
                           sourcery-mips [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
44 builds, 1 skipped, 0 build failed, 0 legal-info failed

 package/iputils/iputils.mk     | 3 +++
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 0d260891e2..073c81edf7 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -31,6 +31,9 @@ else
 IPUTILS_CONF_OPTS += -DUSE_IDN=false
 endif
 
+#$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+IPUTILS_DEPENDENCIES += libiconv
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
 IPUTILS_DEPENDENCIES += nettle
diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index a7907dc7b2..044a69b56a 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1 ab80619b214d93e5cfbf22a0d01e1ee06d434326  libtirpc-1.2.5.tar.bz2
+sha1 f182235e32942fc0ac6b9b5b6fe7e32f69362659  libtirpc-1.2.6.tar.bz2
 # Locally computed
-sha256 f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca  libtirpc-1.2.5.tar.bz2
+sha256 4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc  dl/libtirpc/libtirpc-1.2.6.tar.bz2
 sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 879b21e665..f1bdc32eba 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.2.5
+LIBTIRPC_VERSION = 1.2.6
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.26.0
