From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 19:29:00 -0700
Subject: [Buildroot] [PATCH 4/5] package/libwebsockets: add libglib2 support
In-Reply-To: <20200726022901.295552-1-aduskett@gmail.com>
References: <20200726022901.295552-1-aduskett@gmail.com>
Message-ID: <20200726022901.295552-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 6c2667b867..3fbbb5d554 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -48,6 +48,13 @@ LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_LIBEVENT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+LIBWEBSOCKETS_DEPENDENCIES += libglib2
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_GLIB=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_GLIB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUV),y)
 LIBWEBSOCKETS_DEPENDENCIES += libuv
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBUV=ON
-- 
2.26.2
