From: Drew Fustini <drew@beagleboard.org>
Date: Tue,  8 Jun 2021 23:38:37 -0700
Subject: [Buildroot] [PATCH 3/3] boot/beaglev-secondboot: add LICENSE file
In-Reply-To: <20210609063834.2193864-1-drew@beagleboard.org>
References: <20210609063834.2193864-1-drew@beagleboard.org>
Message-ID: <20210609063834.2193864-3-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update git commit ID to include recently added LICENSE file

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 3 ++-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index e0ca0e149dab..efc93347b16c 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  56519b20a8ac2b68770cacd5158190dfcb2b3762a759b1c44582ca25ffbccc5d  beaglev-secondboot-e976d186e69a1a84884265b0689626fa254a950d.tar.gz
+sha256  fe4d37f3ff38e7f2da70a08f9cb1668c0b928e85d2e0935bd985f910b3ce30e9  beaglev-secondboot-2d20047960044308126117ad56bc08a1164e82b2.tar.gz
+sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index 6d904b02ba31..a423c6c6a697 100644
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
-- 
2.27.0
