From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 22:56:02 +0100
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/kernel-module-imx-gpu-viv: fix disabling kernel option
Message-ID: <20201028214525.82B0C8393E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c398366d0a6af5938d20355a450ce3c0e1dc8588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Commit 391c448acbb9 (package/kernel-module-imx-gpu-viv: bear the kernel
options munging) improperly named the macro, including a superfluous
'MODULE' in the middle of the macro name, which meant it was totally
unused.

Fix that.

Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 74a8865b2fa58a26c567e5fef1faa6df639deda7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
