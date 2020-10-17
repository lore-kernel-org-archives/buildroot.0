From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 09:33:21 +0200
Subject: [Buildroot] [git commit] package/kernel-module-imx-gpu-viv: fix
 disabling kernel option
Message-ID: <20201017072212.F0F7F821F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74a8865b2fa58a26c567e5fef1faa6df639deda7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 391c448acbb9 (package/kernel-module-imx-gpu-viv: bear the kernel
options munging) improperly named the macro, including a superfluous
'MODULE' in the middle of the macro name, which meant it was totally
unused.

Fix that.

Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 89b47f9147..2cea117087 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -16,7 +16,7 @@ KERNEL_MODULE_IMX_GPU_VIV_MODULE_MAKE_OPTS = \
 
 KERNEL_MODULE_IMX_GPU_VIV_MODULE_SUBDIRS = kernel-module-imx-gpu-viv-src
 
-define KERNEL_MODULE_IMX_GPU_VIV_MODULE_LINUX_CONFIG_FIXUPS
+define KERNEL_MODULE_IMX_GPU_VIV_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV)
 endef
 
