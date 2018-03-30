From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:16:44 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] board/technologic/ts5x00:
 bump kernel to 4.14
Message-ID: <20180330213159.97A3B83EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66c14b5429e9ac71ef9de692231823c6e1e1ce58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Bump the 3.17 kernel used for the Technologic Systems TS-5500 platform
to the latest LTS kernel 4.14.

This fixes the ts5x00_defconfig build with GCC 6.x.

The linux-3.17.config file has been renamed to linux-4.14.config to
match the new kernel version, and its changes are the result of make
linux-update-defconfig. However only comments are affected.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6461d76992ec2ceffabd7a5ccb59bb707ea2cb0a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/technologic/ts5x00/{linux-3.17.config => linux-4.14.config} | 4 +---
 configs/ts5x00_defconfig                                          | 8 ++++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/board/technologic/ts5x00/linux-3.17.config b/board/technologic/ts5x00/linux-4.14.config
similarity index 98%
rename from board/technologic/ts5x00/linux-3.17.config
rename to board/technologic/ts5x00/linux-4.14.config
index 60cd8a0fe3..eb81596e25 100644
--- a/board/technologic/ts5x00/linux-3.17.config
+++ b/board/technologic/ts5x00/linux-4.14.config
@@ -1,3 +1,4 @@
+# CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_X86_EXTENDED_PLATFORM is not set
 CONFIG_MELAN=y
@@ -6,7 +7,6 @@ CONFIG_X86_REBOOTFIXUPS=y
 CONFIG_NOHIGHMEM=y
 # CONFIG_COMPACTION is not set
 # CONFIG_BOUNCE is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
 # CONFIG_RELOCATABLE is not set
 # CONFIG_SUSPEND is not set
 # CONFIG_ACPI is not set
@@ -19,7 +19,6 @@ CONFIG_INET=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
@@ -76,7 +75,6 @@ CONFIG_DM9102=y
 CONFIG_PHYLIB=y
 CONFIG_DAVICOM_PHY=y
 # CONFIG_WLAN is not set
-# CONFIG_INPUT_MOUSEDEV is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
diff --git a/configs/ts5x00_defconfig b/configs/ts5x00_defconfig
index 531088661c..19259260b7 100644
--- a/configs/ts5x00_defconfig
+++ b/configs/ts5x00_defconfig
@@ -2,8 +2,8 @@
 BR2_i386=y
 BR2_x86_i586=y
 
-# Linux headers same as kernel, a 3.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
@@ -12,9 +12,9 @@ BR2_ROOTFS_OVERLAY="board/technologic/ts5x00/fs-overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5x00/linux-3.17.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5x00/linux-4.14.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # rootfs
