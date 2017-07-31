From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:02 -0400
Subject: [Buildroot] [PATCH v2 02/14] libwebsockets: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed host-openssl to host-libressl.

 package/libwebsockets/libwebsockets.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index b29a2f14c..1e6d33376 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -24,6 +24,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBWEBSOCKETS_DEPENDENCIES += libressl host-libressl
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
 else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
 endif
-- 
2.13.3
