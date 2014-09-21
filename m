From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:09:55 +0200
Subject: [Buildroot] [git commit] qemu-sh4: update to latest kernel
Message-ID: <20140921201016.CBF9C9D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=229562cd4bceaddd31159e7e1b16db2fb6e710fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to Linux kernel 3.16.3.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-3.15.config => linux-3.16.config}       |    0
 board/qemu/sh4-r2d/readme.txt                      |    2 +-
 configs/qemu_sh4_r2d_defconfig                     |    8 ++++----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/qemu/sh4-r2d/linux-3.15.config b/board/qemu/sh4-r2d/linux-3.16.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-3.15.config
rename to board/qemu/sh4-r2d/linux-3.16.config
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 5d770b4..956fbdd 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.0.0
+Tested with QEMU 2.1.0
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index f777417..860737b 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -16,13 +16,13 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
 # Lock to 3.15 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.15.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+BR2_DEFAULT_KERNEL_VERSION="3.16.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.16.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.16.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
