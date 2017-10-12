From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Oct 2017 21:54:16 +0200
Subject: [Buildroot] [PATCH 2/2] arm-trusted-firmware: bump to version 1.4
In-Reply-To: <20171012195416.5724-1-peter@korsgaard.com>
References: <20171012195416.5724-1-peter@korsgaard.com>
Message-ID: <20171012195416.5724-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license file got reformatted as reStructuredText, but the license itself
didn't change.

Drop unneeded md5sum and add license hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 2df8267864..799370cd51 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -14,7 +14,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v1.2"
+	bool "v1.4"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	bool "Custom tarball"
@@ -33,7 +33,7 @@ endif
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v1.2"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v1.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index e048e0127a..394071865e 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cbdd9b770ec1ab4933fc7f9f520daea5a364bb4dc964820fb017a0cf8c7df556 arm-trusted-firmware-v1.2.tar.gz
-md5 fac2c08bd74337fec2e14a98fc9f748f arm-trusted-firmware-v1.2.tar.gz
+sha256 6dae02acd85278394bfad6e2683e186e5332a711e4491ac4632ad6480f6e5494 arm-trusted-firmware-v1.4.tar.gz
+sha256 487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index e02c62262f..7b1cc6ebb6 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -6,7 +6,7 @@
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.md
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
 
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 
-- 
2.11.0
