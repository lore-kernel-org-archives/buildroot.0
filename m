From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 26 Jun 2013 20:49:40 +0200
Subject: [Buildroot] [PATCH v3] package/libmicrohttpd: minor fixes and
	additions
Message-ID: <1372272580-26574-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Correcting the indentation inside Config.in. Also adding the missed
license information.

Note: libmicrohttpd is partialy dual licensed, if you don't need or want
to use the HTTPS option you can choose between LPGLv2.1+ and the eCos
license (http://ecos.sourceware.org/license-overview.html).
If you use the HTTPS option you have to agree to the LGPLv2.1+!

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
Changes in v3:
	- change implementation of the licenses and correct LGPLv2.1+ version
	  as Arnout argumented

Changes in v2:
	- reworking 'Config.in' after suggestions from Thomas Petazzoni
	- fixed LIBDVBSI_SITE for correct download URL mentioned by Yann Morin

 package/libmicrohttpd/Config.in        |   14 +++++++-------
 package/libmicrohttpd/libmicrohttpd.mk |    5 ++++-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 2e4de0f..5c20ba6 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -8,13 +8,13 @@ config BR2_PACKAGE_LIBMICROHTTPD
 	  http://www.gnu.org/software/libmicrohttpd/
 
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
-       bool "https support"
-       depends on BR2_PACKAGE_LIBMICROHTTPD
-       depends on BR2_USE_WCHAR
-       select BR2_PACKAGE_GNUTLS
-       select BR2_PACKAGE_LIBGCRYPT
-       help
-         Enable HTTPS (SSL) support.
+	bool "https support"
+	depends on BR2_PACKAGE_LIBMICROHTTPD
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  Enable HTTPS (SSL) support.
 
 comment "libmicrohttpd needs a toolchain with thread support"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 697cbf5..066074a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -6,13 +6,16 @@
 
 LIBMICROHTTPD_VERSION = 0.9.27
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
+LIBMICROHTTPD_LICENSE_FILE = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
+LIBMICROHTTPD_LICENSE = LGPLv2.1+
 LIBMICROHTTPD_DEPENDENCIES += gnutls libgcrypt
 LIBMICROHTTPD_CONF_OPT += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
-			  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+						  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
+LIBMICROHTTPD_LICENSE = LGPLv2.1+ or eCos
 LIBMICROHTTPD_CONF_OPT += --disable-https
 endif
 
-- 
1.7.10.4
