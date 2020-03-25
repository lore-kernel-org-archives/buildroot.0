From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Wed, 25 Mar 2020 15:27:02 +0800
Subject: [Buildroot] [PATCH 1/1] package/rtty: remove unnecessary cmake
 options
Message-ID: <20200325072702.28705-1-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/rtty/rtty.mk | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index bcd0fb3625..90b98f936c 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -12,25 +12,13 @@ RTTY_DEPENDENCIES = libev
 
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 RTTY_DEPENDENCIES += mbedtls
-RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=ON \
-	-DRTTY_USE_OPENSSL=OFF \
-	-DRTTY_USE_WOLFSSL=OFF
+RTTY_CONF_OPTS += -DRTTY_USE_MBEDTLS=ON
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 RTTY_DEPENDENCIES += openssl
-RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=OFF \
-	-DRTTY_USE_OPENSSL=ON \
-	-DRTTY_USE_WOLFSSL=OFF
+RTTY_CONF_OPTS += -DRTTY_USE_OPENSSL=ON
 else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 RTTY_DEPENDENCIES += wolfssl
-RTTY_CONF_OPTS += \
-	-DRTTY_SSL_SUPPORT=ON \
-	-DRTTY_USE_MBEDTLS=OFF \
-	-DRTTY_USE_OPENSSL=OFF \
-	-DRTTY_USE_WOLFSSL=ON
+RTTY_CONF_OPTS += -DRTTY_USE_WOLFSSL=ON
 else
 RTTY_CONF_OPTS += -DRTTY_SSL_SUPPORT=OFF
 endif
-- 
2.17.1
