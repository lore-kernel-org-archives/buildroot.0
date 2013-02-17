From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Feb 2013 00:10:25 +0100
Subject: [Buildroot] [pull request 'next'] Pull request for branch yem-ext234
Message-ID: <cover.1361142401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series enhances the ext2 fs backend to also build ext3 and ext4
filesystems, and differentiate between ext2 rev0 and ext2 rev1 filesystems.

Differentiating between ext2 rev0 and rev1 is needed for some bootloaders
that do not understand ext2 rev0, which is what genext2fs generates.


It should be applied after the host-image-tools series recently posted:
    http://lists.busybox.net/pipermail/buildroot/2013-February/067478.html
    http://patchwork.ozlabs.org/patch/221106/

The following changes since commit e6ac892795f7d87405c23cdb7a429508b1149b62:

  package/mtools: new host-package (2013-02-17 23:50:08 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-ext234

Yann E. MORIN (4):
      fs/ext2: enclose the ext2 options in if...endif
      fs/ext2: add ability to build ext3/4 too
      fs/ext2: rename to 'ext' as it can now build ext2/3/4 filesystems
      fs/ext: add support for ext2 rev0 and rev1

 board/arm/foundation-v8/readme.txt          |    2 +-
 board/boundarydevices/nitrogen6x/readme.txt |    8 +-
 board/qemu/arm-versatile/readme.txt         |    2 +-
 board/qemu/arm-vexpress/readme.txt          |    2 +-
 board/qemu/mips-malta/readme.txt            |    2 +-
 board/qemu/mips64-malta/readme.txt          |    2 +-
 board/qemu/mipsel-malta/readme.txt          |    2 +-
 board/qemu/powerpc-g3beige/readme.txt       |    2 +-
 board/qemu/sh4-r2d/readme.txt               |    2 +-
 board/qemu/sparc-ss10/readme.txt            |    2 +-
 board/qemu/x86/readme.txt                   |    2 +-
 board/qemu/x86_64/readme.txt                |    2 +-
 configs/arm_foundationv8_defconfig          |    2 +-
 configs/beaglebone_defconfig                |    2 +-
 configs/mx53loco_defconfig                  |    2 +-
 configs/nitrogen6x_defconfig                |    2 +-
 configs/pandaboard_defconfig                |    2 +-
 configs/qemu_arm_versatile_defconfig        |    2 +-
 configs/qemu_arm_vexpress_defconfig         |    2 +-
 configs/qemu_mips64_malta_defconfig         |    2 +-
 configs/qemu_mips_malta_defconfig           |    2 +-
 configs/qemu_mipsel_malta_defconfig         |    2 +-
 configs/qemu_ppc_g3beige_defconfig          |    2 +-
 configs/qemu_sh4_r2d_defconfig              |    2 +-
 configs/qemu_sparc_ss10_defconfig           |    2 +-
 configs/qemu_x86_64_defconfig               |    2 +-
 configs/qemu_x86_defconfig                  |    2 +-
 fs/Config.in                                |    2 +-
 fs/ext/Config.in                            |   76 +++++++++++++++++++++
 fs/ext/ext.mk                               |   27 ++++++++
 fs/ext/genextfs.sh                          |   96 +++++++++++++++++++++++++++
 fs/ext2/Config.in                           |   49 --------------
 fs/ext2/ext2.mk                             |   27 --------
 fs/ext2/genext2fs.sh                        |   36 ----------
 34 files changed, 230 insertions(+), 143 deletions(-)
 create mode 100644 fs/ext/Config.in
 create mode 100644 fs/ext/ext.mk
 create mode 100755 fs/ext/genextfs.sh
 delete mode 100644 fs/ext2/Config.in
 delete mode 100644 fs/ext2/ext2.mk
 delete mode 100755 fs/ext2/genext2fs.sh

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
