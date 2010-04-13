From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:25 +0200
Subject: [Buildroot] [PATCH 13/35] u-boot: remove useless symbolic link
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <08cd2ccdfc51597e63de8718f9a94e6da8757a45.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index efde3ea..ac16c8b 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -11,7 +11,6 @@ U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
 U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
-U_BOOT_TARGET_BIN:=u-boot-$(U_BOOT_VERSION)-$(DATE).bin
 
 U_BOOT_TOOLS:=$(HOST_DIR)/usr/bin/mkimage
 MKIMAGE:=$(U_BOOT_TOOLS)
@@ -153,9 +152,7 @@ $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
-	rm -f $(BINARIES_DIR)/$(U_BOOT_TARGET_BIN)
-	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/$(U_BOOT_TARGET_BIN)
-	(cd $(BINARIES_DIR); ln -s $(U_BOOT_TARGET_BIN) $(U_BOOT_BIN))
+	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/
 
 $(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
-- 
1.6.3.3
