From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:10:44 +0200
Subject: [Buildroot] [RFC] Development around Coldfire
Message-ID: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The work enclosed in the patches is not fully-working yet, but I
wanted to share it so that others can help, and to avoid others in
trying to do the same thing.

Basically, the goal of this patch set is to add a defconfig for the
MCF5208 Coldfire platform emulated by Qemu, which is a non-MMU
platform.

The proposed defconfig generates a system where the kernel boots, but
panics when the first userspace program exits (the kernel complains
that someone tried to kill init).

I think patches 1 to 4 could be merged now, while the 5th patch
(adding the defconfig) needs more work to fix this problem before
being submitted. The other annoying part is that a patch for Qemu is
also needed (it is part of this 5th patch).

Note that I have also done a similar work on the AT91 ARM noMMU
platform emulated by SkyEye. I hope to send the patches soon.

Thomas

The following changes since commit 8876b6751e0bc19a3754290061808f0f8420708e:

  Fix makedevs to allow longer path names (2012-04-08 19:46:52 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/coldfire

Thomas Petazzoni (5):
      arch: re-enable m68k and add a few architecture variants
      toolchain: add Coldfire external toolchain from Sourcery CodeBench
      toolchain: add m68k to the list of arch that can work without MMU
      busybox: enable useful hush suboptions
      board: add support for Coldfire MCF5208EVB board emulated by Qemu

 .../qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch |   25 +++++++
 board/qemu/m68k-mcf5208evb/linux-3.3.config        |   71 ++++++++++++++++++++
 .../qemu-mcfint-masking-support.patch              |   42 ++++++++++++
 board/qemu/m68k-mcf5208evb/readme.txt              |   14 ++++
 configs/qemu_m68k_mcf5208_evb_defconfig            |   14 ++++
 package/busybox/busybox.mk                         |    5 ++
 target/Config.in.arch                              |   41 +++++++++++-
 toolchain/toolchain-common.in                      |    2 +-
 toolchain/toolchain-external/Config.in             |   41 +++++++++++
 toolchain/toolchain-external/ext-tool.mk           |    3 +
 10 files changed, 256 insertions(+), 2 deletions(-)
 create mode 100644 board/qemu/m68k-mcf5208evb/linux-3.3-sw-ustack.patch
 create mode 100644 board/qemu/m68k-mcf5208evb/linux-3.3.config
 create mode 100644 board/qemu/m68k-mcf5208evb/qemu-mcfint-masking-support.patch
 create mode 100644 board/qemu/m68k-mcf5208evb/readme.txt
 create mode 100644 configs/qemu_m68k_mcf5208_evb_defconfig

Thanks,
-- 
Thomas Petazzoni
