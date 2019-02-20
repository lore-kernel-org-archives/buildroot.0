From: Trent Piepho <tpiepho@impinj.com>
Date: Wed, 20 Feb 2019 01:40:06 +0000
Subject: [Buildroot] [PATCH] libcurl: fix typo in configure option w/o
 OpenSSL
Message-ID: <20190220013958.24225-1-tpiepho@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When not using OpenSSL, the correct option to configure is --without-ssl
with two dashes.

Fixes: b8b78e7e6a ("libcurl: Allow selection of TLS package libcurl will use")

Signed-off-by: Trent Piepho <tpiepho@impinj.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1fae41ea3a..509dbdb54e 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -46,7 +46,7 @@ LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)
 LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else
-LIBCURL_CONF_OPTS += -without-ssl
+LIBCURL_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
-- 
2.14.4
