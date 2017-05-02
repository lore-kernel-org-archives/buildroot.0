From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:40:03 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: use correct CPU
Message-ID: <20170502204009.3FF0582860@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a13a388dd444ee047f0e7b8c10f5e6c235ec5004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We so far were using a Cortex-A7 as the CPU for the rpi3, as this was
the closest we had available, in 32-bit mode, to the real CPU used in
the rpi3.

But now we can also use the Cortex-A53 in 32-bit mode, so we use that,
which makes for an optimised build (A53 has an improved instruction set,
as compared to the A7).

Also drop the DTB overlay option, it defaults to 'y'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Bark <martin@barkynet.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi3_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 1b2134e..f5bfebc 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -1,6 +1,5 @@
 BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_EABIHF=y
+BR2_cortex_a53=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -21,7 +20,6 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-cm3"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
