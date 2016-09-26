From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 21:31:36 +0200
Subject: [Buildroot] [git commit] board: bump armadeus apf28's kernel
	version to latest longterm (4.4.22)
Message-ID: <20160926193231.93D927FF6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=286d4850027cdde8f59f958433135910111326d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/armadeus/apf28/{linux-3.12.config => linux-4.4.config} | 4 ++--
 configs/armadeus_apf28_defconfig                             | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/armadeus/apf28/linux-3.12.config b/board/armadeus/apf28/linux-4.4.config
similarity index 100%
rename from board/armadeus/apf28/linux-3.12.config
rename to board/armadeus/apf28/linux-4.4.config
index 137bd12..cf389d8 100644
--- a/board/armadeus/apf28/linux-3.12.config
+++ b/board/armadeus/apf28/linux-4.4.config
@@ -117,8 +117,6 @@ CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x8=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
@@ -183,3 +181,5 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_DEBUG_FS=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 # CONFIG_CRYPTO_HW is not set
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 3032906..708f20b 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 3.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
@@ -13,9 +13,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.22"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf28/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf28/linux-4.4.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
