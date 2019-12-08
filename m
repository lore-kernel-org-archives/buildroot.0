From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:22:08 +0100
Subject: [Buildroot] [git commit] boot/uboot: add option to build u-boot.itb
 image
Message-ID: <20191208211349.6F7E288DDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cde2f0ce6dad73f97d24b396dfc5c50e031795ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It allows you to add the u-boot.itb to the list of U-Boot images that
can be created. Like the others, this one is also copied to the image
folder.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
