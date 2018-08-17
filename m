From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:51:01 +0200
Subject: [Buildroot] [git commit] sheevaplug_defconfig: bump u-boot to
 2018.07 to fix build issue
Message-ID: <20180817145447.9486C8D4F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f09daba15fc4d412aadb02491a4baab138d368e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

u-boot 2016.05 no longer builds with the default gcc/binutils versions:

https://gitlab.com/buildroot.org/buildroot/-/jobs/88314946

  LD      u-boot
fs/built-in.o: In function `read_symbol':
/builds/buildroot.org/buildroot/output/build/uboot-2016.05/fs/jffs2/mini_inflate.c:129: undefined reference to `pull_bit'
fs/built-in.o: In function `decompress_huffman':
/builds/buildroot.org/buildroot/output/build/uboot-2016.05/fs/jffs2/mini_inflate.c:159: undefined reference to `pull_bits'
/builds/buildroot.org/buildroot/output/build/uboot-2016.05/fs/jffs2/mini_inflate.c:170: undefined reference to `pull_bits'
..
/builds/buildroot.org/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-ld.bfd: BFD (GNU Binutils) 2.29.1 assertion fail elf32-arm.c:9509
Makefile:1192: recipe for target 'u-boot' failed
make[1]: *** [u-boot] Error 1
make[1]: Leaving directory '/builds/buildroot.org/buildroot/output/build/uboot-2016.05'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index edafffe0a0..17139f7afb 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sheevaplug"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
 BR2_TARGET_UBOOT_FORMAT_KWB=y
 # BR2_TARGET_UBOOT_NETWORK is not set
 
