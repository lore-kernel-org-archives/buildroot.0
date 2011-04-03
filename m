From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Apr 2011 20:12:28 +0200
Subject: [Buildroot] [git commit /heads/master] qemu/x86: linux: tweak config
Message-ID: <20110403185531.1144C81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=070e9e2bea7c38148c696694fe8474f6b348bf22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable correct driver for qemu's rtl8139 emulation (8139cp), enable
CONFIG_PACKET so DHCP works and enable 8250 driver for serial console.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/qemu/x86/linux-2.6.36.config |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/board/qemu/x86/linux-2.6.36.config b/board/qemu/x86/linux-2.6.36.config
index 6b57aff..a578041 100644
--- a/board/qemu/x86/linux-2.6.36.config
+++ b/board/qemu/x86/linux-2.6.36.config
@@ -1,8 +1,9 @@
+CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
+CONFIG_RCU_FANOUT=32
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 # CONFIG_COMPAT_BRK is not set
-# CONFIG_LBDAF is not set
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
@@ -13,8 +14,8 @@
 # CONFIG_MTRR_SANITIZER is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_RELOCATABLE is not set
-# CONFIG_COMPAT_VDSO is not set
 CONFIG_NET=y
+CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_PNP=y
@@ -36,7 +37,7 @@ CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_NET_PCI=y
 CONFIG_NE2K_PCI=y
-CONFIG_8139TOO=y
+CONFIG_8139CP=y
 # CONFIG_NETDEV_1000 is not set
 # CONFIG_NETDEV_10000 is not set
 # CONFIG_WLAN is not set
@@ -44,6 +45,8 @@ CONFIG_8139TOO=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO_SERPORT is not set
 # CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
@@ -60,6 +63,7 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=1024
 # CONFIG_UNUSED_SYMBOLS is not set
 # CONFIG_FRAME_POINTER is not set
 # CONFIG_RCU_CPU_STALL_DETECTOR is not set
-- 
1.7.3.4
