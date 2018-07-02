From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:02 +0200
Subject: [Buildroot] [PATCH 28/50] package/busybox: invert dependency with
 kmod
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <a51e3a1169f5b6153f5432649f2b6e0f133ee75b.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/kmod/kmod.mk       | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 4a7afa2516..e16ee61053 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_KMOD),kmod) \
 	$(if $(BR2_PACKAGE_LESS),less) \
 	$(if $(BR2_PACKAGE_LSOF),lsof) \
 	$(if $(BR2_PACKAGE_MTD),mtd) \
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e1149b7b65..7c796ab19f 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -49,9 +49,6 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE := $(KMOD_LICENSE), GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# take precedence over busybox implementation
-KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-
 # /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 KMOD_BIN_PATH = ../bin/kmod
-- 
2.14.1
