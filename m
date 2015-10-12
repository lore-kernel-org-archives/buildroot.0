From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 23:58:12 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi: use EABIhf
Message-ID: <20151012215827.0CBBF81955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5f874596b81f18e8763e23205fa3ee646514477
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SoC of the Raspberry Pi 1 is an ARM1176JZF-S, which features a VFPv2
FPU, so use the EABIhf target ABI, which is more efficient than EABI.
This is also the default on Raspbian.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index af702a3..2d47058 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_arm1176jzf_s=y
+BR2_ARM_EABIHF=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
