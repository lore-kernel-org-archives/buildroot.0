From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:25:49 +0100
Subject: [Buildroot] [git commit] u-boot: add an option to generate
	u-boot-dtb.bin
Message-ID: <20170305214312.D9DD5820E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fff0732af075a2318766f30c1c84a6405325a24e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4e629c0..1aa2cb7 100644
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
index 6b9d544..ac3b42e 100644
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
