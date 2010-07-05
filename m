From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jul 2010 18:58:53 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	ext-toolchain-fixes
Message-ID: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of my ext-toolchain-fixes branch, which fixes
the problem noted by Peter on the sysroot detection code.

We switch to --sysroot=/path/to instead of --sysroot /path/to, which
eases the filtering of this option, which is needed to find out the
original location of the toolchain sysroot.

Thanks,

Thomas

The following changes since commit f4abd4e61215b119d38ccba011a901732ce704e4:
  Peter Huewe (1):
        docs: Fixed spelling error in buildroot.html GETTEXT instead of GNUTTEXT

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot ext-toolchain-fixes

Thomas Petazzoni (10):
      ext-toolchains: take into account other Glibc dynamic loader variants
      ext-toolchain: Fix ARCH_SYSROOT detection
      external-toolchain: only copy existing directories of the sysroot
      external-toolchain: support 64 bits glibc toolchains
      external-toolchain: create lib64 symlinks if needed
      external-toolchain: mention MIPS and PowerPC CodeSourcery toolchains
      external-toolchain: recognize uClibc 64 bits toolchains
      uclibc: add patch to fix fcntl64() on 64 bits targets
      external-toolchain: handle libstdc++/libgcc_s for BR toolchains
      external-toolchain: hardcode the destination directory for a library

 package/Makefile.in                                |    4 +-
 toolchain/external-toolchain/ext-tool.mk           |   92 +++++++++++++-------
 ...ibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch |   34 +++++++
 3 files changed, 98 insertions(+), 32 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch

Thanks,
-- 
Thomas Petazzoni
