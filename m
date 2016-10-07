From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 7 Oct 2016 11:39:39 -0300
Subject: [Buildroot] [PATCH v2] Revert "boot/uboot: allow to build
 multiple U-Boot images"
In-Reply-To: <20161007160515.2a6bc730@free-electrons.com>
References: <1475761393-29715-1-git-send-email-fabio.estevam@nxp.com>
 <20161007160515.2a6bc730@free-electrons.com>
Message-ID: <CAOMZO5D9_1g0WiTgz-TPT0w1QwP3Bonu4Lkotvw1Em4+M7Z4cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 7, 2016 at 11:05 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> I don't think we want to revert this patch. Instead, we want to call
> "make all" unconditionally.

Like this?

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7379a4d..86e5b84 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -48,6 +48,9 @@ UBOOT_MAKE_TARGET += mdbtrick
 endif
 endif

+# Call 'make all' unconditionally
+UBOOT_MAKE_TARGET += all
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BINS += u-boot.kwb
 UBOOT_MAKE_TARGET += u-boot.kwb
@@ -68,7 +71,7 @@ endif

 ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
 UBOOT_BINS += u-boot-dtb.img
-UBOOT_MAKE_TARGET += all u-boot-dtb.img
+UBOOT_MAKE_TARGET += u-boot-dtb.img
 endif

 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
