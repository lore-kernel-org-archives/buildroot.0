From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 10:32:31 +0200
Subject: [Buildroot] [git commit] package/libmicrohttpd: minor fixes and
	additions
Message-ID: <20130627085021.C10DE9AF63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e6093b60ed7794b53e8e60ccba62c0345e6303a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Correcting the indentation inside Config.in. Also adding the missed
license information.

Note: libmicrohttpd is partialy dual licensed, if you don't need or want
to use the HTTPS option you can choose between LPGLv2.1+ and the eCos
license (http://ecos.sourceware.org/license-overview.html).
If you use the HTTPS option you have to agree to the LGPLv2.1+!

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
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
index 697cbf5..a383667 100644
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
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
+LIBMICROHTTPD_LICENSE = LGPLv2.1+ or eCos
 LIBMICROHTTPD_CONF_OPT += --disable-https
 endif
 
