From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Jul 2011 13:43:37 +0200
Subject: [Buildroot] [git commit] uboot: unbreak kirkwood format handling
	after a4ca959321
Message-ID: <20110714114411.6331F8A597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=908c5610cc2e74340b6e589e4331cee780dea05e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a4ca959321 (u-boot: rename to uboot) forgot to change the kirkwood
format handling to look for the new variable name, breaking support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/uboot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ec592e1..0610e4c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BIN          = u-boot.kwb
-UBOOT_MAKE_TARGET  = $(U_BOOT_BIN)
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
 UBOOT_BIN          = u-boot.ldr
 else
-- 
1.7.3.4
