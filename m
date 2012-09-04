From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Sep 2012 16:09:52 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	update-mips-support
Message-ID: <cover.1346767632.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the patch set that clarifies MIPS support,
and especially MIPS64 support.

It has four patches:

 * First patch refactors some uclibc.mk to use the existing BR2_ENDIAN
   config option rather than doing the same work again.

 * Second patch reworks the config option for mips. It creates two
   separate two level architectures for MIPS and MIPS64, and then
   clarifies the ABI names and config options.

 * Third patch (from Gustavo) remove old MIPS64 related toolchain
   kludge

 * Fourth patch (from Gustavo) adds a defconfig to build a mips64
   system for Qemu

Changes since v2:
 * None, except rebasing on master.

Changes since v1:

 * Addition of the first, third and fourth patches.
 * Separation of top-level mips64 architectures.
 * Simplification of uClibc code to find the architecture.

Best regards,

Thomas


The following changes since commit 27045cde7d18f6132ab804ed30673e3fb3961879:

  gcc: default to 4.6.x (2012-09-04 13:28:03 +0200)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git update-mips-support

for you to fetch changes up to 0d47f0d4b6ef8c47d226854c736b9bc87a00073a:

  qemu/mips64-malta: add new sample config (2012-09-04 16:06:51 +0200)

----------------------------------------------------------------
Gustavo Zacarias (2):
      mips64: remove toolchain kludge
      qemu/mips64-malta: add new sample config

Thomas Petazzoni (2):
      uClibc: use BR2_ENDIAN to simplify endianess selection
      Clarify MIPS ABIs support

 board/qemu/mips64-malta/linux-3.3.config |   78 ++++++++++++++++++++++++++++++
 board/qemu/mips64-malta/readme.txt       |    7 +++
 configs/qemu_mips64_malta_defconfig      |   24 +++++++++
 package/Makefile.in                      |    4 --
 target/Config.in.arch                    |   60 +++++++++++++----------
 toolchain/uClibc/uclibc.mk               |   24 ++-------
 6 files changed, 149 insertions(+), 48 deletions(-)
 create mode 100644 board/qemu/mips64-malta/linux-3.3.config
 create mode 100644 board/qemu/mips64-malta/readme.txt
 create mode 100644 configs/qemu_mips64_malta_defconfig

Thanks,
-- 
Thomas Petazzoni
