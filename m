From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Apr 2014 10:59:06 -0300
Subject: [Buildroot] [PATCH] libcurl: drop polarssl support
Message-ID: <1397570346-25849-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of curl 7.36.0 it doesn't support polarssl < 1.3 any longer. Fixes:
http://autobuild.buildroot.net/results/d82/d82c3618e9dde3da7e36ba2b58545a9a8de5e442/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ab558fb..2907303 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -36,9 +36,6 @@ LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCURL_CONF_OPT += --with-gnutls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_POLARSSL),y)
-LIBCURL_CONF_OPT += --with-polarssl=$(STAGING_DIR)/usr
-LIBCURL_DEPENDENCIES += polarssl
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
 LIBCURL_CONF_OPT += --with-nss=$(STAGING_DIR)/usr
 LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
-- 
1.8.3.2
