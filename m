From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:07:55 +0200
Subject: [Buildroot] [git commit] configs/qemu_ppc_virtex_ml507_defconfig:
 select BR2_POWERPC_SOFT_FLOAT
Message-ID: <20200421195434.4F67E8FB46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6245ed49b9db4e0f94cb58be1fc48628c78347b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_SOFT_FLOAT option is lost while loading the defconfig with:
make qemu_ppc_virtex_ml507_defconfig

On powerpc, BR2_POWERPC_SOFT_FLOAT must be used to enable soft
floating point support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_ppc_virtex_ml507_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 2ecf9464d9..8d8f1358d0 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Use soft float
-BR2_SOFT_FLOAT=y
+BR2_POWERPC_SOFT_FLOAT=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
