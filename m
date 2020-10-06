From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:28:18 +0200
Subject: [Buildroot] [git commit] package/efl: bump to version 1.25.0
Message-ID: <20201006191745.1764E8E201@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf57eceabcca134197fed79c043587439b3d4e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0001-doc-meson.build-add-single-quote-for-env.patch superseeded
by https://git.enlightenment.org/core/efl.git/commit/?id=e2a1cdfda76dd0061ef8e0ab25aee4e042304366

Rename luajit bindings to lua after upstream rework to support lua interpreter
(non-luajit):

https://git.enlightenment.org/core/efl.git/commit/?id=5197200ac1d49366f205a62a09a377fdece62ff9
https://git.enlightenment.org/core/efl.git/commit/?id=b0203b3160f2a39c3afe549fd34a513f71532fc3
https://git.enlightenment.org/core/efl.git/commit/?id=f78d54051c26a8d3c9b3bfc61e44df09bf24e401
https://git.enlightenment.org/core/efl.git/commit/?id=6dce869a17baae6002c3cec04e975c0730461a00

For now keep the luajit dependency as is. lua support can be enabled by a followup patch.

Disable the new avif evas loader and saver added by:
https://git.enlightenment.org/core/efl.git/commit/?id=fd24e89144d8808e4e7ee20efe599ff4a6d3d37e

Remove elogind meson option removed by:
https://git.enlightenment.org/core/efl.git/commit/?id=fe56edae3f5015c62e319d5e2ab2552d3533eead

See:
https://www.enlightenment.org/news/efl-1.25.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-doc-meson.build-add-single-quote-for-env.patch | 33 ----------------------
 ...ngines-drm-meson.build-use-gl_deps-as-en.patch} |  6 ++--
 ...ngines-drm-meson.build-fix-gl_drm-includ.patch} |  6 ++--
 package/efl/efl.hash                               |  4 +--
 package/efl/efl.mk                                 | 11 ++++----
 5 files changed, 13 insertions(+), 47 deletions(-)

