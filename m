From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 10:29:05 +0100
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: Bump to version
 2.4
Message-ID: <20201230091150.490668356B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8705587dcbf580f898bfe166f43f1b91f763865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required in order to build properly with the latest stable release of
EDK2 UEFI firmware.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index e505dee9d0..c06294040e 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -15,7 +15,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v2.2"
+	bool "v2.4"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 	bool "Custom version"
@@ -43,7 +43,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v2.2"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 3cd83d78f2..970613f38d 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911  arm-trusted-firmware-v2.2.tar.gz
+sha256  4bfda9fdbe5022f2e88ad3344165f7d38a8ae4a0e2d91d44d9a1603425cc642d  arm-trusted-firmware-v2.4.tar.gz
 sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
