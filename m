From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 19:29:01 -0700
Subject: [Buildroot] [PATCH 5/5] package/libwebsockets: add fsmount support
In-Reply-To: <20200726022901.295552-1-aduskett@gmail.com>
References: <20200726022901.295552-1-aduskett@gmail.com>
Message-ID: <20200726022901.295552-6-aduskett@gmail.com>
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
index 3fbbb5d554..8e6d02205a 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -55,6 +55,13 @@ else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_GLIB=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
+LIBWEBSOCKETS_DEPENDENCIES += util-linux
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_FSMOUNT=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_FSMOUNT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUV),y)
 LIBWEBSOCKETS_DEPENDENCIES += libuv
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBUV=ON
-- 
2.26.2
