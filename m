From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 May 2020 23:54:59 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 configs/qemu_ppc_virtex_ml507_defconfig: select BR2_POWERPC_SOFT_FLOAT
Message-ID: <20200507214107.C12FC8FEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bb12abb33c09d72d6e884180129ddadcf1abfbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The BR2_SOFT_FLOAT option is lost while loading the defconfig with:
make qemu_ppc_virtex_ml507_defconfig

On powerpc, BR2_POWERPC_SOFT_FLOAT must be used to enable soft
floating point support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b6245ed49b9db4e0f94cb58be1fc48628c78347b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_ppc_virtex_ml507_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index c7c324d5e8..8b105cf7e7 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Use soft float
-BR2_SOFT_FLOAT=y
+BR2_POWERPC_SOFT_FLOAT=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
