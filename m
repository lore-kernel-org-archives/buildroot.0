From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Jul 2012 18:13:08 -0300
Subject: [Buildroot] [PATCH 04/11] qemu/sparc-ss10: update to use kernel
	3.4.7
In-Reply-To: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
References: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1343769195-25220-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sparc-ss10/readme.txt  |    1 +
 configs/qemu_sparc_ss10_defconfig |    6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 5f01efa..4c20702 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -5,3 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
+Tested with QEMU 1.1.1
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 7ac66af..9c55458 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,12 +6,12 @@ BR2_sparc_supersparc=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.3 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_3=y
+# Lock to 3.4 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_4=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.3.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.8.6
