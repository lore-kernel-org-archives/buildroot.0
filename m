From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sun, 18 Nov 2018 23:49:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: Use proper USE_WOFF2
 flag instead of ENABLE_WOFF2
Message-ID: <20181118224943.9686-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/webkitgtk/webkitgtk.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 54a791cd14..16644f0e93 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -22,10 +22,10 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_INTROSPECTION=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
-	-DENABLE_WOFF2=ON \
 	-DPORT=GTK \
 	-DUSE_LIBNOTIFY=OFF \
-	-DUSE_LIBHYPHEN=OFF
+	-DUSE_LIBHYPHEN=OFF \
+	-DUSE_WOFF2=ON
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
-- 
2.19.1
