From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 May 2017 23:40:52 +0200
Subject: [Buildroot] [PATCH 0/3] mpir build fixes
Message-ID: <1494193255-15762-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This short series fixed the build of mpir with 5 toolchain
configurations:

 - Crosstool-NG ARMv5 and ARMv7 toolchains

 - Buildroot ARM/Cortex-M4 toolchain

 - Buildroot mips32r6 and mips64r6 toolchains

There are still other mpir build issues with other toolchains, but I
thought I would send the ones I have right now.

Best regards,

Thomas

Thomas Petazzoni (3):
  mpir: fix build on ARM with old binutils versions
  mpir: fix build on ARM Thumb-only platforms
  mpir: fix build on mips32r6/mips64r6

 ...rm-udiv.asm-workaround-binutils-bug-14887.patch | 40 ++++++++++++++++++++++
 package/mpir/mpir.mk                               | 11 ++++++
 2 files changed, 51 insertions(+)
 create mode 100644 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch

-- 
2.7.4
