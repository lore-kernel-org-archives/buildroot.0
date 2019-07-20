From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 21:46:51 +0200
Subject: [Buildroot] [git commit] boot/opensbi: bump to v0.4
Message-ID: <20190720194510.8D5BB84273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=527f0f4f36f3b5dbe094cd53165871657082ebe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/opensbi/opensbi.hash | 2 +-
 boot/opensbi/opensbi.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index d8449f573a..21f802bcbc 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300 opensbi-0.3.tar.gz
+sha256 d3060bf51af00204ce90fc73106955c694463b59a5b81be64cf780cd32743abf opensbi-0.4.tar.gz
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 45a3fc4859..83552a5442 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSBI_VERSION = 0.3
+OPENSBI_VERSION = 0.4
 OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
 OPENSBI_LICENSE = BSD-2-Clause
 OPENSBI_LICENSE_FILES = COPYING.BSD
@@ -28,6 +28,8 @@ OPENSBI_INSTALL_IMAGES = YES
 define OPENSBI_INSTALL_IMAGES_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
 	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.bin $(BINARIES_DIR)/fw_dynamic.bin
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.elf $(BINARIES_DIR)/fw_dynamic.elf
 endef
 endif
 
