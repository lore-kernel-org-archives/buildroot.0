From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:03 +0100
Subject: [Buildroot] [PATCH 02/52] package/libpjsip: drop path to staging to
	find libsrtp
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <6e1d6ebdd990ad2d9921f85b622103d7310120da.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it happens, specifying the path where to look for libsrtp is not
needed: pjsip does not use the argument to --with-external-srtp as a
search path at all; it only checks whether it is 'no' or something
else.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/libpjsip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 7d30bbb..551dbd9 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -53,7 +53,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ipp \
 	--disable-ssl \
 	--disable-silk \
-	--with-external-srtp=$(STAGING_DIR)/usr
+	--with-external-srtp
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBPJSIP_DEPENDENCIES += openssl
-- 
2.7.4
