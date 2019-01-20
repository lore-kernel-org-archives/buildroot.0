From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 21:54:22 +0100
Subject: [Buildroot] [git commit] exempi: fix libiconv dependency
Message-ID: <20190120205454.6FFED8D469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca73191cf22e404175726c5f2ad4d450b4c7c3f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/a77a891683ae9a135dc31be1b419061922d0e1ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exempi/Config.in | 1 +
 package/exempi/exempi.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/exempi/Config.in b/package/exempi/Config.in
index ed71e0fb12..c9af219a20 100644
--- a/package/exempi/Config.in
+++ b/package/exempi/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EXEMPI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_ZLIB
 	help
 	  Exempi is an implementation of XMP (Extensible Metadata
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index e7b297ffe1..91b1d5da1f 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -9,7 +9,8 @@ EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
 EXEMPI_CONF_OPTS = --disable-unittest
-EXEMPI_DEPENDENCIES = host-pkgconf expat zlib
+EXEMPI_DEPENDENCIES = host-pkgconf expat zlib \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 EXEMPI_LICENSE = BSD-3-Clause
 EXEMPI_LICENSE_FILES = COPYING
 
