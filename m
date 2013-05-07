From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 14:00:17 +0200
Subject: [Buildroot] [git commit] configs: update boards to u-boot custom
	version option
Message-ID: <20130507133102.D286299AD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f273ae0406f6f309f4e750e680c936afc443ea2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some board configs where left out of the u-boot custom version
migration, so do it otherwise they'll just pull the latest version which
might not work and brick the device.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91rm9200df_defconfig |    3 ++-
 configs/atngw100_defconfig     |    3 ++-
 configs/atstk100x_defconfig    |    5 ++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 74b5a6f..5994f43 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -18,7 +18,8 @@ BR2_DEFAULT_KERNEL_HEADERS="2.6.38.8"
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91rm9200ek"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.06"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 9ab6c03..4a779e1 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -14,7 +14,8 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atngw100"
-BR2_TARGET_UBOOT_2010_09=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.09"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 1af5001..fe7e498 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -4,7 +4,8 @@ BR2_avr32=y
 # U-Boot
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
-BR2_TARGET_UBOOT_2010_09=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2010.09"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -15,5 +16,3 @@ BR2_LINUX_KERNEL_DEFCONFIG="atstk1002"
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
-
-
