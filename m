From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 27 Oct 2012 23:19:58 +0200
Subject: [Buildroot] [git commit] gnutls: fix link-time build failures
Message-ID: <20121027212117.6A26A99962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=092457dd3bc598f0920bddf79a62a39b2f13c4cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/build-end.log
And may the <BEEP> rest in peace at last...

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
