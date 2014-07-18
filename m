From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:51:27 +0200
Subject: [Buildroot] [git commit] libcurl: bump to version 7.37.1
Message-ID: <20140718180154.AE9179D27D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57c303f624fcb2b2d1c4118239a7ab9532485a8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 00cff09..dd693cd 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.37.0
+LIBCURL_VERSION = 7.37.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -41,6 +41,7 @@ LIBCURL_CONF_OPT += --with-nss=$(STAGING_DIR)/usr
 LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
 LIBCURL_DEPENDENCIES += libnss
 else
+# polarssl support needs 1.3.x
 LIBCURL_CONF_OPT += --without-ssl --without-gnutls \
 	--without-polarssl --without-nss
 endif
