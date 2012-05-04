From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 May 2012 22:08:32 -0300
Subject: [Buildroot] [PATCH 1/8] qemu/sh4-r2d: update to use kernel 3.2.16
Message-ID: <1336093719-20972-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to use kernel version 3.2.16
Still keep sh4-r2d qemu sample config on 3.2 series since the sh-sci
driver from 3.3 uses unimplemented functionality (as of qemu 1.0.1)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_sh4_r2d_defconfig |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index e344e71..58ace03 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -15,13 +15,12 @@ BR2_KERNEL_HEADERS_3_2=y
 
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
-BR2_GCC_VERSION_4_5_X=y
 BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.3.4
