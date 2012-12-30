From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 12:32:42 +0100
Subject: [Buildroot] [git commit] qemu/x86: update to use kernel 3.7.1
Message-ID: <20121230113340.47D5C81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6420570f6697405a033d00875739661d39edae5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x86/{linux-3.6.config => linux-3.7.config}     |    0
 board/qemu/x86/readme.txt                          |    2 +-
 configs/qemu_x86_defconfig                         |    8 ++++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/x86/linux-3.6.config b/board/qemu/x86/linux-3.7.config
similarity index 100%
rename from board/qemu/x86/linux-3.6.config
rename to board/qemu/x86/linux-3.7.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 3cca682..4342556 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.2.0
+Tested with QEMU 1.3.0
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 90524b5..ddb9fd1 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.6 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_6=y
+# Lock to 3.7 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.6.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.6.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.7.config"
