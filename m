From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 21:52:52 +0200
Subject: [Buildroot] [PATCH 1/1] feh: add optional libexif dependency
Message-ID: <20180915195252.22004-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/feh/feh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index ff611924d9..3bfd427e79 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -18,6 +18,13 @@ else
 FEH_MAKE_OPTS += curl=0
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+FEH_DEPENDENCIES += libexif
+FEH_MAKE_OPTS += exif=1
+else
+FEH_MAKE_OPTS += exif=0
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 FEH_DEPENDENCIES += xlib_libXinerama
 FEH_MAKE_OPTS += xinerama=1
-- 
2.17.1
