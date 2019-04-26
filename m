From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:01:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 configs/qemu_ppc_mpc8544ds: kernel build needs mkimage
Message-ID: <20190426130223.D427B80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e614dac5eb04efd6af23132e73c8b6288b27cec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Following ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed ("linux: simplify
LINUX_BUILD_CMDS"), the Linux kernel build for
qemu_ppc_mpc8544ds_defconfig builds an image format that needs
mkimage.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/199339543

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b78c8a3b17321df53717fe88560c7b2c6c9cbb35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_ppc_mpc8544ds_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index d6ebef7561..98985b7b76 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -23,3 +23,6 @@ BR2_LINUX_KERNEL_VMLINUX=y
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Kernel needs mkimage
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
