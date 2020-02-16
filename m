From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 22:23:09 +0100
Subject: [Buildroot] [git commit] configs/qemu_pcc_mac99: build host-qemu
 for runtime testing
Message-ID: <20200216212053.0D2528E336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722f8effec790e4398686eae72b22b720d3c9dae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] added host-qemu package for each qemu defconfig
for gitlab runtime testing.

[1] 29e1cb88844614c40846540e22cf83aa9e52674f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Joel Stanley <joel@jms.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_ppc_mac99_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index 4a7c7ce599..496b0fb2a4 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -24,3 +24,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
