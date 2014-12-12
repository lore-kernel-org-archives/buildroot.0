From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 13 Dec 2014 00:16:02 +0100
Subject: [Buildroot] [PATCH 05/14] boot/uboot.mk: Replace
	TARGET_CONFIGURE_OPTS with TARGET_MAKE_ENV
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <1418426171-3483-6-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the make environment variable TARGET_MAKE_ENV for `make <board>_defconfig`
and `make` instead of the configuration options variable TARGET_CONFIGURE_OPTS.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 boot/uboot/uboot.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1af7e52..f1d40a1 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -101,7 +101,7 @@ endif
 
 define UBOOT_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 $(UBOOT_SOURCE_CONFIG) $(UBOOT_DIR)/configs/buildroot_defconfig
-	$(TARGET_CONFIGURE_OPTS) 	\
+	$(TARGET_MAKE_ENV) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)		\
 		buildroot_config
 	rm $(UBOOT_DIR)/configs/buildroot_defconfig
@@ -121,7 +121,7 @@ define UBOOT_CONFIGURE_CMDS
 endef
 
 define UBOOT_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) 	\
+	$(TARGET_MAKE_ENV) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
 endef
-- 
2.1.3
