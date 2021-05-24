From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 10:30:33 +0200
Subject: [Buildroot] [git commit] package/python-pillow: add lcms2 support
Message-ID: <20210524082154.0F6A1887FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e21579c13d1a0225e987eba172f3f0254a4eb3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lcms2 is an optional dependency since version 2.3.0 and
https://github.com/python-pillow/Pillow/commit/6d9f34914021951bba42ffe5b6cd80147e7f538f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/python-pillow.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index f71fa156e2..3018758b48 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -28,6 +28,13 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+PYTHON_PILLOW_DEPENDENCIES += lcms2
+PYTHON_PILLOW_BUILD_OPTS += --enable-lcms
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
 PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
