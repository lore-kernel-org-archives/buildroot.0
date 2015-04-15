From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 14:05:03 -0300
Subject: [Buildroot] [PATCH 06/15] configs/qemu: update sparc ss10
In-Reply-To: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429117512-15472-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1429117512-15472-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to kernel 4.0.
Switch kernel config to ext4, simplify to reduce bloat.
Adjust invocation to keep the framebuffer window for graphics testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sparc-ss10/linux-3.19.config | 95 ---------------------------------
 board/qemu/sparc-ss10/linux-4.0.config  | 31 +++++++++++
 board/qemu/sparc-ss10/readme.txt        |  4 +-
 configs/qemu_sparc_ss10_defconfig       | 10 ++--
 4 files changed, 38 insertions(+), 102 deletions(-)
 delete mode 100644 board/qemu/sparc-ss10/linux-3.19.config
 create mode 100644 board/qemu/sparc-ss10/linux-4.0.config

diff --git a/board/qemu/sparc-ss10/linux-3.19.config b/board/qemu/sparc-ss10/linux-3.19.config
deleted file mode 100644
index 0e7e500..0000000
--- a/board/qemu/sparc-ss10/linux-3.19.config
+++ /dev/null
@@ -1,95 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PCI=y
-CONFIG_SUN_OPENPROMFS=m
-CONFIG_BINFMT_MISC=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_INET_AH=y
-CONFIG_INET_ESP=y
-CONFIG_INET_IPCOMP=y
-# CONFIG_INET_LRO is not set
-CONFIG_INET6_AH=m
-CONFIG_INET6_ESP=m
-CONFIG_INET6_IPCOMP=m
-CONFIG_IPV6_TUNNEL=m
-CONFIG_NET_PKTGEN=m
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_BLK_DEV_LOOP=m
-CONFIG_BLK_DEV_CRYPTOLOOP=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=m
-CONFIG_CHR_DEV_SG=m
-CONFIG_SCSI_QLOGICPTI=m
-CONFIG_SCSI_SUNESP=y
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=m
-CONFIG_SUNLANCE=y
-CONFIG_HAPPYMEAL=m
-CONFIG_SUNBMAC=m
-CONFIG_SUNQE=m
-# CONFIG_WLAN is not set
-CONFIG_INPUT_JOYDEV=m
-CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_EVBUG=m
-CONFIG_KEYBOARD_ATKBD=m
-CONFIG_KEYBOARD_SUNKBD=m
-CONFIG_MOUSE_PS2=m
-CONFIG_MOUSE_SERIAL=m
-CONFIG_SERIO=m
-CONFIG_SERIAL_SUNZILOG=y
-CONFIG_SERIAL_SUNZILOG_CONSOLE=y
-CONFIG_SERIAL_SUNSU=y
-CONFIG_SERIAL_SUNSU_CONSOLE=y
-CONFIG_SPI=y
-CONFIG_SPI_XILINX=m
-CONFIG_SUN_OPENPROMIO=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_AUTOFS4_FS=m
-CONFIG_ISO9660_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS=y
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
-# CONFIG_SCHED_DEBUG is not set
-CONFIG_KGDB=y
-CONFIG_KGDB_TESTS=y
-CONFIG_CRYPTO_NULL=m
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_MD4=y
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA256=m
-CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_ARC4=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAST5=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TWOFISH=m
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_HW is not set
-CONFIG_LIBCRC32C=m
diff --git a/board/qemu/sparc-ss10/linux-4.0.config b/board/qemu/sparc-ss10/linux-4.0.config
new file mode 100644
index 0000000..cb8d01d
--- /dev/null
+++ b/board/qemu/sparc-ss10/linux-4.0.config
@@ -0,0 +1,31 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_SUN_OPENPROMFS=m
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_SUNESP=y
+CONFIG_NETDEVICES=y
+CONFIG_SUNLANCE=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_SUNKBD=y
+CONFIG_MOUSE_SERIAL=y
+CONFIG_SERIAL_SUNZILOG=y
+CONFIG_SERIAL_SUNZILOG_CONSOLE=y
+CONFIG_SERIAL_SUNSU=y
+CONFIG_SERIAL_SUNSU_CONSOLE=y
+CONFIG_SUN_OPENPROMIO=m
+CONFIG_EXT4_FS=y
+CONFIG_ISO9660_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 88f98d5..1972a11 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -1,7 +1,7 @@
 Run the emulation with:
 
-  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user -display none
+  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 73195fa..1fff720 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,15 +8,15 @@ BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.0.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.0.5
