From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Oct 2012 19:20:15 -0300
Subject: [Buildroot] [PATCHv2] gnutls: fix link-time build failures
Message-ID: <1351117215-4614-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/build-end.log
And may the <BEEP> rest in peace at last...

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index e889821..1ef6e3f 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -10,8 +10,9 @@ GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING lib/COPYING
 GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
+GNUTLS_CONF_ENV = acl_cv_rpath=no
 GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
-		--without-p11-kit
+		--without-p11-kit --disable-rpath
 GNUTLS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.7.8.6
