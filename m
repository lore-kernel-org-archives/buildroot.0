From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 29 Dec 2015 00:27:30 -0200
Subject: [Buildroot] [PATCH 1/1] uboot: add COPY_OLD_LICENSE_FILE fix to
	rsync hook
Message-ID: <1451356050-6300-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make legal-info breaks when using an older u-boot version in local.mk
with OVERRIDE_SRCDIR, due to the reorganization of license files which
happened in u-boot v2013.10.
This issue had already been fixed in Buildroot for the regular use of
old u-boot versions (non-local.mk).
This patch adds the same fix to UBOOT_POST_RSYNC_HOOKS so that it also
covers the local.mk case.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 868bf08..c8c50f0 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -110,6 +110,7 @@ define UBOOT_COPY_OLD_LICENSE_FILE
 endef
 
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
+UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
 # Prior to Buildroot 2015.05, only patch directories were supported. New
 # configurations use BR2_TARGET_UBOOT_PATCH instead.
-- 
2.6.4
