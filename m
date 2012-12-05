From: Gary Coulbourne <bear@bears.org>
Date: Wed, 5 Dec 2012 11:48:27 -0500
Subject: [Buildroot] [PATCH] add support for Freescale .sb format to uboot
Message-ID: <CAEnpE0yzcer9dNew-6yfwmjf+L+a=Kgrf-tZ++Y2gMRcwmGYLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch offers the option to build u-boot.sb

---
 boot/uboot/Config.in |    4 ++++
 boot/uboot/uboot.mk  |    3 +++
 2 files changed, 7 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d8458d9..9b7a3b0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -94,6 +94,10 @@ config BR2_TARGET_UBOOT_FORMAT_AIS
   It is required to load code/data on OMAP-L1 processors.
   u-boot.ais contains U-Boot with the SPL support.

+config BR2_TARGET_UBOOT_FORMAT_SB
+        depends on BR2_arm
+        bool "u-boot.sb"
+
 config BR2_TARGET_UBOOT_FORMAT_BIN
  bool "u-boot.bin"

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 619f2e1..4a98583 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -37,6 +37,9 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN          = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN          = u-boot.img
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
+UBOOT_BIN          = u-boot.sb
+UBOOT_MAKE_TARGET  = $(UBOOT_BIN)
 else
 UBOOT_BIN          = u-boot.bin
 UBOOT_BIN_IFT      = $(UBOOT_BIN).ift
--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121205/9181a361/attachment.html>
