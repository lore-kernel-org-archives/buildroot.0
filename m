From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 16:52:18 +0800
Subject: [Buildroot] [RFC,PATCH 8/8] Add powerpc petitboot defconfig
In-Reply-To: <1389862338.917573.283530987294.0.gpush@pablo>
Message-ID: <1389862338.919991.688436724067.8.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A simple defconfig for building a petitboot-based bootloader for powerpc
machines.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 configs/powerpc_petitboot_defconfig |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/configs/powerpc_petitboot_defconfig b/configs/powerpc_petitboot_defconfig
new file mode 100644
index 00000000..8470c2f9
--- /dev/null
+++ b/configs/powerpc_petitboot_defconfig
@@ -0,0 +1,22 @@
+BR2_powerpc=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_GENERATE_LOCALE="en_US.utf8"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KEXEC_LITE=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BNX2X=y
+BR2_PACKAGE_LINUX_FIRMWARE_CXGB4=y
+BR2_PACKAGE_NCURSES_WIDEC=y
+BR2_PACKAGE_NCURSES_TARGET_FORM=y
+BR2_PACKAGE_NCURSES_TARGET_MENU=y
+BR2_PACKAGE_DROPBEAR=y
+# BR2_PACKAGE_DROPBEAR_SERVER is not set
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_NETCAT=y
+BR2_PACKAGE_RSYNC=y
+BR2_PACKAGE_PETITBOOT=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
