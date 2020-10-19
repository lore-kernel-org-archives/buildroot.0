From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2020 19:07:38 +0200
Subject: [Buildroot] [git commit] configs/qemu_s390x_defconfig: use linux
 headers same as kernel series 5.8
Message-ID: <20201019165621.8F8F084188@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1981b012f49a80ec0a1734fd1816fe559403d3e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Broke since introduction of linux kernel series 5.9.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/qemu_s390x_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 3bd407b250..b3c2641d15 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -11,6 +11,9 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Linux headers same as kernel, a 5.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
