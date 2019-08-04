From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 12:57:59 +0200
Subject: [Buildroot] [git commit] package/gcc: remove gcc 4.9
Message-ID: <20190804121124.C8C7E88573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baf177502214a67619d9d0d6d0a780458e4d652d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to reduce the number of choice in gcc selection, remove the
gcc 4.9 version.

This version was kept due to libstdc++ ABI-incompatible changes and
other build issues with kernel and bootloader as reported by Arnout
[1].

Since then, gcc 4.9 is not supported any more since glibc 2.29 [2]
and recent kernel and bootloaders has been fixed to use more recent
compiler version.

[1] http://lists.busybox.net/pipermail/buildroot/2017-June/194374.html
[2] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   7 +
 ...et-68059-libgcc-should-not-use-__write-fo.patch |  43 --
 package/gcc/4.9.4/0002-m68k-coldfire-pr68467.patch |  48 --
 .../0003-libsanitizer-Use-pre-computed-size.patch  |  71 ---
 package/gcc/4.9.4/100-uclibc-conf.patch            |  15 -
 ...00-powerpc-link-with-math-lib.patch.conditional | 122 ----
 package/gcc/4.9.4/111-pr65730.patch                |  34 --
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  26 -
 package/gcc/4.9.4/130-pr43538.patch                |  25 -
 ...tizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch |  37 --
 package/gcc/4.9.4/301-missing-execinfo_h.patch     |  13 -
 package/gcc/4.9.4/810-arm-softfloat-libgcc.patch   |  30 -
 package/gcc/4.9.4/830-arm_unbreak_armv4t.patch     |  13 -
 .../840-microblaze-enable-dwarf-eh-support.patch   | 166 ------
 package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch   | 274 ---------
 package/gcc/4.9.4/860-cilk-wchar.patch             |  56 --
 .../870-xtensa-add-mauto-litpools-option.patch     | 287 ---------
 .../871-xtensa-reimplement-register-spilling.patch |  76 ---
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |  33 --
 .../gcc/4.9.4/873-xtensa-fix-_Unwind_GetCFA.patch  |  40 --
 .../gcc/4.9.4/874-xtensa-add-uclinux-support.patch | 169 ------
 .../gcc/4.9.4/875-xtensa-fix-PR-target-82181.patch |  31 -
 .../gcc/4.9.4/880-nios2_legitimize_address.patch   |  49 --
 package/gcc/4.9.4/890-fix-m68k-compile.patch       |  15 -
 package/gcc/4.9.4/900-musl-support.patch           | 640 ---------------------
 package/gcc/4.9.4/901-microblaze-uclibc.patch      |  21 -
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 -
 package/gcc/4.9.4/940-uclinux-enable-threads.patch |  20 -
 .../942-asan-fix-missing-include-signal-h.patch    |  36 --
 ...t_t-not-struct-ucontext-in-linux-unwind.h.patch | 190 ------
 package/gcc/4.9.4/944-sanitizer-linux.patch        |  88 ---
 package/gcc/Config.in.host                         |  18 +-
 package/gcc/gcc.hash                               |   2 -
 package/gcc/gcc.mk                                 |   6 -
 34 files changed, 8 insertions(+), 2707 deletions(-)

Patch is too large, so refusing to show it
