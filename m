From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:06 -0400
Subject: [Buildroot] [PATCH v2 06/14] apr-uti: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None.

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
2.13.3
