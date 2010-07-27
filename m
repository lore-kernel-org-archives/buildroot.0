From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:02:20 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	avr32-toolchain-fix
Message-ID: <cover.1280264418.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the fix for the AVR32 toolchain build problem, but it makes a
change that impacts all other architectures as well. Instead of using
an incorrect --prefix=/usr for binutils and gcc, we use the correct
--prefix=$(STAGING_DIR)/usr.

With this fix in place, I can build the AVR32 toolchain and an AVR32
system with Busybox and DirectFB. However, I couldn't test it as I
don't have ARV32 hardware and Qemu doesn't support AVR32.

I have also tested an ARM internal Buildroot toolchain + DirectFB, it
builds and runs in Qemu. I also tested an ARM external Buildroot
toolchain + DirectFB system, it builds and runs in Qemu as well.

Thanks,

Thomas

The following changes since commit f2860bbc8ea6ff959b91eaa8919177d273ee4497:
  Peter Korsgaard (1):
        Merge branch 'fix-gxx-on-target' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot avr32-toolchain-fix

Thomas Petazzoni (3):
      binutils,gcc: use correct --prefix
      toolchain: Remove now-unused variables
      toolchain: remove redundant and incorrect --with-build-time-tools option

 toolchain/Makefile.in           |    2 --
 toolchain/binutils/binutils.mk  |    6 ++----
 toolchain/gcc/Makefile.in       |    2 --
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++--
 4 files changed, 4 insertions(+), 10 deletions(-)

Thanks,
-- 
Thomas Petazzoni
