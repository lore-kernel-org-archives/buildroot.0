From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:11:55 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] libwebsockets: add
 optional libevent dependency
Message-ID: <20180719101153.4FD8088DFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=708b3d44195de42fc93f48ce7563e792e05ceb48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

libevent is supported since 2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e46257264ed773a9c2b94e0e4f0131187a8940ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
