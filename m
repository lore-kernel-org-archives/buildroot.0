From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:44 +0200
Subject: [Buildroot] [PATCHv2 10/12]
 configs/qemu_ppc_virtex_ml507_defconfig: select BR2_POWERPC_SOFT_FLOAT
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-10-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_SOFT_FLOAT option is lost while loading the defconfig with:
make qemu_ppc_virtex_ml507_defconfig

On powerpc, BR2_POWERPC_SOFT_FLOAT must be used to enable soft
floating point support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.3
