From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:26:06 +0200
Subject: [Buildroot] [git commit] rpi-firmware: Fixup config.txt
Message-ID: <20130502212800.9DD6B999F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d2c99565856fa96320019dfb7b81fd18e66311f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default name of the kernel binary for the RaspberryPi is kernel.img,
it's only a zImage kernel renamed.  Since Buildroot will build a zImage, the
default config should use the zImage name instead of forcing the user to
rename a file.

This patch also remove the cmdline argument rootfstype. There is no point
forcing the user to use ext4 for its root partition.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-firmware/config.txt |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index 2cabd68..a818762 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -6,9 +6,10 @@
 
 arm_freq=700
 core_freq=250
+kernel=zImage
 disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 sdram_freq=400
 over_voltage=0
-cmdline="dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
+cmdline="dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootwait"
