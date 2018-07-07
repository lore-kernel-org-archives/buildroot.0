From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:52:02 +0200
Subject: [Buildroot] [git commit] uboot: Introduce
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX
Message-ID: <20180707215102.A384487FE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a777a426a0ba211eccaf70866537ef3ad08d2d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some i.MX boards which use device tree to describe the hardware
for U-Boot generate a u-boot-dtb.imx binary.

Introduce the BR2_TARGET_UBOOT_FORMAT_DTB_IMX option to
handle such case.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 482711ca64..7f8291abe8 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -190,6 +190,9 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 config BR2_TARGET_UBOOT_FORMAT_DTB_IMG
 	bool "u-boot-dtb.img"
 
+config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
+	bool "u-boot-dtb.imx"
+
 config BR2_TARGET_UBOOT_FORMAT_IMG
 	bool "u-boot.img"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6ef275e842..bf227f2893 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -70,6 +70,11 @@ UBOOT_BINS += u-boot-dtb.img
 UBOOT_MAKE_TARGET += u-boot-dtb.img
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMX),y)
+UBOOT_BINS += u-boot-dtb.imx
+UBOOT_MAKE_TARGET += u-boot-dtb.imx
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_BIN),y)
 UBOOT_BINS += u-boot-dtb.bin
 UBOOT_MAKE_TARGET += u-boot-dtb.bin
