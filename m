From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 28 Oct 2019 10:26:58 -0700
Subject: [Buildroot] [PATCH 3/3] package/at-spi2-atk: bump to version 2.34.1
In-Reply-To: <20191028172658.923021-1-joseph.kogut@gmail.com>
References: <20191028172658.923021-1-joseph.kogut@gmail.com>
Message-ID: <20191028172658.923021-3-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, change the package type from autotools to meson, and add libxml2
to dependencies.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/at-spi2-atk/Config.in        | 1 +
 package/at-spi2-atk/at-spi2-atk.hash | 2 +-
 package/at-spi2-atk/at-spi2-atk.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/at-spi2-atk/Config.in b/package/at-spi2-atk/Config.in
index 9a7cfde0af..66659171d5 100644
--- a/package/at-spi2-atk/Config.in
+++ b/package/at-spi2-atk/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_AT_SPI2_ATK
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
 	help
 	  The At-Spi2 Atk package contains a library that bridges
 	  ATK to At-Spi2 D-Bus service.
diff --git a/package/at-spi2-atk/at-spi2-atk.hash b/package/at-spi2-atk/at-spi2-atk.hash
index 77c8f68e47..10b4d6f128 100644
--- a/package/at-spi2-atk/at-spi2-atk.hash
+++ b/package/at-spi2-atk/at-spi2-atk.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e  at-spi2-atk-2.26.2.tar.xz
+sha256 776df930748fde71c128be6c366a987b98b6ee66d508ed9c8db2355bf4b9cc16  at-spi2-atk-2.34.1.tar.xz
 sha256 c6105b34ab6829ff5c70eba234f40053215fa9f8383ced271b0e370a1923624b  COPYING
diff --git a/package/at-spi2-atk/at-spi2-atk.mk b/package/at-spi2-atk/at-spi2-atk.mk
index 4ef681b3b1..ed95b1601e 100644
--- a/package/at-spi2-atk/at-spi2-atk.mk
+++ b/package/at-spi2-atk/at-spi2-atk.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-AT_SPI2_ATK_VERSION_MAJOR = 2.26
-AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).2
+AT_SPI2_ATK_VERSION_MAJOR = 2.34
+AT_SPI2_ATK_VERSION = $(AT_SPI2_ATK_VERSION_MAJOR).1
 AT_SPI2_ATK_SOURCE = at-spi2-atk-$(AT_SPI2_ATK_VERSION).tar.xz
 AT_SPI2_ATK_SITE =  http://ftp.gnome.org/pub/gnome/sources/at-spi2-atk/$(AT_SPI2_ATK_VERSION_MAJOR)
 AT_SPI2_ATK_LICENSE = LGPL-2.0+
 AT_SPI2_ATK_LICENSE_FILES = COPYING
 AT_SPI2_ATK_INSTALL_STAGING = YES
-AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 host-pkgconf
+AT_SPI2_ATK_DEPENDENCIES = atk at-spi2-core libglib2 libxml2 host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.23.0
