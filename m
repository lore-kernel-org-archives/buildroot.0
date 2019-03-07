From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 7 Mar 2019 10:11:22 +0800
Subject: [Buildroot] [PATCH v2 0/3] Add prebuilt nds32 toolchain,
 ae3xx board and autobuild configs support
Message-ID: <20190307021125.8530-1-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v3:
    1) DEVELOPERS file must be alphabetic ordering of developer names
    2) removed BR2_TOOLCHAIN_HAS_NATIVE_RPC option
    3) removed package modifications because we do not support building nds32 toolchain by Buildroot
    4) replace BR2_LINUX_KERNEL_CUSTOM_VERSION and BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE with BR2_LINUX_KERNEL_CUSTOM_VERSION and BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
    5) add BR2_ANDES_NDS32_FPU option

v2:
    1) add BR2_GCC_TARGET_ARCH option
    2) add autobuild fragments
    3) replace BR2_LINUX_KERNEL_PATCH with BR2_GLOBAL_PATCH_DIR
    4) make savedefconfig  generate config file
    5) There can only be one author in DEVELOPERS file

Nylon Chen (3):
  arch: add support for Andes 32-bit (nds32) architecture
  configs/andes_nds32_ae3xx: new defconfig
  support/config-fragments: add Andes 32-bit (nds32) to autobuild
    configs

 DEVELOPERS                                    |  9 ++++++
 arch/Config.in                                | 13 ++++++++
 arch/Config.in.nds32                          | 31 +++++++++++++++++++
 board/andes/ae3xx/ae3xx.fragment              |  1 +
 ...0001-nds32-Fix-boot-messages-garbled.patch | 28 +++++++++++++++++
 configs/andes_ae3xx_defconfig                 | 14 +++++++++
 package/binutils/Config.in.host               |  2 ++
 package/gcc/Config.in.host                    |  4 +++
 package/linux-headers/Config.in.host          |  3 ++
 .../autobuild/br-andes-nds32-glibc.config     |  9 ++++++
 .../autobuild/toolchain-configs.csv           |  1 +
 11 files changed, 115 insertions(+)
 create mode 100644 arch/Config.in.nds32
 create mode 100644 board/andes/ae3xx/ae3xx.fragment
 create mode 100644 board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
 create mode 100644 configs/andes_ae3xx_defconfig
 create mode 100644 support/config-fragments/autobuild/br-andes-nds32-glibc.config

-- 
2.18.0
