From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 16:41:25 +0200
Subject: [Buildroot] [git commit] u-boot: add option for Freescale
	u-boot.imx format
Message-ID: <20130926144208.D33839B879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8326cb643d29f7259905a1c157611e6f53c5cad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1b98339..998cda2 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -87,6 +87,9 @@ config BR2_TARGET_UBOOT_FORMAT_BIN
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
 
+config BR2_TARGET_UBOOT_FORMAT_IMX
+	bool "u-boot.imx"
+
 config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 631da6b..dc8e26f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -40,6 +40,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN          = u-boot.img
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
+UBOOT_BIN          = u-boot.imx
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
 UBOOT_BIN          = u-boot.sb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
