From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:02:45 +0200
Subject: [Buildroot] [git commit] configs/qemu: update nuri to latest 3.10.x
	kernel
Message-ID: <20150416060439.06AE0818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7417c4e6f70a1e67d81175db421fadea06b2d1e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/arm-nuri/readme.txt  |    3 ++-
 configs/qemu_arm_nuri_defconfig |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 6fe1ac0..d7a6428 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -6,5 +6,6 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
+This emulation is known to be flaky.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index bf70df0..7a270ed 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -16,12 +16,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Lock to 3.10 headers to avoid breaking with newer kernels
 # Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.70"
+BR2_DEFAULT_KERNEL_VERSION="3.10.74"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.70"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.74"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