diff --git a/package/efl/0001-doc-meson.build-add-single-quote-for-env.patch b/package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
deleted file mode 100644
index e4064478c8..0000000000
--- a/package/efl/0001-doc-meson.build-add-single-quote-for-env.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bc7992c483a5a188b893a0f0a23d9205274a4485 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 1 Aug 2020 01:38:24 +0200
-Subject: [PATCH] doc/meson.build: add single quote for env
-
-Meson trigger an error due to missing sigle quote for env:
-
-efl-1.24.3/doc/meson.build:114:2: ERROR: Unknown variable "env"
-
-Upstream status:
-https://sourceforge.net/p/enlightenment/mailman/message/37075003/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- doc/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/meson.build b/doc/meson.build
-index 5ad389828c..11e2b6446b 100644
---- a/doc/meson.build
-+++ b/doc/meson.build
-@@ -113,7 +113,7 @@ foreach text_filter_property : text_filter_properties
- 
-   doc_target += custom_target('preview_text_filters_'+name,
-                   command: [
--                    env, 'EFL_RUN_IN_TREE=1',
-+                    'env', 'EFL_RUN_IN_TREE=1',
-                     'EFL_EVAS_FILTER_LUA_PREFIX=' + join_paths(meson.source_root(), 'src', 'lib', 'evas'),
-                     preview_text_filter.full_path(), text, filter_code.stdout(), '@OUTPUT@', font, size
-                   ],
--- 
-2.25.4
-
diff --git a/package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch b/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
similarity index 87%
rename from package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
rename to package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
index 85affe940f..185926ac46 100644
--- a/package/efl/0002-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
+++ b/package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch
@@ -1,4 +1,4 @@
-From f6b8b53fdd1cb63219f61e783479bf8d221649b3 Mon Sep 17 00:00:00 2001
+From 51dfe1863ddc8c5dd576405a9bbb8bca875c1142 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 1 Aug 2020 02:25:47 +0200
 Subject: [PATCH] ecore_evas/engines/drm/meson.build: use "gl_deps" as engine
@@ -19,10 +19,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
-index 584cc56159..de645f1093 100644
+index 58071010d0..0741d7fccd 100644
 --- a/src/modules/ecore_evas/engines/drm/meson.build
 +++ b/src/modules/ecore_evas/engines/drm/meson.build
-@@ -7,7 +7,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
+@@ -3,7 +3,7 @@ engine_deps = [ecore_drm2, ecore_input, eeze, elput, libdrm, engine_drm]
  
  if get_option('opengl') != 'none'
    config_h.set('BUILD_ECORE_EVAS_GL_DRM', '1')
diff --git a/package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch b/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
similarity index 89%
rename from package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
rename to package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
index b9a416a754..89ec838a72 100644
--- a/package/efl/0003-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
+++ b/package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch
@@ -1,4 +1,4 @@
-From 83c62fd6b53bd5d3f46c59362ef4fdac9090fd8d Mon Sep 17 00:00:00 2001
+From 8548b02c487ba7e9d78489c6db58812ee5cfb197 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 1 Aug 2020 01:01:00 +0200
 Subject: [PATCH] ecore_evas/engines/drm/meson.build: fix "gl_drm" include
@@ -20,10 +20,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/modules/ecore_evas/engines/drm/meson.build b/src/modules/ecore_evas/engines/drm/meson.build
-index de645f1093..205468750a 100644
+index 0741d7fccd..edda1abd71 100644
 --- a/src/modules/ecore_evas/engines/drm/meson.build
 +++ b/src/modules/ecore_evas/engines/drm/meson.build
-@@ -10,7 +10,7 @@ if get_option('opengl') != 'none'
+@@ -6,7 +6,7 @@ if get_option('opengl') != 'none'
    engine_deps += [gl_deps]
  endif
  
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 9f1c0b6dcb..11e69633b9 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.24.3.tar.xz.sha256sum
-sha256  de95c6e673c170c1e21382918b122417c091c643e7dcaced89aa785529625c2a  efl-1.24.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.25.0.tar.xz.sha256sum
+sha256  53941f910daf5d1b5162bfdb0dc66f1a04e55a0f2dd7760da0ad63713370956e  efl-1.25.0.tar.xz
 
 sha256  d666b6b2df9f5b791f85c299c65516cb55528b02a807603de246f65f4918ae22  COMPLIANCE
 sha256  5bceb52d65debe420bc520f2992807740dc928b7fdc3c2e9a74b5889177ddf4c  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index f824f065ef..d77cb3092b 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.24.3
+EFL_VERSION = 1.25.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
@@ -52,7 +52,7 @@ else
 EFL_CONF_OPTS += -Dnls=false
 endif
 
-EFL_BINDINGS = luajit
+EFL_BINDINGS = lua
 
 ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
 EFL_BINDINGS += cxx
@@ -209,7 +209,7 @@ EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
-EFL_EVAS_LOADERS_DISABLER = gst json ps
+EFL_EVAS_LOADERS_DISABLER = avif gst json ps
 
 # efl already depends on jpeg.
 ifeq ($(BR2_PACKAGE_EFL_JPEG),y)
@@ -317,7 +317,6 @@ HOST_EFL_CONF_OPTS += \
 	-Decore-imf-loaders-disabler=ibus,scim,xim \
 	-Dedje-sound-and-video=false \
 	-Deeze=false \
-	-Delogind=false \
 	-Delua=true \
 	-Dembedded-lz4=true \
 	-Dfontconfig=false \
@@ -341,12 +340,12 @@ HOST_EFL_CONF_OPTS += \
 	-Dxinput22=false
 
 # List of modular image/vector loaders to disable in efl
-HOST_EFL_EVAS_LOADERS_DISABLER = bmp dds eet generic gst ico json \
+HOST_EFL_EVAS_LOADERS_DISABLER = avif bmp dds eet generic gst ico json \
 	jp2k pdf pmaps ps psd raw rsvg tga tgv tiff wbmp webp xcf xpm
 
 HOST_EFL_CONF_OPTS += -Devas-loaders-disabler=$(subst $(space),$(comma),$(HOST_EFL_EVAS_LOADERS_DISABLER))
 
-HOST_EFL_BINDINGS = luajit
+HOST_EFL_BINDINGS = lua
 
 # Enable Eolian language bindings to provide eolian_cxx tool for the
 # host which is required to build Eolian language bindings for the
