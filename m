From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 May 2017 21:45:46 +0200
Subject: [Buildroot] [PATCH v2 0/4] mpir build fixes
Message-ID: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This new version of the mpir build fixes series now fixes the build
for all 49 toolchain configurations, tested with the test-pkg script.

Changes since v1:

 - Fix a typo in the mips32r6/mips64r6 that originally made it useless
   (BR2_mips32r6 was used, while the option is name BR2_mips_32r6)

 - Add a patch to fix the powerpc64le build

Best regards,

Thomas

Thomas Petazzoni (4):
  mpir: fix build on ARM with old binutils versions
  mpir: fix build on ARM Thumb-only platforms
  mpir: fix build on mips32r6/mips64r6
  mpir: fix build on powerpc64le

 ...rm-udiv.asm-workaround-binutils-bug-14887.patch | 40 ++++++++++++++++++++++
 package/mpir/mpir.mk                               | 16 +++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch

-- 
2.7.4
