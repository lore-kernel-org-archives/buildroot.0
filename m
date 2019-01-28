From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:04:33 +0100
Subject: [Buildroot] [git commit] qemu_riscv64_virt_defconfig: fix linux
 header selection
Message-ID: <20190128210844.5FF938177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15320d0060892473a3d713f2d998a86b2760a3e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the kernel is built by Buildroot BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_X_YY
must be used and not BR2_KERNEL_HEADERS_X_YY.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv64_virt_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 705ec1293a..65dbef4135 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Linux headers same as kernel, a 4.20 series
-BR2_KERNEL_HEADERS_4_20=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
