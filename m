From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:45:48 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.9 series to 4.9.4
Message-ID: <20160804204623.02DD381F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50c02bd72b1e035544c0c07bb857cab99c04a6e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Two patches are removed, as they have been upstreamed:

 - 130-fix_build_with_gcc-6.patch (svn commit 233721, Git commit
   8c3fa311caa86f61b4e28d1563d1110b44340fb2)

 - 920-libgcc-remove-unistd-header.patch (svn commit 226092, Git commit
   e940d7953f06af11d09229a29ecbcc1ba25b378d)

All other patches have simply been refreshed, with no manual edit
needed.

A build+runtime test has been done with an ARM, Cortex-A8, EABIhf, musl
configuration, booted under Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/4.9.3/130-fix_build_with_gcc-6.patch   | 153 ------------
 package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch   | 255 -------------------
 .../4.9.3/920-libgcc-remove-unistd-header.patch    |  12 -
 package/gcc/{4.9.3 => 4.9.4}/100-uclibc-conf.patch |   0
 ...00-powerpc-link-with-math-lib.patch.conditional |  28 +--
 package/gcc/{4.9.3 => 4.9.4}/111-pr65730.patch     |   9 +-
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch |  11 +-
 package/gcc/{4.9.3 => 4.9.4}/130-pr43538.patch     |   0
 ...tizer-Fix-build-with-_FILE_OFFSET_BITS-64.patch |   0
 .../{4.9.3 => 4.9.4}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |  14 +-
 .../{4.9.3 => 4.9.4}/830-arm_unbreak_armv4t.patch  |   0
 .../840-microblaze-enable-dwarf-eh-support.patch   |  39 ++-
 package/gcc/4.9.4/850-libstdcxx-uclibc-c99.patch   | 274 +++++++++++++++++++++
 package/gcc/{4.9.3 => 4.9.4}/860-cilk-wchar.patch  |   0
 .../870-xtensa-add-mauto-litpools-option.patch     |  61 +++--
 .../871-xtensa-reimplement-register-spilling.patch |   0
 ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch |   0
 .../873-xtensa-fix-_Unwind_GetCFA.patch            |   0
 .../874-xtensa-add-uclinux-support.patch           |  25 +-
 .../880-nios2_legitimize_address.patch             |   0
 .../{4.9.3 => 4.9.4}/890-fix-m68k-compile.patch    |   0
 .../{4.9.3 => 4.9.4}/891-fix-m68k-uclinux.patch    |   0
 .../gcc/{4.9.3 => 4.9.4}/900-musl-support.patch    |  14 +-
 .../{4.9.3 => 4.9.4}/901-microblaze-uclibc.patch   |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 .../940-uclinux-enable-threads.patch               |   9 +-
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 29 files changed, 374 insertions(+), 536 deletions(-)

Patch is too large, so refusing to show it
