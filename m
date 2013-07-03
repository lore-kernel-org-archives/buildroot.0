From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 23:00:02 +0200
Subject: [Buildroot] [git commit] toolchain: switch to using gcc through
	package infrastructure
Message-ID: <20130704095650.D0F189A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e236fe481e5f8c4cd4984f39dc37dbf19c8d8eda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                           |    2 +-
 package/Config.in                                  |    1 -
 .../1001-gcc-4.2.x-inhibit-libc.patch              |    0
 ...-fix-removal-of-redundant-cast-operations.patch |    0
 ...conditional-insn-which-clobbers-cc_status.patch |    0
 ...use-movh-to-move-immediates-into-register.patch |    0
 .../gcc/4.3.6/100-uclibc-conf.patch                |    0
 .../gcc/4.3.6/104-gnuhurd-uclibc-conf.patch        |    0
 .../gcc/4.3.6/301-missing-execinfo_h.patch         |    0
 .../gcc/4.3.6/302-c99-snprintf.patch               |    0
 .../gcc/4.3.6/305-libmudflap-susv3-legacy.patch    |    0
 .../gcc/4.3.6/810-arm-softfloat-libgcc.patch       |    0
 .../4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch |    0
 .../gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch    |    0
 .../gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch  |    0
 .../4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch    |    0
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |    0
 .../gcc/4.3.6/gcc-43-pr39429.patch                 |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |    0
 .../gcc/4.4.7/100-uclibc-conf.patch                |    0
 .../gcc/4.4.7/301-missing-execinfo_h.patch         |    0
 .../gcc/4.4.7/302-c99-snprintf.patch               |    0
 .../gcc/4.4.7/305-libmudflap-susv3-legacy.patch    |    0
 .../gcc/4.4.7/810-arm-softfloat-libgcc.patch       |    0
 .../gcc/4.4.7/950-sparc-leon.patch                 |    0
 .../gcc/4.4.7/gcc-44-pr39429.patch                 |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 .../gcc/4.5.4/100-uclibc-conf.patch                |    0
 .../gcc/4.5.4/301-missing-execinfo_h.patch         |    0
 .../gcc/4.5.4/302-c99-snprintf.patch               |    0
 .../gcc/4.5.4/305-libmudflap-susv3-legacy.patch    |    0
 .../gcc/4.5.4/810-arm-softfloat-libgcc.patch       |    0
 .../gcc/4.5.4/820-arm-unbreak-armv4t.patch         |    0
 .../gcc/4.5.4/830-arm-pr43440.patch                |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 .../gcc/4.6.4/100-uclibc-conf.patch                |    0
 .../gcc/4.6.4/301-missing-execinfo_h.patch         |    0
 .../gcc/4.6.4/302-c99-snprintf.patch               |    0
 .../gcc/4.6.4/305-libmudflap-susv3-legacy.patch    |    0
 .../gcc/4.6.4/810-arm-softfloat-libgcc.patch       |    0
 .../gcc/4.6.4/820-arm-unbreak-armv4t.patch         |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 .../gcc/4.7.3/100-uclibc-conf.patch                |    0
 .../gcc/4.7.3/301-missing-execinfo_h.patch         |    0
 .../gcc/4.7.3/302-c99-snprintf.patch               |    0
 .../gcc/4.7.3/305-libmudflap-susv3-legacy.patch    |    0
 .../gcc/4.7.3/810-arm-softfloat-libgcc.patch       |    0
 .../gcc/4.7.3/830-arm_unbreak_armv4t.patch         |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 .../gcc/4.8.1/100-uclibc-conf.patch                |    0
 .../gcc/4.8.1/301-missing-execinfo_h.patch         |    0
 .../gcc/4.8.1/302-c99-snprintf.patch               |    0
 .../gcc/4.8.1/305-libmudflap-susv3-legacy.patch    |    0
 .../gcc/4.8.1/810-arm-softfloat-libgcc.patch       |    0
 .../gcc/4.8.1/830-arm_unbreak_armv4t.patch         |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |  130 ----
 toolchain/gcc/Config.in.2                          |   34 -
 toolchain/gcc/gcc-uclibc-4.x.mk                    |  640 --------------------
 toolchain/toolchain-buildroot.mk                   |    7 +-
 toolchain/toolchain-buildroot/Config.in            |    2 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/uClibc/uclibc.mk                         |   36 +-
 65 files changed, 23 insertions(+), 831 deletions(-)

Patch is too large, so refusing to show it
