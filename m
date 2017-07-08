From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Jul 2017 16:08:34 +0200
Subject: [Buildroot] [PATCH 0/4 v2] arch/arm: introduce big.LITTLE
	configurations
Message-ID: <cover.1499522760.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds four new CPU variants to the arm choice, to enable
optimising for big.LITTLE CPUs.

We first fix the current values in the first patch, then introduce the
actual new variants, and then make use of them in the sole package that
needs to know of them.

This has been only slightly tested by simply building the toolchains for
the six possibilities:
  - the four variants in arm mode (32-bit),
  - the two armv8 variants in aarch64 mode (64-bit).

The variants were introduced in various versions of gcc, so we protect
the internal gcc as well as the external toolchains accordingly.

To be noted: openblas also has a cortex-a15 optimisation, so maybe that
optimisation can also be used for the cortex-a15.cortex-a7 variant as
well. But I have absolutely no clue what openblas is doing with that
anyway, so I left it alone for someone else to deal with...


Regards,
Yann E. MORIN.


The following changes since commit 644c024edeb7e20bd96ce4426aeca2cbcd74d9b9

  syslinux: drop patch 0003, not needed after gnu-efi update (2017-07-04 18:45:26 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d1065a08c9b2a83d4611a6566f068528a5b1ca3c

  package/kvm-unit-test: available for big.LITTLE arm cores too (2017-07-08 15:51:23 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      arch/arm: fix -mcpu default values for AArch64
      package/kvm-unit-tests: introduce _ARCH_SUPPORTS
      arch/arm: add big.LITTLE cpu variants
      package/kvm-unit-test: available for big.LITTLE arm cores too

 arch/Config.in.arm                                 | 50 ++++++++++++++++++----
 package/gcc/Config.in.host                         |  5 ++-
 package/kvm-unit-tests/Config.in                   | 19 ++++----
 .../Config.in                                      |  2 +
 .../toolchain-external-codesourcery-arm/Config.in  |  4 ++
 5 files changed, 62 insertions(+), 18 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
