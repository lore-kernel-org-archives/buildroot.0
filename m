From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Tue,  5 Feb 2019 23:14:14 +0100
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add new version
Message-ID: <20190205221414.23720-1-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow user to choose specific version of ATF apart from latest or custom
version.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 boot/arm-trusted-firmware/Config.in                 | 10 +++++++++-
 boot/arm-trusted-firmware/arm-trusted-firmware.hash |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 885d93e62f..646ca1dee2 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -14,6 +14,12 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	bool "Latest (v2.0)"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_2_0
+	bool "v2.0"
+
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_1_4
 	bool "v1.4"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
@@ -33,7 +39,9 @@ endif
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v1.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.0"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.0"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_2_0
+	default "v1.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_1_4
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 394071865e..8154185301 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,4 @@
 # Locally calculated
+sha256 7d699a1683bb7a5909de37b6eb91b6e38db32cd6fc5ae48a08eb0718d6504ae4 arm-trusted-firmware-v2.0.tar.gz
 sha256 6dae02acd85278394bfad6e2683e186e5332a711e4491ac4632ad6480f6e5494 arm-trusted-firmware-v1.4.tar.gz
 sha256 487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
-- 
2.18.1
