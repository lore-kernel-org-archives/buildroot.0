From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 23:00:35 +0200
Subject: [Buildroot] [git commit] gnutls: enable cryptodev-linux support
Message-ID: <20130505210148.10AED99B61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c15ed2daccbc02a7f677e5a70b0c307670b8bcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately because of header file differencies this can't be used for
OCF.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 21ace1c..610a5a2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -24,6 +24,11 @@ GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(
 GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
 GNUTLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBIDN),libidn)
 
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+	GNUTLS_CONF_OPT += --enable-cryptodev
+	GNUTLS_DEPENDENCIES += cryptodev-linux
+endif
+
 # Some examples in doc/examples use wchar
 define GNUTLS_DISABLE_DOCS
 	$(SED) 's/ doc / /' $(@D)/Makefile.in
