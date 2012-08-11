From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:23:36 +0200
Subject: [Buildroot] [git commit branch/next] u-boot: add AIS target format
Message-ID: <20120811183029.7C83A97169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80b43964d01d5c84f66497d6295d786ff925c7de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    8 ++++++++
 boot/uboot/uboot.mk  |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index afc2f91..900fac7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -79,6 +79,14 @@ endif
 
 choice
 	prompt "U-Boot binary format"
+	default BR2_TARGET_UBOOT_FORMAT_BIN
+
+config BR2_TARGET_UBOOT_FORMAT_AIS
+	bool "u-boot.ais"
+	help
+	  AIS (Application Image Script) is a format defined by TI.
+	  It is required to load code/data on OMAP-L1 processors.
+	  u-boot.ais contains U-Boot with the SPL support.
 
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9e03d6a..b61400e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -25,6 +25,9 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BIN          = u-boot.kwb
 UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_AIS),y)
+UBOOT_BIN          = u-boot.ais
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
