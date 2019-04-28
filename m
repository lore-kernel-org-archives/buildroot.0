From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 28 Apr 2019 15:49:36 +0100
Subject: [Buildroot] [PATCH v2 0/3] Add support for HiFive Unleashed board
Message-ID: <20190428144939.28964-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I've regenerated the patches to add support for the SiFive HiFive
Unleashed board. I tried to add support for a 5.0 series kernel, but
couldn't get the system to boot. This needs further investigation,
so I've gone with my original plan to use the 4.20.17 kernel. I've
created a new github repository for the patched kernel. This will
eventually be deprecated in favour of a 5.0 or 5.1 series kernel.

Changes v1 -> v2:
  - moved generation of bbl binary file in riscv-pk.mk from
    INSTALL_CMDS to BUILD_CMDS (Arnout)
  - added new patch to modify riscv-pk build scripts to remove
    hardcoding of ABI.
  - removed the large kernel patch and replaced it with a custom
    git repository (Arnout)
  - reduced the kernel config fragment to a minimum (Arnout)
  - use a separate root filesystem instead of a linked-in
    initramfs image (Arnout)
  - changed naming convention from sifive-u540* to
    sifive_hifive* (Arnout)
  - added post-image script to generate a complete SD card image
    file (Arnout)
  - updated the default configuration to make use of compressed
    instructions and the lp64d ABI for builds.
  - updated the DEVELOPERS file.


Regards

Mark



Mark Corbin (3):
  boot/riscv-pk: add generation of binary bbl file
  boot/riscv-pk: remove hardcoding of the ABI
  board/sifive: add support for the HiFive Unleashed board

 DEVELOPERS                                    |  1 +
 .../hifive-unleashed/linux.config.fragment    | 14 ++++
 board/sifive/hifive-unleashed/post-image.sh   | 37 ++++++++++
 board/sifive/hifive-unleashed/readme.txt      | 65 +++++++++++++++++
 ...-specify-ABI-or-use-compiler-default.patch | 72 +++++++++++++++++++
 boot/riscv-pk/riscv-pk.mk                     |  7 +-
 configs/sifive_hifive_unleashed_defconfig     | 31 ++++++++
 7 files changed, 225 insertions(+), 2 deletions(-)
 create mode 100644 board/sifive/hifive-unleashed/linux.config.fragment
 create mode 100755 board/sifive/hifive-unleashed/post-image.sh
 create mode 100644 board/sifive/hifive-unleashed/readme.txt
 create mode 100644 boot/riscv-pk/0001-Add-ability-to-specify-ABI-or-use-compiler-default.patch
 create mode 100644 configs/sifive_hifive_unleashed_defconfig

-- 
2.19.1
