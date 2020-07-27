From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 09:03:53 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: add fsmount support
Message-ID: <20200727065912.6591086D0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb6d52a5e599bdeaa73af000c10a798278332ffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/libwebsockets.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index a3fc12bcd4..8e6d02205a 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -11,7 +11,6 @@ LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = \
-	-DLWS_WITH_FSMOUNT=OFF \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
 	-DLWS_UNIX_SOCK=ON \
@@ -56,6 +55,13 @@ else
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
