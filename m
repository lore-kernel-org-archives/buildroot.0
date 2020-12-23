From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 10:12:19 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi*: bump kernel version
 to 967d45b (5.10.1)
Message-ID: <20201223085641.5045982203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e934f23cef4bd2ef01ecd31eef13483772d9280c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now based on 5.10.1 (from 5.4.80).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi0_defconfig       | 6 +++---
 configs/raspberrypi0w_defconfig      | 6 +++---
 configs/raspberrypi2_defconfig       | 6 +++---
 configs/raspberrypi3_64_defconfig    | 6 +++---
 configs/raspberrypi3_defconfig       | 6 +++---
 configs/raspberrypi3_qt5we_defconfig | 6 +++---
 configs/raspberrypi4_64_defconfig    | 6 +++---
 configs/raspberrypi4_defconfig       | 6 +++---
 configs/raspberrypi_defconfig        | 6 +++---
 9 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 3b2178c3cb..c06d6dfcb5 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 2f2dafbedd..b54bb34ad9 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -2,14 +2,14 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 431e194c02..5104422cb1 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,12 +7,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index e71602f760..65c1291e6a 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index faa93920e9..96eca54f0d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 8c54e70bbd..8015288acb 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -7,12 +7,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index c344d88e0d..94ac5cf5ec 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 76e4f99cb6..c2ed5e73c5 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 59af19fa1d..2d3bb536bf 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -4,14 +4,14 @@ BR2_ARM_EABIHF=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
