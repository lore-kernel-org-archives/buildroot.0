From: Dario Binacchi <dariobin@libero.it>
Date: Tue,  3 Dec 2019 22:36:22 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: allow to build u-boot.itb image
Message-ID: <20191203213622.29133-1-dariobin@libero.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It allows you to add the u-boot.itb to the list of U-Boot images that
can be created.
Like the others, this one is also copied to the image folder.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 68a915cdae..15cae8045a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -225,6 +225,9 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
 
+config BR2_TARGET_UBOOT_FORMAT_ITB
+	bool "u-boot.itb"
+
 config BR2_TARGET_UBOOT_FORMAT_IMX
 	bool "u-boot.imx"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5e0f614024..0ebda6588c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -85,6 +85,11 @@ UBOOT_BINS += u-boot.img
 UBOOT_MAKE_TARGET += u-boot.img
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ITB),y)
+UBOOT_BINS += u-boot.itb
+UBOOT_MAKE_TARGET += u-boot.itb
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
 UBOOT_BINS += u-boot.imx
 UBOOT_MAKE_TARGET += u-boot.imx
-- 
2.24.0
