From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  3 Jun 2019 18:40:39 -0400
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: fix license hash
Message-ID: <20190603224039.98733-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The new license is under license.md not license.rst, which will cause
"make legal-info" to fail.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 394071865e..d67b49cae8 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256 6dae02acd85278394bfad6e2683e186e5332a711e4491ac4632ad6480f6e5494 arm-trusted-firmware-v1.4.tar.gz
-sha256 487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
+sha256 b3eb7d1ad5552ee71bd1031c7db7300d0d184e1236e2cd41fbc1e1e7c76a0e63  license.md
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9a23e3d336..f87373ffe6 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -6,7 +6,7 @@
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.md
 
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
 # Handle custom ATF tarballs as specified by the configuration
-- 
2.21.0
