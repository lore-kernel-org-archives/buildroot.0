From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:18:16 -0000
Subject: [Buildroot] [git commit] package/gobject-introspection: bump to
 version 1.68.0
Message-ID: <20210607144656.1210D814AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abc110e3624aa4e8a9bd8595b3fdc0aec60845e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Change -Dgi_cross_use_host_gi=true to -Dgi_cross_use_prebuilt_gi=true as the
    option has changed.
  - Explicitly define python3 in both the host and target builds of
    g-ir-tool-template.in

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - add hash for giscanner/scannerlexer.l used as license file
  - two spaces in hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/0001-disable-tests.patch       |  2 +-
 .../0002-Add-rpath-links-to-ccompiler.patch                  |  2 +-
 package/gobject-introspection/gobject-introspection.hash     |  9 +++++----
 package/gobject-introspection/gobject-introspection.mk       | 12 ++++++------
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index c75c7512d9..01b11998bd 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
 index eed4d6b..5058664 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -214,12 +214,6 @@ if get_option('build_introspection_data') == true
+@@ -222,12 +222,6 @@ if get_option('build_introspection_data') == true
  endif
  subdir('docs')
  
diff --git a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
index 08835d3ecc..9b9ae99779 100644
--- a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
+++ b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
@@ -15,7 +15,7 @@ diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
 index a8bd5b1..51bb9bc 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
-@@ -229,6 +229,8 @@ class CCompiler(object):
+@@ -231,6 +231,8 @@ class CCompiler(object):
  
          for envvar in runtime_path_envvar:
              if envvar in os.environ:
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 68bf63e055..e859ba1d3b 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,4 +1,5 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.64/gobject-introspection-1.64.1.sha256sum
-sha256 80beae6728c134521926affff9b2e97125749b38d38744dc901f4010ee3e7fa7 gobject-introspection-1.64.1.tar.xz
-sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING.LGPL
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING.GPL
+#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.68/gobject-introspection-1.68.0.sha256sum
+sha256  d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27  gobject-introspection-1.68.0.tar.xz
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING.LGPL
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
+sha256  ad35e98ae9342a3539c36f2171e84d175394ddcff625887290c751302cb02983  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index eefb2c83f7..d8138b2e96 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.64
-GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.68
+GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
@@ -43,7 +43,7 @@ HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
 # Use the host gi-scanner to prevent the scanner from generating incorrect
 # elf classes.
 GOBJECT_INTROSPECTION_CONF_OPTS = \
-	-Dgi_cross_use_host_gi=true \
+	-Dgi_cross_use_prebuilt_gi=true \
 	-Dgi_cross_binary_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper" \
 	-Dgi_cross_ldd_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
 	-Dbuild_introspection_data=true \
@@ -64,8 +64,8 @@ HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
 	GI_SCANNER_DISABLE_CACHE=1
 
 # Make sure g-ir-tool-template uses the host python.
-define GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
-	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python%' $(@D)/tools/g-ir-tool-template.in
+define GOBJECT_INTROSPECTION_FIX_TOOLS_PYTHON_PATH
+	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python3%' $(@D)/tools/g-ir-tool-template.in
 endef
 HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
 
@@ -75,7 +75,7 @@ HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOL
 # - Create a safe modules directory which does not exist so we don't load random things
 #   which may then get deleted (or their dependencies) and potentially segfault
 define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
-	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python%' $(@D)/tools/g-ir-tool-template.in
+	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python3%' $(@D)/tools/g-ir-tool-template.in
 
 	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
 		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
