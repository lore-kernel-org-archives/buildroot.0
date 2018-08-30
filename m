From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Aug 2018 22:34:40 -0500
Subject: [Buildroot] [PATCH v2 0/5] Hardening Wrapper Updates and Test
Message-ID: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series looks to complete the implementation and migration of
hardening related options to the compiler and (new) linker wrapper.

The series provides runtime testing for RELRO/SSP/FORTIFY.

v1 -> v2
 - There were issues when I started regression testing where
   packages where providing multiple pie/pic/shared args on
   a single call of gcc/ld.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
CC: Jan Kundr?t <jan.kundrat@cesnet.cz>
CC: Stefan S?rensen <stefan.sorensen@spectralink.com>

Matt Weber (5):
  toolchain/toolchain-wrapper: add link wrapper
  toolchain/toolchain-wrapper: add BR2_RELRO_FULL support
  toolchain/toolchain-wrapper: add BR2_SSP_* support
  toolchain/toolchain-wrapper: add BR2_FORTIFY_SOURCE_* support
  support/testing/tests/core: SSP & hardening flags

 .gitlab-ci.yml                                     |   6 +
 package/Makefile.in                                |  19 +-
 package/gcc/gcc.mk                                 |  12 +-
 support/testing/tests/core/test_hardening.py       | 110 +++++++++
 .../toolchain-external/pkg-toolchain-external.mk   |  12 +-
 toolchain/toolchain-wrapper-linker.c               | 273 +++++++++++++++++++++
 toolchain/toolchain-wrapper.c                      |  58 ++++-
 toolchain/toolchain-wrapper.mk                     |  24 ++
 8 files changed, 495 insertions(+), 19 deletions(-)
 create mode 100644 support/testing/tests/core/test_hardening.py
 create mode 100644 toolchain/toolchain-wrapper-linker.c

-- 
1.9.1
