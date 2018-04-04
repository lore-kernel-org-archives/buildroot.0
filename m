From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 21:40:47 +0200
Subject: [Buildroot] [git commit] package/libupnp18: add optional dependency
 to openssl/libressl
Message-ID: <20180404194049.61C1A83EA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3130ceef1c195bd60e414819743529484736a135
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libupnp18/libupnp18.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index a75558e92b..07ef4382f0 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -12,4 +12,12 @@ LIBUPNP18_INSTALL_STAGING = YES
 LIBUPNP18_LICENSE = BSD-3-Clause
 LIBUPNP18_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBUPNP18_CONF_OPTS += --enable-open-ssl
+LIBUPNP18_DEPENDENCIES += host-pkgconf openssl
+LIBUPNP18_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
+else
+LIBUPNP18_CONF_OPTS += --disable-open-ssl
+endif
+
 $(eval $(autotools-package))
