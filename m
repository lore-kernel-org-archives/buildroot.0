From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 11 Dec 2018 23:17:05 +0100
Subject: [Buildroot] [git commit] package/netsurf: add dependency on
 host-libpng for sdl
Message-ID: <20181211221547.3BAA9865AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42c8f9f6b46e196a7c337c683a7df5ae6bd421b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpng is used by the convert_image host tool, which is built when SDL
is enabled.

Fixes:
http://autobuild.buildroot.net/results/d0b/d0bbd563fe5c9463316b2ba0d7ef5553be0563bc/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netsurf/netsurf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 162ac5d795..3339b35c91 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -25,7 +25,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_NETSURF_SDL),y)
-NETSURF_DEPENDENCIES += sdl
+NETSURF_DEPENDENCIES += sdl host-libpng
 NETSURF_FRONTEND = framebuffer
 endif
 
