From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Nov 2019 14:33:51 +0100
Subject: [Buildroot] [git commit branch/next]
 configs/raspberrypi3_64_defconfig: enable device tree overlay support
Message-ID: <20191109132719.83E538E91E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2aa92335cdc5f71c2d09391dc49fcf3c7627d6f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enables the usage of the standard Raspberry Pi overlays (as already
possible for all 32bit defconfigs and as expected by most Raspberry Pi
defconfig users), follow up patch will use the overlay feature to
enable the ttyS0 serial console in the same way as done for the
raspberrypi3_defconfig case (instead using an alternative approach).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi3_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index de1cd10c22..f9a6f5fe1f 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2837-rpi-3-b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
