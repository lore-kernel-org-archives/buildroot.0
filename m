From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue,  8 Sep 2020 17:51:39 +0200
Subject: [Buildroot] [PATCH 1/4] configs: add a Qemu x86_64 SELinux defconfig
In-Reply-To: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
References: <20200908155142.1385820-1-antoine.tenart@bootlin.com>
Message-ID: <20200908155142.1385820-2-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a minimal defconfig to boot an SELinux enabled x86_64
image on Qemu, with Systemd. This will help the project by giving an
example of an SELinux enabled image within Buildroot, and will also be
used to run SELinux related tests (either manually or through the tests
available in Buildroot).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 configs/qemu_x86_64_selinux_defconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 configs/qemu_x86_64_selinux_defconfig

diff --git a/configs/qemu_x86_64_selinux_defconfig b/configs/qemu_x86_64_selinux_defconfig
new file mode 100644
index 000000000000..104c825aacfe
--- /dev/null
+++ b/configs/qemu_x86_64_selinux_defconfig
@@ -0,0 +1,19 @@
+BR2_x86_64=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_INIT_SYSTEMD=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+BR2_PACKAGE_REFPOLICY=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.26.2
