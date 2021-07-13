From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Jul 2021 21:18:50 +0200
Subject: [Buildroot] [git commit] boot/beaglev-secondboot: update to
 2d200479 to add LICENSE file
Message-ID: <20210713184715.57D4391510@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa2875fba62a493d0ffbbf7cecffe63936e21cc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update git commit ID to include recently added LICENSE file

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 3 ++-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index e0ca0e149d..efc93347b1 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  56519b20a8ac2b68770cacd5158190dfcb2b3762a759b1c44582ca25ffbccc5d  beaglev-secondboot-e976d186e69a1a84884265b0689626fa254a950d.tar.gz
+sha256  fe4d37f3ff38e7f2da70a08f9cb1668c0b928e85d2e0935bd985f910b3ce30e9  beaglev-secondboot-2d20047960044308126117ad56bc08a1164e82b2.tar.gz
+sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index 6d904b02ba..a423c6c6a6 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
@@ -5,14 +5,13 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = e976d186e69a1a84884265b0689626fa254a950d
+BEAGLEV_SECONDBOOT_VERSION = 2d20047960044308126117ad56bc08a1164e82b2
 BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
 BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
 BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
 BEAGLEV_SECONDBOOT_DEPENDENCIES = host-riscv64-elf-toolchain
-# unfortunately, no real license file, but several sources files are
-# under GPL-2.0+, making the whole work GPL-2.0+
 BEAGLEV_SECONDBOOT_LICENSE = GPL-2.0+
+BEAGLEV_SECONDBOOT_LICENSE_FILES = LICENSE
 
 define BEAGLEV_SECONDBOOT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
