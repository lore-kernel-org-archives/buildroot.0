From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:54:43 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 configs/olimex_a20_olinuxino_lime{, 2}_defconfig: use a glibc toolchain
Message-ID: <20200507214107.B11F08FEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab0c97f8ffe0c4c8b01ff93c04fae0d534e83477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since 2e71b396a171594d5b913d8b8c11079d376198ed, this defconfig needs
a glibc toolchain to select sunxi-mali-mainline package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 04f9ff54a5f11eedadb82658eb3269d0c466b2b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++++
 configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 21b681a1fb..4419d9bc2a 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -6,6 +6,10 @@ BR2_ARM_EABIHF=y
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
+# Toolchain
+# glibc is needed for sunxi-mali-mainline-package.
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 029f9ebad3..fd34054afe 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -6,6 +6,10 @@ BR2_ARM_EABIHF=y
 # Linux headers same as kernel, a 5.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
+# Toolchain
+# glibc is needed for sunxi-mali-mainline-package.
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
