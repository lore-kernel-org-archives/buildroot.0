From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:50:24 +0200
Subject: [Buildroot] [git commit] uboot: add a new binary format for
	u-boot.img
Message-ID: <20120505215402.BFD8B96AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81302ba68569ff62566fe463a4a8ac1a1d12baca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some platforms like OMAP, a new binary format is now being used
for u-boot: u-boot.img. It is basically u-boot.bin which has been
processed with mkimage.

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    3 +++
 boot/uboot/uboot.mk  |    2 ++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index cb40648..f83cf4b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -83,6 +83,9 @@ choice
 config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 
+config BR2_TARGET_UBOOT_FORMAT_IMG
+	bool "u-boot.img"
+
 config BR2_TARGET_UBOOT_FORMAT_NAND_BIN
 	bool "u-boot-nand.bin"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f64964c..3119092 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -29,6 +29,8 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
+UBOOT_BIN          = u-boot.img
 else
 UBOOT_BIN          = u-boot.bin
 endif
