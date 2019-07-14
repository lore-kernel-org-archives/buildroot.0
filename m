From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 19:32:18 +0200
Subject: [Buildroot] [PATCHv2] boot/atf: licensing info is only valid for
 v1.4
Message-ID: <20190714173218.22671-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The licensing information, and expecially the name of the license file,
is known only for the official v1.4 version. For example, in later
versions, the license file has been renamed.

Since we can't be sure of the licensing information for custom versions,
or for versions from git, define that only for the known v1.4 version.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v1 -> v2:
  - adopted by Yann from Adam
  - don't change the filename, but move the licensing info
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9a23e3d336..a7814e534a 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -5,8 +5,6 @@
 ################################################################################
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
-ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
 
 ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
 # Handle custom ATF tarballs as specified by the configuration
@@ -19,6 +17,10 @@ ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
 else
 # Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
+# The licensing of custom or from-git versions is unknown.
+# This is valid only for the official v1.4.
+ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
 endif
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
-- 
2.20.1
