From: Drew Fustini <drew@beagleboard.org>
Date: Tue,  8 Jun 2021 23:38:35 -0700
Subject: [Buildroot] [PATCH 2/3] boot/beaglev-ddrinit: add LICENSE file
In-Reply-To: <20210609063834.2193864-1-drew@beagleboard.org>
References: <20210609063834.2193864-1-drew@beagleboard.org>
Message-ID: <20210609063834.2193864-2-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update git commit ID to include recently added LICENSE file

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 boot/beaglev-ddrinit/beaglev-ddrinit.hash | 3 ++-
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
index 7f433466964f..2aaab53a3b8a 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  df58c3da7a6f429095f4d56e7f1f5b7c855a0cbe82a2569586ce0c5fdd1bf256  beaglev-ddrinit-2e2f6faaf1059b61bb06ea00404199d1de55f201.tar.gz
+sha256  2d491f64bd77de9dfd4b8ae6c00e83670e80c205cc20917fefa6194b1dc1fe4e  beaglev-ddrinit-c0839f25246d9e308c23498d344ca13d8a7ad6ed.tar.gz
+sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
index 2f1ce3ee87a0..76406ed4c593 100644
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -5,14 +5,13 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = 2e2f6faaf1059b61bb06ea00404199d1de55f201
+BEAGLEV_DDRINIT_VERSION = c0839f25246d9e308c23498d344ca13d8a7ad6ed
 BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
 BEAGLEV_DDRINIT_INSTALL_TARGET = NO
 BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
 BEAGLEV_DDRINIT_DEPENDENCIES = host-riscv64-elf-toolchain
-# unfortunately, no real license file, but several sources files are
-# under GPL-2.0+, making the whole work GPL-2.0+
 BEAGLEV_DDRINIT_LICENSE = GPL-2.0+
+BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
 
 define BEAGLEV_DDRINIT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
-- 
2.27.0
