From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Jun 2012 02:23:44 +0200
Subject: [Buildroot] [git commit] gnutls: disable libgcrypt prefix mangling
Message-ID: <20120606002436.4419696E7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27930b0c219300ce5f32ac676245306481e776cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/77a0ca1d28a68daf25c2588eede86f779c772f97

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d8ca16b..eb15966 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION = 2.12.19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
-GNUTLS_CONF_OPT = --with-libgcrypt \
+GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
 		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
 
