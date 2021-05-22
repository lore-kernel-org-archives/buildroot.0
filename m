From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 19:41:56 +0200
Subject: [Buildroot] [PATCH 1/4] package/python-pillow: add lcms2 support
Message-ID: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lcms2 is an optional dependency since version 2.3.0 and
https://github.com/python-pillow/Pillow/commit/6d9f34914021951bba42ffe5b6cd80147e7f538f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.2
