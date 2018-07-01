From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:41:10 +0200
Subject: [Buildroot] [git commit] libwebsockets: add optional libevent
 dependency
Message-ID: <20180701123755.5DB4383749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e46257264ed773a9c2b94e0e4f0131187a8940ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevent is supported since 2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
