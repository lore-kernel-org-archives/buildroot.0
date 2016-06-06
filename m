From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon,  6 Jun 2016 14:05:35 -0300
Subject: [Buildroot] [PATCH v2] beaglebone: Bump U-Boot version
In-Reply-To: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1465232735-32705-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently selected version of U-Boot fails to compile.
Dying words are:

  gcc -g -O2 -I/home/zeta/buildroot/buildroot/output/host/usr/include -c -o env_embedded.o /home/zeta/buildroot/buildroot/output/build/uboot-2013.10/common/env_embedded.c
  /home/zeta/buildroot/buildroot/output/build/uboot-2013.10/lib/crc32.c:14:20: fatal error: common.h: No such file or directory
  compilation terminated.
  Makefile:258: recipe for target 'crc32.o' failed

Since it's quite old, instead of trying to fix it, let's
just upgrade.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
Changes from v1:

  * Bump to a specific version instead of using the default.

 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index d44636173264..206417dc1cce 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
-- 
2.7.0
