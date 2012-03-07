From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:31 +0100
Subject: [Buildroot] [RFC v2 31/31] Create test configs (testing only)
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-32-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is for testing only, not to be committed in any serious repository

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 configs/legal_info_test2_defconfig |    8 ++++++++
 configs/legal_info_test_defconfig  |   20 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 configs/legal_info_test2_defconfig
 create mode 100644 configs/legal_info_test_defconfig

diff --git a/configs/legal_info_test2_defconfig b/configs/legal_info_test2_defconfig
new file mode 100644
index 0000000..cb192ec
--- /dev/null
+++ b/configs/legal_info_test2_defconfig
@@ -0,0 +1,8 @@
+BR2_TOOLCHAIN_CTNG=y
+BR2_TOOLCHAIN_CTNG_glibc=y
+BR2_TOOLCHAIN_CTNG_CXX=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_ENABLE_LOCALE_WHITELIST="C en_US"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_UTIL_LINUX=y
diff --git a/configs/legal_info_test_defconfig b/configs/legal_info_test_defconfig
new file mode 100644
index 0000000..81cb234
--- /dev/null
+++ b/configs/legal_info_test_defconfig
@@ -0,0 +1,20 @@
+BR2_x86_pentiumpro=y
+BR2_DL_DIR="~/src"
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_PACKAGE_ALSA_LIB=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_LZOP=y
+BR2_PACKAGE_DIRECTFB=y
+BR2_PACKAGE_IOSTAT=y
+BR2_PACKAGE_KBD=y
+BR2_PACKAGE_BERKELEYDB=y
+BR2_PACKAGE_PCRE=y
+BR2_PACKAGE_NETSNMP=y
+BR2_PACKAGE_TTCP=y
+BR2_PACKAGE_UEMACS=y
+BR2_PACKAGE_HOST_OPENOCD=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.2.config"
-- 
1.7.5.4
