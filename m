From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jun 2018 15:54:34 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add optional libevent
 dependency
Message-ID: <20180610135434.27878-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libevent is supported since 2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 28fd183393..81e398bedd 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -35,6 +35,13 @@ else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEV=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBWEBSOCKETS_DEPENDENCIES += libevent
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=ON
+else
+LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBEVENT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUV),y)
 LIBWEBSOCKETS_DEPENDENCIES += libuv
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBUV=ON
-- 
2.14.1
