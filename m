From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Dec 2013 13:20:39 +0100
Subject: [Buildroot] [PATCH 1 of 2] Config.in files: unification of comments
 about dependency on Linux kernel
In-Reply-To: <patchbomb.1387110038@argentina>
References: <patchbomb.1387110038@argentina>
Message-ID: <2132c856b74577235e37.1387110039@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch lines up the comments of packages that need a Linux kernel to be
built by buildroot, to the format:
    foo needs a Linux kernel to be built

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 boot/boot-wrapper-aarch64/Config.in         |  4 ++++
 fs/initramfs/Config.in                      |  2 +-
 fs/iso9660/Config.in                        |  2 +-
 package/a10disp/Config.in                   |  2 +-
 package/cryptodev/Config.in                 |  5 ++++-
 package/directfb/Config.in                  |  3 +++
 package/freescale-imx/imx-lib/Config.in     |  2 +-
 package/gstreamer/gst-fsl-plugins/Config.in |  2 +-
 package/igh-ethercat/Config.in              |  3 +++
 package/ktap/Config.in                      |  2 +-
 package/libfslvpuwrap/Config.in             |  2 +-
 package/linux-fusion/Config.in              |  3 +++
 package/lttng-modules/Config.in             |  2 +-
 package/on2-8170-libs/Config.in             |  2 +-
 package/on2-8170-modules/Config.in          |  4 ++--
 package/owl-linux/Config.in                 |  2 +-
 package/perf/Config.in                      |  2 +-
 package/ti-gfx/Config.in                    |  2 +-
 18 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/Config.in b/boot/boot-wrapper-aarch64/Config.in
--- a/boot/boot-wrapper-aarch64/Config.in
+++ b/boot/boot-wrapper-aarch64/Config.in
@@ -1,3 +1,7 @@
+comment "boot-wrapper-aarch64 needs a Linux kernel to be built"
+	depends on BR2_aarch64
+	depends on !BR2_LINUX_KERNEL
+
 config BR2_TARGET_BOOT_WRAPPER_AARCH64
 	bool "boot-wrapper-aarch64"
 	depends on BR2_aarch64
diff --git a/fs/initramfs/Config.in b/fs/initramfs/Config.in
--- a/fs/initramfs/Config.in
+++ b/fs/initramfs/Config.in
@@ -17,5 +17,5 @@ config BR2_TARGET_ROOTFS_INITRAMFS
 	  identical root filesystems, one embedded inside the kernel
 	  image, and one separately.
 
-comment "initramfs requires a Linux kernel to be built"
+comment "initramfs needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/fs/iso9660/Config.in b/fs/iso9660/Config.in
--- a/fs/iso9660/Config.in
+++ b/fs/iso9660/Config.in
@@ -12,6 +12,6 @@ config BR2_TARGET_ROOTFS_ISO9660_BOOT_ME
 	depends on BR2_TARGET_ROOTFS_ISO9660
 	default "fs/iso9660/menu.lst"
 
-comment "iso image requires a Linux kernel to be built"
+comment "iso image needs a Linux kernel to be built"
 	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/a10disp/Config.in b/package/a10disp/Config.in
--- a/package/a10disp/Config.in
+++ b/package/a10disp/Config.in
@@ -8,6 +8,6 @@ config BR2_PACKAGE_A10DISP
 
 	  http://github.com/hglm/a10disp
 
-comment "a10disp requires the linux kernel"
+comment "a10disp needs a Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
--- a/package/cryptodev/Config.in
+++ b/package/cryptodev/Config.in
@@ -1,5 +1,8 @@
+comment "cryptodev needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_CRYPTODEV
-	bool "cryptodev support"
+	bool "cryptodev"
 	depends on BR2_LINUX_KERNEL
 	help
 	  Select the desired cryptodev implementation.
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -16,6 +16,9 @@ config BR2_PACKAGE_DIRECTFB_MULTI
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
+comment "directfb multi application needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_DIRECTFB_DEBUG
 	bool "directfb debugging"
 	help
