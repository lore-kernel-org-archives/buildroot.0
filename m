From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 12:47:55 +0100
Subject: [Buildroot] [PATCH 1/1] libenca: Add iconv support
Message-ID: <BLU0-SMTP1974ADE6475CCDAFD75D41ED9BB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch depends on http://patchwork.ozlabs.org/patch/311506/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libenca/Config.in  |    1 +
 package/libenca/libenca.mk |    5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libenca/Config.in b/package/libenca/Config.in
index 5e951ed..58217dc 100644
--- a/package/libenca/Config.in
+++ b/package/libenca/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_LIBENCA
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	bool "libenca"
 	help
 	  Extremely Naive Charset Analyser
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index e69c124..1c5c162 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -10,6 +10,7 @@ LIBENCA_INSTALL_STAGING = YES
 LIBENCA_AUTORECONF = YES
 LIBENCA_LICENSE = GPLv2
 LIBENCA_LICENSE_FILES = COPYING
+LIBENCA_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes \
 			ac_cv_file__dev_urandom=yes \
@@ -30,7 +31,3 @@ endef
 LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
 
 $(eval $(autotools-package))
-
-XERCES_CONF_OPT = --disable-threads \
-		  --with-gnu-ld
-
-- 
1.7.9.5
