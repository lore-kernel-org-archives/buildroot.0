From: Nylon Chen <nylon7@andestech.com>
Date: Tue, 16 Apr 2019 15:25:41 +0800
Subject: [Buildroot] [PATCH v5 0/4] Add prebuilt nds32 toolchain,
 ae3xx board and autobuild configs support
Message-ID: <20190416072545.17633-1-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v5:
    1) add toolchain-external-andes-nds32/*
    2) add autobuild configs support

v4:
    1) removed BR2_ANDES_NDS32_FPU option
    2) removed test the Andes nds32 toolchain patch

Nylon Chen (4):
  arch: add support for Andes 32-bit(nds32)
  configs/andes_nds32_ae3xx: new defconfig
  toolchain-external-andes-nds32: new package
  support/config-fragments/autobuild: test the Andes nds32 toolchain

 DEVELOPERS                                    |  6 +++
 arch/Config.in                                | 12 +++++
 arch/Config.in.nds32                          | 11 +++++
 board/andes/ae3xx/ae3xx.fragment              |  1 +
 ...0001-nds32-Fix-boot-messages-garbled.patch | 28 +++++++++++
 board/andes/readme.txt                        | 49 +++++++++++++++++++
 configs/andes_ae3xx_defconfig                 | 14 ++++++
 .../autobuild/andes-nds32.config              |  3 ++
 .../autobuild/toolchain-configs.csv           |  1 +
 toolchain/toolchain-external/Config.in        |  3 ++
 .../toolchain-external-andes-nds32/Config.in  |  9 ++++
 .../Config.in.options                         | 14 ++++++
 .../toolchain-external-andes-nds.hash         |  2 +
 .../toolchain-external-andes-nds.mk           | 10 ++++
 14 files changed, 163 insertions(+)
 create mode 100644 arch/Config.in.nds32
 create mode 100644 board/andes/ae3xx/ae3xx.fragment
 create mode 100644 board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
 create mode 100644 board/andes/readme.txt
 create mode 100644 configs/andes_ae3xx_defconfig
 create mode 100644 support/config-fragments/autobuild/andes-nds32.config
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk

-- 
2.18.0
