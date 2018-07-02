From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:09 +0200
Subject: [Buildroot] [PATCH 35/50] package/busybox: invert dependency with
 gzip
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <fde5ab16c9aca787cf4bde212215b5a0d70b8d4e.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/gzip/gzip.mk       | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3c8c251015..5d28d9ee46 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_GZIP),gzip) \
 	$(if $(BR2_PACKAGE_I2C_TOOLS),i2c-tools) \
 	$(if $(BR2_PACKAGE_IFENSLAVE),ifenslave) \
 	$(if $(BR2_PACKAGE_IFPLUGD),ifplugd) \
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 26fc8ec347..d69215a850 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -9,8 +9,6 @@ GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
 GZIP_CONF_OPTS = --exec-prefix=/
-# Prefer full gzip over potentially lightweight/slower from busybox
-GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 GZIP_LICENSE = GPL-3.0+
 GZIP_LICENSE_FILES = COPYING
 GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
-- 
2.14.1
