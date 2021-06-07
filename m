From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:21 -0000
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: bump to version
 2.5
Message-ID: <20210607144656.42805814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb5d9fdf1ebf7002a29e6fa43c817611e2e4e8d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-5

The existing qemu_aarch64_sbsa_defconfig was using an unpinned version
of ATF, so to avoid any regression, it is pinned to the previous
version, 2.4.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: pin ATF version in qemu_aarch64_sbsa_defconfig]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 configs/qemu_aarch64_sbsa_defconfig                 | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 9d347550a4..a5a8c5bfc3 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -15,7 +15,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v2.4"
+	bool "v2.5"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 	bool "Custom version"
@@ -43,7 +43,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v2.4"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.5"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 970613f38d..1ab50a9e28 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4bfda9fdbe5022f2e88ad3344165f7d38a8ae4a0e2d91d44d9a1603425cc642d  arm-trusted-firmware-v2.4.tar.gz
+sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
 sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 20ae393cd7..d014140bf5 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -36,6 +36,9 @@ BR2_TARGET_GRUB2_ARM64_EFI=y
 
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 
