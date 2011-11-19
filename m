From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 19 Nov 2011 14:17:17 +0100
Subject: [Buildroot] Buildroot U-boot user patch applying problem
Message-ID: <B55DD04487614DE2890707C4FF7B640E@NX5000J>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot U-boot user patch name shoud be formated
u-boot-<version>-<descryption>.patch

buildroot-2011.11.rc2  patch

Buildroot U-boot user patch applying problem Jerzy Grzegorek  jerzy.grzegorek at trzebnica.net

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk

index cf22312..c3818c5 100644

--- a/boot/uboot/uboot.mk

+++ b/boot/uboot/uboot.mk

@@ -53,7 +53,7 @@ endef

ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)

define UBOOT_APPLY_CUSTOM_PATCHES

support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \

- uboot-$(UBOOT_VERSION)-\*.patch

+ u-boot-$(UBOOT_VERSION)-\*.patch

endef


UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES

This same bug is in this year previous versions of BUILDROOT.

Regards,

Jerzy




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111119/9f22fc42/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uboot.patch
Type: application/octet-stream
Size: 472 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111119/9f22fc42/attachment.obj>
