From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 May 2017 11:11:04 +0200
Subject: [Buildroot] [PATCH] config/raspberrypi3: use correct CPU
Message-ID: <20170501091104.3183-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Martin, Peter, you are the last ones to have touched this defconfig, and
I lack a rpi3. Would you be kind enough to test this on your hw, please?
---
 configs/raspberrypi3_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 1b2134e0bb..f5bfebcb83 100644
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
-- 
2.11.0
