From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 11 Dec 2018 16:02:09 +0100
Subject: [Buildroot] [PATCH] netsurf: fix build error
Message-ID: <20181211150209.26270-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add missing host dependency

see http://autobuild.buildroot.net/results/d0b/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/netsurf/netsurf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 162ac5d79..3339b35c9 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -25,7 +25,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
-NETSURF_DEPENDENCIES += sdl
+NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
 endif
 
-- 
2.17.1
