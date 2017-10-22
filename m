From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 22 Oct 2017 11:38:38 +0200
Subject: [Buildroot] [PATCH 0/4] Refactor in pc defconfigs
Message-ID: <20171022093842.21788-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series makes a small refactor in the pc configs and out grub usage
in them.

I am working on a aarch64-efi defconfig which will be very similar to
these pc defconfigs.
These refactors are some improvements that I backported to the pc
defconfigs while working on the future aarch64-efi one.

Erico Nunes (4):
  configs/pc: bump kernel version
  grub2: introduce BR2_TARGET_GRUB2_CFG
  configs/pc: refactor to use genimage and grub.cfg
  board/pc: add documentation for testing with qemu

 board/pc/grub-bios.cfg           |  6 ++++++
 board/pc/grub-efi.cfg            |  6 ++++++
 board/pc/post-image.sh           | 28 +--------------------------
 board/pc/readme.txt              | 42 ++++++++++++++++++++++++++++++++++++++++
 boot/grub2/Config.in             |  7 +++++++
 boot/grub2/grub2.mk              |  5 +++--
 configs/pc_x86_64_bios_defconfig | 10 ++++++----
 configs/pc_x86_64_efi_defconfig  | 10 ++++++----
 8 files changed, 77 insertions(+), 37 deletions(-)
 create mode 100644 board/pc/grub-bios.cfg
 create mode 100755 board/pc/grub-efi.cfg

-- 
2.13.6
