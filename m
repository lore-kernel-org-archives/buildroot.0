From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:39:58 +0200
Subject: [Buildroot] [git commit] feh: add optional libexif dependency
Message-ID: <20180916134004.9FCBF882AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e020546981e845cf43fb6f71f66758feca0db9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
