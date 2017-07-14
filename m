From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:28 -0400
Subject: [Buildroot] [PATCH 06/15] apr-uti: support libressl
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/apr-util/apr-util.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index bc0572e11..71886c00f 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -49,6 +49,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
 APR_UTIL_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+APR_UTIL_DEPENDENCIES += libressl
+APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
 else
 APR_UTIL_CONF_OPTS += --without-crypto
 endif
-- 
2.13.0
