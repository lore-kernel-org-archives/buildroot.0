From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:37:24 +0200
Subject: [Buildroot] [git commit] configs/qemu_ppc_mac99: needs host-openssl
Message-ID: <20190810123502.CB6FF84277@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a29fff72f2e6e3b8e763b63fb170b138df8ef57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel configuration used by the qemu_ppc_mac99_defconfig needs
host-openssl, otherwise it fails to build with:

  scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139257

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_ppc_mac99_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 377fc9466f..9a33c3d82c 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.4"
 BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
