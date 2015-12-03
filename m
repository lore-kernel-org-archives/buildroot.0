From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:37:57 +0100
Subject: [Buildroot] [git commit] wireshark: add optional gnutls support
Message-ID: <20151203214016.0ED1A81D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=796ab5f36e3f66e83c17c373820f83b4abfe4e45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index cc9fb41..0bc7801 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -22,7 +22,6 @@ WIRESHARK_CONF_OPTS = \
 	--without-krb5 \
 	--disable-usr-local \
 	--enable-static=no \
-	--with-gnutls=no \
 	--with-libsmi=no \
 	--with-lua=no \
 	--includedir=$(STAGING_DIR)/usr/include
@@ -63,6 +62,13 @@ else
 WIREHARK_CONF_OPTS += --without-c-ares
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+WIRESHARK_CONF_OPTS += --with-gnutls=yes
+WIRESHARK_DEPENDENCIES += gnutls
+else
+WIRESHARK_CONF_OPTS += --with-gnutls=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 WIRESHARK_CONF_OPTS += --with-gcrypt=yes
