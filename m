From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 19:17:29 +0200
Subject: [Buildroot] [git commit] rpi-firmware: modify settings for Pi 2
Message-ID: <20150502171737.27FE580745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38c9ac40f9fc0e49c02bc56faee493d5dedb7332
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove low-level settings from config.txt like arm_freq and sdram_freq.
The defaults should be good for most and differ by Pi model.
E.g. the Pi 2 runs at 900 Mhz by default, setting arm_freq=700
like we had previously would underclock it.

Add short description in comments to options.
Mention initramfs option.

Remove obsolete options from cmdline.txt

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/cmdline.txt |    2 +-
 package/rpi-firmware/config.txt  |   14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
index 061e54b..38aa378 100644
--- a/package/rpi-firmware/cmdline.txt
+++ b/package/rpi-firmware/cmdline.txt
@@ -1 +1 @@
-dwc_otg.fiq_fix_enable=1 sdhci-bcm2708.sync_after_dma=0 dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootwait
+root=/dev/mmcblk0p2 rootwait
diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index 994972b..aa8d2ab 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -4,11 +4,17 @@
 # See http://buildroot.org/downloads/manual/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-arm_freq=700
-core_freq=250
 kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
 disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
 gpu_mem_256=100
 gpu_mem_512=100
-sdram_freq=400
-over_voltage=0
+gpu_mem_1024=100
