From: Nylon Chen <nylon7@andestech.com>
Date: Tue, 2 Apr 2019 15:23:38 +0800
Subject: [Buildroot] [PATCH v4 0/2] Add prebuilt nds32 toolchain, ae3xx board
Message-ID: <20190402072340.17989-1-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4:
    1) removed BR2_ANDES_NDS32_FPU option
    2) removed test the Andes nds32 toolchain patch

v3:
    1) DEVELOPERS file must be alphabetic ordering of developer names
    2) removed BR2_TOOLCHAIN_HAS_NATIVE_RPC option
    3) removed package modifications because we do not support building nds32 toolchain by Buildroot
    4) replace BR2_LINUX_KERNEL_CUSTOM_VERSION and BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE with BR2_LINUX_KERNEL_CUSTOM_VERSION and BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
    5) add BR2_ANDES_NDS32_FPU option

Nylon Chen (2):
  arch: add support for Andes 32-bit(nds32)
  configs/andes_nds32_ae3xx: new defconfig

 DEVELOPERS                                    |  5 ++
 arch/Config.in                                | 12 +++++
 arch/Config.in.nds32                          | 11 +++++
 board/andes/ae3xx/ae3xx.fragment              |  1 +
 ...0001-nds32-Fix-boot-messages-garbled.patch | 28 +++++++++++
 board/andes/readme.txt                        | 49 +++++++++++++++++++
 configs/andes_ae3xx_defconfig                 | 14 ++++++
 7 files changed, 120 insertions(+)
 create mode 100644 arch/Config.in.nds32
 create mode 100644 board/andes/ae3xx/ae3xx.fragment
 create mode 100644 board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
 create mode 100644 board/andes/readme.txt
 create mode 100644 configs/andes_ae3xx_defconfig

-- 
2.18.0
