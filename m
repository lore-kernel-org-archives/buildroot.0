From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Dec 2013 15:51:24 +0100
Subject: [Buildroot] [git commit] cairo: Patch to fix OpenVG backend on
	X11-less platforms
Message-ID: <20131220145309.7594E9C13A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fce881c3850a3ebd2782e4851728005b4259cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Submitted upstream: https://bugs.freedesktop.org/show_bug.cgi?id=72911

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/cairo-002-openvg-build-fix.patch |   28 ++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/cairo/cairo-002-openvg-build-fix.patch b/package/cairo/cairo-002-openvg-build-fix.patch
new file mode 100644
index 0000000..6614934
--- /dev/null
+++ b/package/cairo/cairo-002-openvg-build-fix.patch
@@ -0,0 +1,28 @@
+Fix build of OpenVG backend on platforms without X11
+
+https://bugs.freedesktop.org/show_bug.cgi?id=72911
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+
+Index: b/boilerplate/cairo-boilerplate-vg.c
+===================================================================
+--- a/boilerplate/cairo-boilerplate-vg.c
++++ b/boilerplate/cairo-boilerplate-vg.c
+@@ -215,7 +215,7 @@ _cairo_boilerplate_vg_create_surface_egl (const char		    *name,
+ 	EGL_ALPHA_SIZE, 8,
+ 	EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
+ 	EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
+-	None
++	EGL_NONE
+     };
+     int rgb_attribs[] = {
+ 	EGL_RED_SIZE, 8,
+@@ -225,7 +225,7 @@ _cairo_boilerplate_vg_create_surface_egl (const char		    *name,
+ 	EGL_VG_ALPHA_FORMAT, EGL_VG_ALPHA_FORMAT_PRE_BIT,
+ 	EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
+ 	EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
+-	None
++	EGL_NONE
+     };
+     int dummy_attribs[] = {
+ 	EGL_WIDTH, 8, EGL_HEIGHT, 8,
