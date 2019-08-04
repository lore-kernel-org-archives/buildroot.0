From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:23:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 boot/arm-trusted-firmware: licensing info is only valid for v1.4
Message-ID: <20190804201436.879988E42E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85fde0b8055c0a57e1e6235b122b1c35addeddff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The licensing information, and especially the name of the license file,
is known only for the official v1.4 version. For example, in later
versions, the license file has been renamed.

Since we can't be sure of the licensing information for custom versions,
or for versions from git, define that only for the known v1.4 version.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d1a61703f728340ec894c367398d2a3a394a3360)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 8ca3864dd0..464e4d95e5 100644
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
