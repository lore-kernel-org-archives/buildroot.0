From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:33:00 +0200
Subject: [Buildroot] [git commit] package/mpv: add optional support for
 OpenGLES
Message-ID: <20210718205920.AA1098830C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=df19d7d173682be136c0875b8430251aeeb17596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpv also supports OpenGLES:
https://github.com/mpv-player/mpv/blob/master/video/out/opengl/egl_helpers.c#L98

Runtime-tested using mesa3d iris driver on a non-x11 system.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
