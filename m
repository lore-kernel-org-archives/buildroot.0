From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 12:24:19 +0100
Subject: [Buildroot] [git commit] uboot: add COPY_OLD_LICENSE_FILE fix to
	rsync hook
Message-ID: <20151229112427.0C75F81E66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6a40578fc108136d7a23feb7f90f8609962d53c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

make legal-info breaks when using an older u-boot version in local.mk
with OVERRIDE_SRCDIR, due to the reorganization of license files which
happened in u-boot v2013.10.
This issue had already been fixed in Buildroot for the regular use of
old u-boot versions (non-local.mk).
This patch adds the same fix to UBOOT_POST_RSYNC_HOOKS so that it also
covers the local.mk case.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
