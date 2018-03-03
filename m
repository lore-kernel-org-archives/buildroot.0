From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Mar 2018 08:48:14 +0100
Subject: [Buildroot] [git commit] qemu_x86_64_defconfig: fix kernel header
 version after bump to 4.15
Message-ID: <20180303075251.5ADA5815A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a6e30efdeb9f31d51a92ed465373f4128f55e8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #10831

Commit a952d24b9 (qemu_x86_64: use kernel 4.15) bumped the kernel version
but didn't update the kernel header series to match, causing build failures.

[Peter: reworded]
Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_x86_64_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 92a196790d..b92ae17ae6 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,8 +9,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
