From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:52:48 +0200
Subject: [Buildroot] [git commit] package/rtty: remove unnecessary cmake
 options
Message-ID: <20200329194403.3ACD689051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f169e6bc3812d7f9160449d7724711e4df7e39e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/rtty.mk | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 88599f6636..5d1ef4a091 100644
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
 RTTY_DEPENDENCIES += host-pkgconf openssl
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
