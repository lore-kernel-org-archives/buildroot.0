From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 09:02:28 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: add libglib2 support
Message-ID: <20200727065912.57F9881F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ee1a4a5ab0390538da478b05fdc4717ed298f0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/libwebsockets.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 376321585b..a3fc12bcd4 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -12,7 +12,6 @@ LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = \
 	-DLWS_WITH_FSMOUNT=OFF \
-	-DLWS_WITH_GLIB=OFF \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
 	-DLWS_UNIX_SOCK=ON \
@@ -50,6 +49,13 @@ LIBWEBSOCKETS_CONF_OPTS += \
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
