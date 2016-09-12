From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:00:24 +0200
Subject: [Buildroot] [git commit] mx6ulpico: Use kernel 4.8-rc5
Message-ID: <20160912210028.35BFD8185F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f0183121d933cc38f78d1ded6c3a59907cc917c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With kernel 4.8-rc5 we no longer need to use the "CONFIG_SMP=n" workaround
as the reboot issue has been fixed upstream by commit 059e232089e4
("irqchip/gic: Allow self-SGIs for SMP on UP configurations")

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
index 1b47ecc..f984bf4 100644
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
