From: Lionel Flandrin <lionel@svkt.org>
Date: Mon, 13 Feb 2017 14:59:33 +0100
Subject: [Buildroot] [PATCH 1/2] u-boot: add an option to generate
	u-boot-dtb.bin
In-Reply-To: <20170130103326.14427-2-lionel@svkt.org>
References: <20170130103326.14427-2-lionel@svkt.org>
Message-ID: <20170213135934.32014-1-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4e629c0ef..1aa2cb7b4 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -159,6 +159,9 @@ config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 	default y
 
+config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
+	bool "u-boot-dtb.bin"
+
 config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
 	bool "u-boot-dtb.img"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6b9d54454..ac3b42e42 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -74,6 +74,11 @@ UBOOT_BINS += u-boot-dtb.img
 UBOOT_MAKE_TARGET += u-boot-dtb.img
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_BIN),y)
+UBOOT_BINS += u-boot-dtb.bin
+UBOOT_MAKE_TARGET += u-boot-dtb.bin
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BINS += u-boot.img
 UBOOT_MAKE_TARGET += u-boot.img
-- 
2.11.0
