From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:03 +0200
Subject: [Buildroot] [PATCH 29/50] package/busybox: invert dependency with
 iputils
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <ee2f5fe229bb9b5fd4db563efa7195949efbb816.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/iputils/iputils.mk | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e16ee61053..3412bcb3d5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_IPUTILS),iputils) \
 	$(if $(BR2_PACKAGE_KMOD),kmod) \
 	$(if $(BR2_PACKAGE_LESS),less) \
 	$(if $(BR2_PACKAGE_LSOF),lsof) \
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 13e33898d6..713b0e4abf 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -17,12 +17,6 @@ IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
 # Only includes a license file for BSD
 IPUTILS_LICENSE_FILES = ninfod/COPYING
 
-# Build after busybox so target ends up with this package's full
-# versions of the applications instead of busybox applets.
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-IPUTILS_DEPENDENCIES += busybox
-endif
-
 IPUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) USE_SYSFS=no USE_IDN=no\
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-- 
2.14.1
