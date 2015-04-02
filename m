From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 10:15:49 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: install AMD Radeon
	firmware
Message-ID: <20150402081636.B10268195B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a7988bb282b9d1d0bfd015c9231015756ae5f60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David BARBION <david.barbion@ext.leroymerlin.fr>
[yann.morin.1998 at free.fr:
  - simplify by copying the full directory
  - fix title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    9 +++++++++
 package/linux-firmware/linux-firmware.mk |    5 +++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9e1eb91..7265990 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -17,6 +17,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
 
 endmenu # Audio
 
+menu "Video firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
+	bool "AMD Radeon video card firmware"
+	help
+	  Firmware files for AMD Radeon video cards.
+
+endmenu # Video
+
 menu "WiFi firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5a68138..0919b16 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -14,6 +14,11 @@ LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
+LINUX_FIRMWARE_DIRS += radeon
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.radeon
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
