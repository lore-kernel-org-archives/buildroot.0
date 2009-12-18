From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Dec 2009 09:33:45 +0100
Subject: [Buildroot] [git commit master] target/u-boot: install mkimage to
	HOST_DIR
Message-ID: <20091218083552.D374577709@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d77594ccd7f81ac99af68e00bae1eb6b816fc022
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Makefile.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 5f4cd4c..dd45b42 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -14,8 +14,7 @@ U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TARGET_BIN:=u-boot-$(U_BOOT_VERSION)-$(DATE).bin
 
-U_BOOT_TOOLS_BIN:=mkimage
-U_BOOT_TOOLS:=$(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
+U_BOOT_TOOLS:=$(HOST_DIR)/usr/bin/mkimage
 MKIMAGE:=$(U_BOOT_TOOLS)
 U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
@@ -170,7 +169,7 @@ $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 
 $(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
-	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
+	cp -dpf $(U_BOOT_DIR)/tools/mkimage $@
 
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
-- 
1.6.3.3
