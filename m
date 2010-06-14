From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 13:54:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	ext-toolchain-fixes
Message-ID: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch set improving the support for external toolchains,
after testing with Buildroot x86-64 toolchain, Crosstool-NG x86-64
toolchain, MIPS and PowerPC CodeSourcery toolchains.

The MIPS CodeSourcery toolchain is not fully supported yet: it is a
very smart multilib toolchain, which supports both glibc and uclibc in
a single toolchain, with -muclibc being the gcc flag to switch to
uClibc. For the moment, only the default variant (glibc) is supported.

This patchset only touches toolchain/external-toolchain/ext-tool.mk,
except for a patch that is added to uClibc to fix fcntl64() on 64 bits
targets. This patch is already upstream in the master branch, and a
bug has been filled into the uClibc bug tracker to ask for this patch
to be merged into the 0.9.31 branch.

Thomas

The following changes since commit 7c709f4affc44f3bbc9a09fec8d84ae3807e31e7:
  Peter Korsgaard (1):
        file: don't force _GNU_SOURCE in CFLAGS

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

 toolchain/external-toolchain/ext-tool.mk           |   92 +++++++++++++-------
 ...ibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch |   34 +++++++
 2 files changed, 96 insertions(+), 30 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-fix-fcntl64-for-64-bit-targets.patch

Thanks,
-- 
Thomas Petazzoni
