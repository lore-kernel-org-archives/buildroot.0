From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:29:01 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/fltk: add
 optional xlib_libXrender dependency
Message-ID: <20190327142641.2644082502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d56572e447fb84730cad43dd50684b6f85a2bd72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

xlib_libXrender is enabled by default and has been added since version
1.3.4-1 and
https://github.com/fltk/fltk/commit/a6c4b29a184ce7708819f4706877eedcd99a30f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 65895f36eea0139c3d590cd5982be5504b2de9ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fltk/fltk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 611d79da50..c37a13176c 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -54,4 +54,11 @@ else
 FLTK_CONF_OPTS += --disable-xinerama
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+FLTK_DEPENDENCIES += xlib_libXrender
+FLTK_CONF_OPTS += --enable-xrender
+else
+FLTK_CONF_OPTS += --disable-xrender
+endif
+
 $(eval $(autotools-package))
