From: Dick Olsson <hi@senzilla.io>
Date: Sun, 19 Jul 2020 18:09:45 +0000
Subject: [Buildroot] [PATCH 3/8] boot/arm-trusted-firmware: bump to version
 2.2
In-Reply-To: <20200719180727.28202-1-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
Message-ID: <20200719180727.28202-4-hi@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-2
Note that Buildroot testing has not yet been done with the latest version 2.3.

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index fdb469bb5e..7d0f6aa4e0 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -15,7 +15,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v1.4"
+	bool "v2.2"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 	bool "Custom version"
@@ -43,7 +43,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v1.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.2"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 394071865e..b98d1989f5 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256 6dae02acd85278394bfad6e2683e186e5332a711e4491ac4632ad6480f6e5494 arm-trusted-firmware-v1.4.tar.gz
 sha256 487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
+sha256 07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911 arm-trusted-firmware-v2.2.tar.gz
-- 
2.20.1
