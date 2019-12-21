From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:10:27 +0100
Subject: [Buildroot] [git commit] package/pipewire: add xlib_libX11 optional
 dependency
Message-ID: <20191221220507.94A518D3EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61cfc867aee3b6b058e3dcd9ebf35fd5a32f5cc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libX11 is an optional dependeny of spa, see:
https://github.com/PipeWire/pipewire/blob/0.2.7/spa/meson.build

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index aa3fdc489d..df159c5ef4 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -27,6 +27,10 @@ ifeq ($(BR2_PACKAGE_SDL2),y)
 PIPEWIRE_DEPENDENCIES += sdl2
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+PIPEWIRE_DEPENDENCIES += xlib_libX11
+endif
+
 ifeq ($(BR2_PACKAGE_PIPEWIRE_GSTREAMER),y)
 PIPEWIRE_CONF_OPTS += -Dgstreamer=enabled
 PIPEWIRE_DEPENDENCIES += libglib2 gstreamer1 gst1-plugins-base
