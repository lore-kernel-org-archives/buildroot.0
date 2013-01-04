From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Jan 2013 12:13:46 -0300
Subject: [Buildroot] [PATCH] configs/at91rm9200df: update and fix
Message-ID: <1357312426-9544-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the latest maxim.org.za kernel 2.6.38
Lock down headers version, otherwise we were building a toolchain with
3.7 headers for a 2.6.33 kernel - not too wise.
Also the AT91RM9200 is an ARM920T so enable that target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/at91rm9200df_defconfig |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index 4229155..74b5a6f 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -1,5 +1,6 @@
 # Architecture
 BR2_arm=y
+BR2_arm920t=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_JFFS2=y
@@ -9,6 +10,11 @@ BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x2100
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 BR2_TARGET_ROOTFS_JFFS2_LE=y
 
+# Lock down headers to avoid breaking with new defaults
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="2.6.38.8"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.38.8"
+
 # Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91rm9200ek"
@@ -17,7 +23,7 @@ BR2_TARGET_UBOOT_2010_06=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.33"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.33-at91.patch.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38.8"
+BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.38-at91.patch.gz"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91rm9200ek"
-- 
1.7.8.6
