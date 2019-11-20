From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 20 Nov 2019 18:15:31 +0100
Subject: [Buildroot] [PATCH 1/2] package/ltp-testsuite: Backport 3 more
 musl related patches
In-Reply-To: <20191120171401.14663-1-petr.vorel@gmail.com>
References: <20191120171401.14663-1-petr.vorel@gmail.com>
Message-ID: <20191120171531.GA14833@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> 0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch is fixing
> following reports (other 2 has not been reported due previous)

> Fixes:
> http://autobuild.buildroot.net/results/a38a5d8deaa365f73db427911df68dd10c6930a6
> http://autobuild.buildroot.net/results/dfa173caea08876ab69dd959da146b75750cdd28
> http://autobuild.buildroot.net/results/1e602f1574e9134a44d5d66838e7851b38e8069a
> http://autobuild.buildroot.net/results/f1b4b129ec94795b2144b4501b4301fb20892e71

Tested with following patch:

build pc_x86_64_bios_defconfig changed to musl

$ ./utils/test-pkg -p ltp-testsuite -a
                             andes-nds32 [ 1/44]: OK
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: OK
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
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
                       br-m68k-5208-full [19/44]: SKIPPED
                      br-m68k-68040-full [20/44]: SKIPPED
                          br-nios2-glibc [21/44]: SKIPPED
                      br-openrisc-uclibc [22/44]: OK
                  br-powerpc-e500mc-full [23/44]: OK
               br-powerpc-603e-basic-cpp [24/44]: OK
             br-powerpc64le-power8-glibc [25/44]: OK
               br-powerpc64-power7-glibc [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                         br-sparc-uclibc [30/44]: SKIPPED
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
                          sourcery-nios2 [43/44]: SKIPPED
                         sourcery-x86-64 [44/44]: OK
44 builds, 7 skipped, 0 build failed, 0 legal-info failed

Kind regards,
Petr
