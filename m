From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  6 Nov 2019 21:44:33 +0100
Subject: [Buildroot] [PATCH 4/5] configs/raspberrypi3_64_defconfig: enable
 device tree overlay support
In-Reply-To: <20191106204434.24898-1-ps.report@gmx.net>
References: <20191106204434.24898-1-ps.report@gmx.net>
Message-ID: <20191106204434.24898-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

Only the 64bit RPi compile seems to need the extra enabling
of device tree overlay support (the 32bit ones seem to do
it automatically). But for symmetry all RPi defconfigs should
set BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT?
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

--
2.23.0
