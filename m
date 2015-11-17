From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:20:44 +0100
Subject: [Buildroot] [git commit] configs/qemu: bump x86 to 4.3 kernel
Message-ID: <20151117202100.4762181D83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdb35ce73ee7eea7deacf0962aefa407b149cba4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that uclibc-ng was bumped to version 1.0.9 nothing prevents x86
from working correctly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../x86/{linux-4.2.config => linux-4.3.config}     |    0
 configs/qemu_x86_defconfig                         |   10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/x86/linux-4.2.config b/board/qemu/x86/linux-4.3.config
similarity index 100%
rename from board/qemu/x86/linux-4.2.config
rename to board/qemu/x86/linux-4.3.config
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index f2e2022..9fd1fe9 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 4.2 headers to avoid breaking with newer kernels
+# Lock to 4.3 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.2.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+BR2_DEFAULT_KERNEL_VERSION="4.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.2.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.3.config"
