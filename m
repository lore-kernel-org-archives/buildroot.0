From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Sep 2016 00:58:42 +0200
Subject: [Buildroot] [PATCH 3/4 v2] package/jpeg: properly declare providers
In-Reply-To: <cover.1472943074.git.yann.morin.1998@free.fr>
References: <cover.1472943074.git.yann.morin.1998@free.fr>
Message-ID: <075aba7d345fcd6238e2fffbf5d6f22526d4a1e5.1472943074.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libjpeg and jpeg-turo are providers of the jpeg virtual package, so they
must declare themselves as such.

We do not have any problem, because the dependency is computed from the
Kconfig-defined option BR2_PACKAGE_PROVIDES_JPEG, and we do not check
the Makefile-defined <FOO>_PROVIDES variable.

For the sake of correctness, make both libjpeg and jpeg-turo declare
themselves as providers for the jpeg virtual package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.mk | 2 ++
 package/libjpeg/libjpeg.mk       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 047e925..454b648 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -10,6 +10,8 @@ JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
 JPEG_TURBO_LICENSE_FILES = README README-turbo.txt
 JPEG_TURBO_INSTALL_STAGING = YES
+JPEG_TURBO_PROVIDES = jpeg
+
 JPEG_TURBO_CONF_OPTS = --with-jpeg8
 
 ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_ARM_CPU_HAS_NEON),y)
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 14aba61..b8f4bac 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -10,6 +10,7 @@ LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = jpeg-license (BSD-3c-like)
 LIBJPEG_LICENSE_FILES = README
 LIBJPEG_INSTALL_STAGING = YES
+LIBJPEG_PROVIDES = jpeg
 
 define LIBJPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom wrjpgcom)
-- 
2.7.4
