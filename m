From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:18:32 +0100
Subject: [Buildroot] [git commit] package/gcc: remove version 5.5.5
Message-ID: <20200324210548.9F08988188@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf2074dbd3c4f2700e1de4afd6d6ce1f97e8d99d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 9.2 is around, gcc 8.4 is the default version, so drop
5.5 in order to reduce the gcc choice.

GCC 5.5 was disabled for Glibc based toolchain since Glibc
2.30 needs GCC 6.2 or later.

See:
https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |   9 +
 package/gcc/5.5.0/0001-m68k-coldfire-pr68467.patch |  48 ----
 .../0002-libsanitizer-Use-pre-computed-size.patch  |  72 -----
 package/gcc/5.5.0/100-uclibc-conf.patch            |  15 --
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  29 ---
 package/gcc/5.5.0/301-missing-execinfo_h.patch     |  13 -
 package/gcc/5.5.0/810-arm-softfloat-libgcc.patch   |  30 ---
 package/gcc/5.5.0/830-arm_unbreak_armv4t.patch     |  15 --
 ...et-70473-Reduce-size-of-Cortex-A8-automat.patch |  68 -----
 .../840-microblaze-enable-dwarf-eh-support.patch   | 166 ------------
 package/gcc/5.5.0/850-libstdcxx-uclibc-c99.patch   | 273 -------------------
 package/gcc/5.5.0/860-cilk-wchar.patch             |  56 ----
 .../870-xtensa-add-mauto-litpools-option.patch     | 290 ---------------------
 .../871-xtensa-reimplement-register-spilling.patch |  76 ------
 .../gcc/5.5.0/874-xtensa-add-uclinux-support.patch | 174 -------------
 .../5.5.0/875-xtensa-implement-trap-pattern.patch  |  67 -----
 .../5.5.0/880-gcc-nios2-Add-IJMP_REGS-enum.patch   | 103 --------
 package/gcc/5.5.0/890-fix-m68k-compile.patch       |  15 --
 .../5.5.0/900-libitm-fixes-for-musl-support.patch  |  65 -----
 .../901-fixincludes-update-for-musl-support.patch  |  32 ---
 package/gcc/5.5.0/902-unwind-fix-for-musl.patch    |  36 ---
 ...dc++-libgfortran-gthr-workaround-for-musl.patch |  80 ------
 package/gcc/5.5.0/904-musl-libc-config.patch       | 285 --------------------
 .../gcc/5.5.0/905-add-musl-support-to-gcc.patch    | 130 ---------
 package/gcc/5.5.0/906-mips-musl-support.patch      |  37 ---
 package/gcc/5.5.0/907-x86-musl-support.patch       |  45 ----
 package/gcc/5.5.0/908-arm-musl-support.patch       |  45 ----
 package/gcc/5.5.0/909-aarch64-musl-support.patch   |  33 ---
 .../gcc/5.5.0/910-microblaze-musl-and-uclibc.patch |  36 ---
 package/gcc/5.5.0/911-ppc-musl-support.patch       |  75 ------
 package/gcc/5.5.0/912-sh-musl-support.patch        |  50 ----
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 -
 package/gcc/5.5.0/940-uclinux-enable-threads.patch |  19 --
 .../941-mips-Add-support-for-mips-r6-musl.patch    |  43 ---
 package/gcc/Config.in.host                         |  14 -
 package/gcc/gcc.hash                               |   2 -
 36 files changed, 9 insertions(+), 2551 deletions(-)

Patch is too large, so refusing to show it
