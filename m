From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Dec 2011 16:50:05 +0100
Subject: [Buildroot] [git commit] u-boot: add support for u-boot-nand.bin
Message-ID: <20111201155255.6754B8F733@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a03182ad020e01744f783a8668c29cc6e8008122
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the u-boot-nand.bin target file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index dd49a2c..f154bd1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -85,6 +85,9 @@ choice
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
+config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
+	bool "u-boot-nand.bin"
+
 config BR2_TARGET_UBOOT_FORMAT_KWB
 	depends on BR2_arm
 	bool "u-boot.kwb (Marvell)"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cf22312..db9de8d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -27,6 +27,8 @@ UBOOT_BIN          = u-boot.kwb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
+UBOOT_BIN          = u-boot-nand.bin
 else
 UBOOT_BIN          = u-boot.bin
 endif
