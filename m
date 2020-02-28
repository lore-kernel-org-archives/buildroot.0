From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 07:04:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: remove _GNU_SOURCE patch
Message-ID: <20200228060455.30505-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not needed any more.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested on 1.38, with these 4 patches:
https://patchwork.ozlabs.org/project/buildroot/list/?series=161347
https://patchwork.ozlabs.org/project/buildroot/list/?series=161348

$ ./utils/test-pkg -p connman -a
                             andes-nds32 [ 1/44]: FAILED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: SKIPPED
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                br-i386-pentium-mmx-musl [12/44]: SKIPPED
                   br-i386-pentium4-full [13/44]: OK
                    br-microblazeel-full [14/44]: OK
                      br-mipsel-o32-full [15/44]: OK
                 br-mips32r6-el-hf-glibc [16/44]: OK
                      br-mips64-n64-full [17/44]: OK
                 br-mips64r6-el-hf-glibc [18/44]: OK
                       br-m68k-5208-full [19/44]: SKIPPED
                      br-m68k-68040-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
                  br-powerpc-e500mc-full [23/44]: OK
               br-powerpc-603e-basic-cpp [24/44]: SKIPPED
             br-powerpc64le-power8-glibc [25/44]: OK
               br-powerpc64-power7-glibc [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                         br-sparc-uclibc [30/44]: SKIPPED
                        br-sparc64-glibc [31/44]: OK
                          br-xtensa-full [32/44]: OK
                    br-x86-64-core2-full [33/44]: OK
                          br-x86-64-musl [34/44]: SKIPPED
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
44 builds, 10 skipped, 1 build failed, 0 legal-info failed

$ ./utils/test-pkg -p connman
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: OK
6 builds, 3 skipped, 0 build failed, 0 legal-info failed

 package/connman/0001-nat-build-failure.patch | 30 --------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 package/connman/0001-nat-build-failure.patch

diff --git a/package/connman/0001-nat-build-failure.patch b/package/connman/0001-nat-build-failure.patch
deleted file mode 100644
index 0ab58501d0..0000000000
--- a/package/connman/0001-nat-build-failure.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 68f4b4f5b220f256b17ad2f084d61fe89f3632ae Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 19 Apr 2016 08:38:38 -0300
-Subject: [PATCH] nat: fix build failure
-
-_GNU_SOURCE needs to be defined so that O_CLOEXEC symbols can be found in
-system header files.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: submitted upstream
-
- src/nat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/nat.c b/src/nat.c
-index 33ae6df..62e21d4 100644
---- a/src/nat.c
-+++ b/src/nat.c
-@@ -24,6 +24,7 @@
- #include <config.h>
- #endif
- 
-+#define _GNU_SOURCE
- #include <errno.h>
- #include <sys/types.h>
- #include <sys/stat.h>
--- 
-2.7.3
-
-- 
2.25.1
