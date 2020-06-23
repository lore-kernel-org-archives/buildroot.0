From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Tue, 23 Jun 2020 23:04:04 +0000
Subject: [Buildroot] [PATCH 1/1] boot/uboot/: Name U-Boot boot script image
Message-ID: <LRqYEr-8n8UCFItcyNs3C7MB6QE2qjqOzG6oeXtPjF0qV_bhTXsJ2-mD4NDoS9Ro4UsvpwIh8HK5vcnjj87xxjS8QVNoFCyX9WMEBOu17As=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
---
 boot/uboot/Config.in | 5 +++++
 boot/uboot/uboot.mk  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8cce9b1bae..310c4f8186 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -568,6 +568,11 @@ config BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE
        help
          Source file to generate the U-Boot boot script.

+config BR2_TARGET_UBOOT_BOOT_SCRIPT_IMAGE_NAME
+       string "U-Boot boot script image name"
+       help
+         Image (*not* file) name.
+
 endif

 if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 71689207e3..ab945eb159 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -340,6 +340,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
        $(UBOOT_GENERATE_ENV_IMAGE)
        $(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
                $(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
+                       -n $(BR2_TARGET_UBOOT_BOOT_SCRIPT_IMAGE_NAME) \
                        -d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
                        $(BINARIES_DIR)/boot.scr)
 endef
--
2.20.1