diff --git a/package/freescale-imx/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
--- a/package/freescale-imx/imx-lib/Config.in
+++ b/package/freescale-imx/imx-lib/Config.in
@@ -1,4 +1,4 @@
-comment "imx-lib needs an imx-specific kernel to be built"
+comment "imx-lib needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_IMX_LIB
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -1,4 +1,4 @@
-comment "gst-fsl-plugins requires an imx-specific kernel to be built"
+comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && BR2_PACKAGE_GSTREAMER && !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_GST_FSL_PLUGINS
diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -1,3 +1,6 @@
+comment "igh-ethercat needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_IGH_ETHERCAT
 	bool "igh-ethercat"
 	depends on BR2_LINUX_KERNEL
diff --git a/package/ktap/Config.in b/package/ktap/Config.in
--- a/package/ktap/Config.in
+++ b/package/ktap/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_KTAP
 
 	  http://www.ktap.org
 
-comment "ktap requires a linux kernel to be built"
+comment "ktap needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 comment "ktap needs a toolchain w/ threads"
diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
--- a/package/libfslvpuwrap/Config.in
+++ b/package/libfslvpuwrap/Config.in
@@ -1,4 +1,4 @@
-comment "libfslvpuwrap needs an imx-specific kernel to be built"
+comment "libfslvpuwrap needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
 
diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -1,3 +1,6 @@
+comment "linux-fusion needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 config BR2_PACKAGE_LINUX_FUSION
 	depends on BR2_LINUX_KERNEL
 	bool "linux-fusion communication layer for DirectFB multi"
diff --git a/package/lttng-modules/Config.in b/package/lttng-modules/Config.in
--- a/package/lttng-modules/Config.in
+++ b/package/lttng-modules/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_LTTNG_MODULES
 
 	  http://lttng.org
 
-comment "lttng-modules requires a linux kernel to be built"
+comment "lttng-modules needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
--- a/package/on2-8170-libs/Config.in
+++ b/package/on2-8170-libs/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_ON2_8170_LIBS
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "on2-8170-libs needs an (e)glibc toolchain and a linux kernel to be built"
+comment "on2-8170-libs needs an (e)glibc toolchain and a Linux kernel to be built"
 	depends on BR2_arm926t
 	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/on2-8170-modules/Config.in b/package/on2-8170-modules/Config.in
--- a/package/on2-8170-modules/Config.in
+++ b/package/on2-8170-modules/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_ON2_8170_MODULES
-	bool "on2-8170 modules"
+	bool "on2-8170-modules"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm926t
 	help
@@ -7,6 +7,6 @@ config BR2_PACKAGE_ON2_8170_MODULES
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "on2-8170 modules requires a linux kernel to be built"
+comment "on2-8170-modules needs a Linux kernel to be built"
 	depends on BR2_arm926t
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
--- a/package/owl-linux/Config.in
+++ b/package/owl-linux/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_OWL_LINUX
 
 	  http://linux.hd-wireless.se/bin/view/Linux/GettingStarted
 
-comment "owl-linux requires a Linux kernel"
+comment "owl-linux needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 	depends on BR2_arm || BR2_armeb
 
diff --git a/package/perf/Config.in b/package/perf/Config.in
--- a/package/perf/Config.in
+++ b/package/perf/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_PERF
 
 	  https://perf.wiki.kernel.org/
 
-comment "perf only available if Linux kernel is enabled, and needs a toolchain w/ largefile"
+comment "perf needs a toolchain w/ largefile and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_LARGEFILE
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -60,6 +60,6 @@ endchoice
 
 endif
 
-comment "ti-gfx needs an (e)glibc toolchain and the linux kernel"
+comment "ti-gfx needs an (e)glibc toolchain and a Linux kernel to be built"
 	depends on BR2_arm
 	depends on !(BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC)
