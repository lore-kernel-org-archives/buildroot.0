From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun,  1 Nov 2020 19:01:54 +0100
Subject: [Buildroot] [PATCH 1/1] imlib2: Bump to version 1.6.1
Message-ID: <20201101180154.14307-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I'm sorry, I haven't figured out where to disable
BR2_TOOLCHAIN_EXTERNAL_INET_RPC as suggested in the helper:
riscv32-ilp32d--glibc--bleeding-edge-2020.08-1.tar.bz2: OK (sha256: 18a47b0c221137f40720df08e9bbdc0bcb6e68cde3a30906681e4dec83eb7547)
>>> toolchain-external-bootlin 2020.08-1 Extracting
bzcat dl/toolchain-external-bootlin/riscv32-ilp32d--glibc--bleeding-edge-2020.08-1.tar.bz2 | br-test-pkg/br-riscv32/host/bin/tar --strip-components=1 -C br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1 --exclude='usr/lib/locale/*'   -xf -
rm -rf br-test-pkg/br-riscv32/host/opt/ext-toolchain
mkdir -p br-test-pkg/br-riscv32/host/opt/ext-toolchain
mv br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1/* br-test-pkg/br-riscv32/host/opt/ext-toolchain/
>>> toolchain-external-bootlin 2020.08-1 Patching
>>> toolchain-external-bootlin 2020.08-1 Configuring
f951: Warning: Reading file ?<stdin>? as free form
RPC support not available in C library, please disable BR2_TOOLCHAIN_EXTERNAL_INET_RPC
make: *** [package/pkg-generic.mk:240: br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1/.stamp_configured] Error 1

In riscv32 section in
toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options?
But how to disable it?

Adding
# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
into support/config-fragments/autobuild/br-riscv32.config didn't help.

Kind regards,
Petr

Tested:
                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: OK
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: OK
                      br-arm-full-static [12/45]: SKIPPED
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
               br-powerpc-603e-basic-cpp [25/45]: OK
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

 package/imlib2/imlib2.hash | 6 +++---
 package/imlib2/imlib2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index c52ce9d2f4..7cfb674906 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,8 +1,8 @@
 # From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.5.1/
-md5 390aa207693e051bb692f2db650c694b  imlib2-1.5.1.tar.bz2
-sha1 3e97e7157380f0cfbdf4f3c950a7a00bdfa6072c  imlib2-1.5.1.tar.bz2
+md5 da6a0b39bc3333f1833c791d96ed75a5  imlib2_loaders-1.6.1.tar.bz2
+sha1 29bc3c8d75cc8fb3bbd5d61e8ab29940d0943da8  imlib2_loaders-1.6.1.tar.bz2
 
 # Locally computed
-sha256 fa4e57452b8843f4a70f70fd435c746ae2ace813250f8c65f977db5d7914baae  imlib2-1.5.1.tar.bz2
+sha256 4d393a77e13da883c8ee2da3b029da3570210fe37d000c9ac33d9fce751b166d  imlib2-1.6.1.tar.bz2
 sha256 fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
 sha256 8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 1c2e924d50..a684ec5b51 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMLIB2_VERSION = 1.5.1
+IMLIB2_VERSION = 1.6.1
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
 IMLIB2_LICENSE = Imlib2
-- 
2.29.1
