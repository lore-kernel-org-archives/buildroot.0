From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:24 -0400
Subject: [Buildroot] [PATCH 02/15] libwebsockets: support libressl
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index b29a2f14c..b6a1db779 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -24,6 +24,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBWEBSOCKETS_DEPENDENCIES += libressl host-openssl
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
 else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
 endif
-- 
2.13.0
