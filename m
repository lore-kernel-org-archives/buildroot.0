From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 17 Jun 2014 13:21:47 +0800
Subject: [Buildroot] [PATCH 7/7 v3] Add powerpc64 petitboot defconfig
In-Reply-To: <1402982507.183937.570365596242.0.gpush@pablo>
Message-ID: <1402982507.186219.497008212672.7.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A simple defconfig for building a petitboot-based bootloader for
powerpc64 machines.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 configs/powerpc64_petitboot_defconfig |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/configs/powerpc64_petitboot_defconfig b/configs/powerpc64_petitboot_defconfig
new file mode 100644
index 0000000..fa629ab
--- /dev/null
+++ b/configs/powerpc64_petitboot_defconfig
@@ -0,0 +1,17 @@
+BR2_powerpc64=y
+BR2_GENERATE_LOCALE="en_US.UTF-8"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BNX2X=y
+BR2_PACKAGE_LINUX_FIRMWARE_CXGB4=y
+BR2_PACKAGE_NCURSES_WCHAR=y
+BR2_PACKAGE_DROPBEAR=y
+# BR2_PACKAGE_DROPBEAR_SERVER is not set
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_NETCAT=y
+BR2_PACKAGE_RSYNC=y
+BR2_PACKAGE_PETITBOOT=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_XZ=y
