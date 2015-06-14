From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 14 Jun 2015 14:05:58 +0200
Subject: [Buildroot] [PATCH v3 2/2] docs/manual: add U-Boot configuration
In-Reply-To: <1434283558-9663-1-git-send-email-joerg.krause@embedded.rocks>
References: <1434283558-9663-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1434283558-9663-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v2 -> v3:
  - None

Changes v1 -> v2:
  - None
---
 docs/manual/configure-other-components.txt | 8 ++++++++
 docs/manual/customize-configuration.txt    | 6 ++++--
 docs/manual/customize-quick-guide.txt      | 2 ++
 docs/manual/make-tips.txt                  | 2 ++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/manual/configure-other-components.txt b/docs/manual/configure-other-components.txt
index deb1fa2..60a80f0 100644
--- a/docs/manual/configure-other-components.txt
+++ b/docs/manual/configure-other-components.txt
@@ -50,3 +50,11 @@ kernel. The corresponding configuration variables are
 +BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG+ and
 +BR2_TARGET_BAREBOX_USE_DEFCONFIG+. To open the configuration editor,
 use +make barebox-menuconfig+.
+
+U-Boot::
++
+Configuration of U-Boot (version 2015.04 or newer) is done in the same
+way as for the Linux kernel. The corresponding configuration variables
+are +BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG+ and
++BR2_TARGET_UBOOT_USE_DEFCONFIG+. To open the configuration editor,
+use +make uboot-menuconfig+.
diff --git a/docs/manual/customize-configuration.txt b/docs/manual/customize-configuration.txt
index 6224d40..ae6cebe 100644
--- a/docs/manual/customize-configuration.txt
+++ b/docs/manual/customize-configuration.txt
@@ -24,8 +24,8 @@ Alternatively, you can copy the file to any other place and rebuild with
 [[customize-store-package-config]]
 === Storing the configuration of other components
 
-The configuration files for BusyBox, the Linux kernel, Barebox and
-uClibc should be stored as well if changed. For each of these
+The configuration files for BusyBox, the Linux kernel, Barebox, U-Boot
+and uClibc should be stored as well if changed. For each of these
 components, a Buildroot configuration option exists to point to an input
 configuration file, e.g. +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+. To store
 their configuration, set these configuration options to a path where you
@@ -56,6 +56,8 @@ configuration files easier.
   path specified by +BR2_UCLIBC_CONFIG+.
 * +make barebox-update-defconfig+ saves the barebox configuration to the
   path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
+* +make uboot-update-defconfig+ saves the U-Boot configuration to the
+  path specified by +BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE+.
 * For at91bootstrap3, no helper exists so you have to copy the config
   file manually to +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 
diff --git a/docs/manual/customize-quick-guide.txt b/docs/manual/customize-quick-guide.txt
index 4ff185a..627ecba 100644
--- a/docs/manual/customize-quick-guide.txt
+++ b/docs/manual/customize-quick-guide.txt
@@ -20,6 +20,7 @@ your project can be skipped.
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
    * +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+
+   * +BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE+
 1. Write the configuration files:
    * +make linux-update-defconfig+
    * +make busybox-update-config+
@@ -27,6 +28,7 @@ your project can be skipped.
    * +cp <output>/build/at91bootstrap3-*/.config
      board/<manufacturer>/<boardname>/at91bootstrap3.config+
    * +make barebox-update-defconfig+
+   * +make uboot-update-defconfig+
 1. Create +board/<manufacturer>/<boardname>/rootfs-overlay/+ and fill it
    with additional files you need on your rootfs, e.g.
    +board/<manufacturer>/<boardname>/rootfs-overlay/etc/inittab+.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 1cf1544..97a3302 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -34,6 +34,8 @@ some settings in the +.config+ file may hide some targets:
   selected in the internal toolchain backend;
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
+* +uboot-menuconfig+ and +uboot-savedefconfig+ only work when the
+  +U-Boot+ bootloader is enabled.
 
 .Cleaning:
 
-- 
2.4.3
