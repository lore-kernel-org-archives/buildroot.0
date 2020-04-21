From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:43 +0200
Subject: [Buildroot] [PATCHv2 09/12] configs/olimex_a20_olinuxino_lime{,
 2}_defconfig: use a glibc toolchain
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-9-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 2e71b396a171594d5b913d8b8c11079d376198ed, this defconfig needs
a glibc toolchain to select sunxi-mali-mainline package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++++
 configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 6daa27b631..eb6a82c2f6 100644
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
index bb555005e9..740fd4357a 100644
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
-- 
2.25.3
