From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:00:02 +0200
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime_mali:
 rename to olimex_a20_olinuxino_lime_legacy
Message-ID: <20180918190044.0D57A884B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d756c736a9eb0551910377890ce36de8c04afd1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit renames olimex_a20_olinuxino_lime_mali to
olimex_a20_olinuxino_lime_legacy, because the upstream Linux kernel
now also supports using the Mali GPU.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                                        | 2 +-
 board/olimex/a20_olinuxino/{boot-mali.cmd => boot-legacy.cmd}         | 0
 board/olimex/a20_olinuxino/readme.txt                                 | 4 ++--
 ...lime_mali_defconfig => olimex_a20_olinuxino_lime_legacy_defconfig} | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d3d544b020..05e54ab6b6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -171,7 +171,7 @@ olimex_a10_olinuxino_lime_defconfig: *defconfig
 olimex_a13_olinuxino_defconfig: *defconfig
 olimex_a20_olinuxino_lime2_defconfig: *defconfig
 olimex_a20_olinuxino_lime_defconfig: *defconfig
-olimex_a20_olinuxino_lime_mali_defconfig: *defconfig
+olimex_a20_olinuxino_lime_legacy_defconfig: *defconfig
 olimex_a20_olinuxino_micro_defconfig: *defconfig
 olimex_a64_olinuxino_defconfig: *defconfig
 olimex_imx233_olinuxino_defconfig: *defconfig
diff --git a/board/olimex/a20_olinuxino/boot-mali.cmd b/board/olimex/a20_olinuxino/boot-legacy.cmd
similarity index 100%
rename from board/olimex/a20_olinuxino/boot-mali.cmd
rename to board/olimex/a20_olinuxino/boot-legacy.cmd
diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 070b7a5ec7..57ee23d147 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -16,7 +16,7 @@ The following defconfigs are available:
    for the A20-OLinuXino-MICRO board using mainline kernel
  - olimex_a20_olinuxino_lime_defconfig
    for the A20-OLinuXino-LIME board using mainline kernel
- - olimex_a20_olinuxino_lime_mali_defconfig
+ - olimex_a20_olinuxino_lime_legacy_defconfig
    for the A20-OLinuXino-LIME board using legacy linux-sunxi kernel
  - olimex_a20_olinuxino_lime2_defconfig
    for the A20-OLinuXino-LIME2 board using mainline kernel
@@ -51,7 +51,7 @@ After building, you should get a tree like this:
     output/images/
     +-- rootfs.ext2
     +-- rootfs.ext4 -> rootfs.ext2
-    +-- script.bin (lime_mali)
+    +-- script.bin (lime_legacy)
     +-- sdcard.img
     +-- sun7i-a20-olinuxino-lime.dtb (lime, mainline)
     +-- sun7i-a20-olinuxino-lime2.dtb (lime2, mainline)
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_legacy_defconfig
similarity index 99%
rename from configs/olimex_a20_olinuxino_lime_mali_defconfig
rename to configs/olimex_a20_olinuxino_lime_legacy_defconfig
index f04d578f13..c14c2ca995 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_legacy_defconfig
@@ -47,7 +47,7 @@ BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot-mali.cmd"
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot-legacy.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
