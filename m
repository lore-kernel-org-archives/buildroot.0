From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Jun 2021 21:22:35 +0200
Subject: [Buildroot] [PATCH 2/4] package/mpv: Add optional support for
 OpenGLES
In-Reply-To: <20210618192237.808519-1-bernd.kuhls@t-online.de>
References: <20210618192237.808519-1-bernd.kuhls@t-online.de>
Message-ID: <20210618192237.808519-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpv also supports OpenGLES:
https://github.com/mpv-player/mpv/blob/master/video/out/opengl/egl_helpers.c#L98

Runtime-tested using mesa3d iris driver on a non-x11 system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/mpv.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 30f377054f..877b84f63a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -140,6 +140,9 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 MPV_CONF_OPTS += --enable-gl
 MPV_DEPENDENCIES += libgl
+else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+MPV_CONF_OPTS += --enable-gl
+MPV_DEPENDENCIES += libgles
 else
 MPV_CONF_OPTS += --disable-gl
 endif
-- 
2.30.2
