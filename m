From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Dec 2019 20:28:01 +0100
Subject: [Buildroot] [PATCH 3/3] package/pipewire: add xlib_libX11 optional
 dependency
In-Reply-To: <20191219192801.1264354-1-fontaine.fabrice@gmail.com>
References: <20191219192801.1264354-1-fontaine.fabrice@gmail.com>
Message-ID: <20191219192801.1264354-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xlib_libX11 is an optional dependeny of spa, see:
https://github.com/PipeWire/pipewire/blob/0.2.7/spa/meson.build

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.0
