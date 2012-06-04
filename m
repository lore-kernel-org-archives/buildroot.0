From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Jun 2012 16:14:43 +0200
Subject: [Buildroot] [git commit] gnutls: add optional zlib support
Message-ID: <20120604183404.99F1196E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bc0d5be844f41cf58120ffc3d306eeae8868cc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 45323f2..d8ca16b 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -7,7 +7,7 @@
 GNUTLS_VERSION = 2.12.19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
-GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt
+GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
 GNUTLS_CONF_OPT = --with-libgcrypt \
 		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
