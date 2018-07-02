From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:11 +0200
Subject: [Buildroot] [PATCH 37/50] package/busybox: invert dependency with
 gawk
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <d2c46a866584b64839e8cd8812da173ca366a53d.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/gawk/gawk.mk       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index de9498ab64..e793c57619 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_GAWK),gawk) \
 	$(if $(BR2_PACKAGE_GREP),grep) \
 	$(if $(BR2_PACKAGE_GZIP),gzip) \
 	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 0779736882..1315abb9ee 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -11,11 +11,6 @@ GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
 
-# Prefer full-blown gawk over busybox awk
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-GAWK_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv
 endif
-- 
2.14.1
