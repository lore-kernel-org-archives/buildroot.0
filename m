From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Aug 2018 23:26:40 -0500
Subject: [Buildroot] [RFC 0/3] Hardening Wrapper Support
Message-ID: <1534220803-26737-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I took an attempt at the start of the wrapper update.  This is
still missing fortify and stack protector options being migrated.

I would assume these patches need cleanup as I was sloppy with the
linker wrapper including the relro stuff, but I wanted to get an
understanding of what I might have missed.


Matt Weber (3):
  toolchain/toolchain-wrapper: add linker wrapper
  hardening testing: busybox test case to verify linker wrapper behavior
    with -r
  toolchain/toolchain-wrapper: add BR2_RELRO_FULL support

 package/gcc/gcc.mk                                 |   7 +
 support/testing/tests/core/test_hardening.py       |   2 +-
 .../toolchain-external/pkg-toolchain-external.mk   |   3 +
 toolchain/toolchain-wrapper-ld.c                   | 252 +++++++++++++++++++++
 toolchain/toolchain-wrapper.c                      |  19 +-
 toolchain/toolchain-wrapper.mk                     |  10 +
 6 files changed, 291 insertions(+), 2 deletions(-)
 create mode 100644 toolchain/toolchain-wrapper-ld.c

-- 
1.9.1
