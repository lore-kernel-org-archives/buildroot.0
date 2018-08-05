From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  5 Aug 2018 16:05:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/mono: remove target mips
 architecture
Message-ID: <1533477904-31216-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current version of mono doesn't compile on mips due to a bug, so
disabling the mips target architecture until the bug is fixed upstream.

Fixes: http://autobuild.buildroot.net/results/b402af8cb7f00dc2e69c219926b474a8e0c8d372
and many others.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Tested with:
utils/test-pkg -c ../mono.defconfig -t ../toolchain-configs.csv -a 
                armv5-ctng-linux-gnueabi [ 1/46]: OK
              armv7-ctng-linux-gnueabihf [ 2/46]: OK
                        br-aarch64-glibc [ 3/46]: SKIPPED
                           br-arcle-hs38 [ 4/46]: SKIPPED
                            br-arm-basic [ 5/46]: OK
                  br-arm-cortex-a9-glibc [ 6/46]: OK
                   br-arm-cortex-a9-musl [ 7/46]: OK
                   br-arm-cortex-m4-full [ 8/46]: SKIPPED
                             br-arm-full [ 9/46]: OK
                    br-arm-full-nothread [10/46]: SKIPPED
                      br-arm-full-static [11/46]: SKIPPED
                   br-i386-pentium4-full [12/46]: OK
                br-i386-pentium-mmx-musl [13/46]: OK
                       br-m68k-5208-full [14/46]: SKIPPED
                      br-m68k-68040-full [15/46]: SKIPPED
                    br-microblazeel-full [16/46]: SKIPPED
                 br-mips32r6-el-hf-glibc [17/46]: SKIPPED
                 br-mips64r6-el-hf-glibc [18/46]: SKIPPED
                      br-mipsel-o32-full [19/46]: SKIPPED
                          br-nios2-glibc [20/46]: SKIPPED
                      br-openrisc-uclibc [21/46]: SKIPPED
               br-powerpc-603e-basic-cpp [22/46]: OK
             br-powerpc64le-power8-glibc [23/46]: SKIPPED
               br-powerpc64-power7-glibc [24/46]: SKIPPED
                  br-powerpc-e500mc-full [25/46]: OK
                             br-sh4-full [26/46]: SKIPPED
                        br-sparc64-glibc [27/46]: SKIPPED
                         br-sparc-uclibc [28/46]: SKIPPED
                    br-x86-64-core2-full [29/46]: OK
                          br-x86-64-musl [30/46]: OK
                          br-xtensa-full [31/46]: SKIPPED
                     i686-ctng-linux-gnu [32/46]: OK
                       linaro-aarch64-be [33/46]: SKIPPED
                          linaro-aarch64 [34/46]: SKIPPED
                              linaro-arm [35/46]: OK
             mips64el-ctng_n32-linux-gnu [36/46]: SKIPPED
             mips64el-ctng_n64-linux-gnu [37/46]: SKIPPED
        powerpc-ctng_e500v2-linux-gnuspe [38/46]: OK
                     sourcery-arm-armv4t [39/46]: OK
                            sourcery-arm [40/46]: OK
                     sourcery-arm-thumb2 [41/46]: OK
                         sourcery-mips64 [42/46]: SKIPPED
                           sourcery-mips [43/46]: SKIPPED
                          sourcery-nios2 [44/46]: SKIPPED
                         sourcery-x86-64 [45/46]: OK
           x86_64-ctng_locales-linux-gnu [46/46]: OK



 package/mono/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 63208fe..a375a98 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		      BR2_mipsel || BR2_powerpc || BR2_x86_64)
+	default y if (BR2_arm || BR2_armeb || BR2_i386 || \
+		      BR2_powerpc || BR2_x86_64)
 	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO
-- 
2.7.4
