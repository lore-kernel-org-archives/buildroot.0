From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:20 +0200
Subject: [Buildroot] [PATCH 46/50] package/busybox: invert dependency with
 binutils
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <ebee4ae0dcb4ba654b7a4254a993293cfb94e02e.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/binutils.mk | 5 -----
 package/busybox/busybox.mk   | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index cb6022f7fa..090065a3e4 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -72,11 +72,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
 BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
 endif
 
-# Install binutils after busybox to prefer full-blown utilities
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BINUTILS_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BINUTILS_DEPENDENCIES += zlib
 endif
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0ba8d792fb..d0a49c7495 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
 	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
 	$(if $(BR2_PACKAGE_CPIO),cpio) \
 	$(if $(BR2_PACKAGE_DCRON),dcron) \
-- 
2.14.1
