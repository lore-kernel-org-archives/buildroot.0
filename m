From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 19:41:57 +0200
Subject: [Buildroot] [PATCH 2/4] package/python-pillow: add xcb support
In-Reply-To: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
References: <20210522174159.278657-1-fontaine.fabrice@gmail.com>
Message-ID: <20210522174159.278657-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libxcb is an optional dependency since version 7.1.0 and
https://github.com/python-pillow/Pillow/commit/3c39e6fcf6a11b18eec0d1c66710bcd35033d069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pillow/python-pillow.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 3018758b48..ab52f38df1 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -35,6 +35,13 @@ else
 PYTHON_PILLOW_BUILD_OPTS += --disable-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+PYTHON_PILLOW_DEPENDENCIES += libxcb
+PYTHON_PILLOW_BUILD_OPTS += --enable-xcb
+else
+PYTHON_PILLOW_BUILD_OPTS += --disable-xcb
+endif
+
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 PYTHON_PILLOW_DEPENDENCIES += openjpeg
 PYTHON_PILLOW_BUILD_OPTS += --enable-jpeg2000
-- 
2.30.2
