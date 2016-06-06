From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:39:57 +0200
Subject: [Buildroot] [git commit] configs/beaglebone: Bump U-Boot version
Message-ID: <20160606204007.2B8D281EB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f4e8dbc2f95add3b86503dcf9f8a8f50c96b9fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently selected version of U-Boot fails to compile.
Dying words are:

  gcc -g -O2 -I/home/zeta/buildroot/buildroot/output/host/usr/include -c -o env_embedded.o /home/zeta/buildroot/buildroot/output/build/uboot-2013.10/common/env_embedded.c
  /home/zeta/buildroot/buildroot/output/build/uboot-2013.10/lib/crc32.c:14:20: fatal error: common.h: No such file or directory
  compilation terminated.
  Makefile:258: recipe for target 'crc32.o' failed

Since it's quite old, instead of trying to fix it, let's
just upgrade.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 99c845d..6c49abf 100644
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
