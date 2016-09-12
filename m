From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Sep 2016 13:15:55 -0300
Subject: [Buildroot] [PATCH v2 2/2] mx6ulpico: Use kernel 4.8-rc5
In-Reply-To: <1473696955-24297-1-git-send-email-festevam@gmail.com>
References: <1473696955-24297-1-git-send-email-festevam@gmail.com>
Message-ID: <1473696955-24297-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

With kernel 4.8-rc5 we no longer need to use the "CONFIG_SMP=n" workaround
as the reboot issue has been fixed upstream by commit 059e232089e4
("irqchip/gic: Allow self-SGIs for SMP on UP configurations")

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- None

 board/technexion/imx6ulpico/linux.fragment | 1 -
 configs/imx6ulpico_defconfig               | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/board/technexion/imx6ulpico/linux.fragment b/board/technexion/imx6ulpico/linux.fragment
index 88e323e..892d0cb 100644
--- a/board/technexion/imx6ulpico/linux.fragment
+++ b/board/technexion/imx6ulpico/linux.fragment
@@ -1,2 +1 @@
 CONFIG_CFG80211_WEXT=y
-CONFIG_SMP=n
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 8406226..02507c9 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -17,7 +17,7 @@ BR2_GLOBAL_PATCH_DIR="board/technexion/imx6ulpico/patches"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8-rc5"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technexion/imx6ulpico/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
