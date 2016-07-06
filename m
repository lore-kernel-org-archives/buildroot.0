From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:06:45 +0200
Subject: [Buildroot] [git commit] boot/uboot: fix missing closing parenthesis
Message-ID: <20160706190657.D849D821AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c26cc8170e187ab6aa4175630fb6c9bfaf0a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was a typo in commit
b05ff12b6cd38566003b99291a47a56cbd88f396 ("uboot: install multiple spl
images"), leading to a missing closing parenthesis. This commit fixes
this typo.

Fixes bug #9086

Reported-by: Jebodiah Sensai <dkaplan65@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk     | 2 +-
 package/tekui/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 065bdf9..7c3512a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -203,7 +203,7 @@ ifeq ($(BR2_TARGET_UBOOT_ZYNQ_IMAGE),y)
 define UBOOT_GENERATE_ZYNQ_IMAGE
 	$(HOST_DIR)/usr/bin/python2 \
 		$(HOST_DIR)/usr/bin/zynq-boot-bin.py \
-		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) \
+		-u $(@D)/$(firstword $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))) \
 		-o $(BINARIES_DIR)/BOOT.BIN
 endef
 UBOOT_DEPENDENCIES += host-zynq-boot-bin
diff --git a/package/tekui/Config.in b/package/tekui/Config.in
index 244b18b..1203667 100644
--- a/package/tekui/Config.in
+++ b/package/tekui/Config.in
@@ -17,5 +17,5 @@ config BR2_PACKAGE_TEKUI
 	  http://tekui.neoscientists.org/
 
 comment "tekui needs a Lua interpreter and a toolchain w/ threads, dynamic library"
-	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || !BR2_TOOLCHAIN_HAS_THREADS ||
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
