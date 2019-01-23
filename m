From: Nylon Chen <nylon7@andestech.com>
Date: Wed, 23 Jan 2019 20:39:44 +0800
Subject: [Buildroot] [PATCH v2 0/3] Add prebuilt nds32 toolchain,
 ae3xx board and autobuild configs support
Message-ID: <20190123123947.5084-1-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds basic support for Andes's nds32 ISA
and nds32 family's CPU IP based on ae3xx platform.
The board is entirely supported since Linux 4.17.

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
