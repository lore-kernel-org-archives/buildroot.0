From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 12 Jul 2016 08:53:05 -0600
Subject: [Buildroot] [PATCH 3/3] sdl2_ttf: new package
In-Reply-To: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
References: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
Message-ID: <1468335185-19378-3-git-send-email-peter.macleod.thompson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sdl2_ttf created from sdl_ttf with some minor changes

Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
---
 package/Config.in              |  1 +
 package/sdl2_ttf/Config.in     |  9 +++++++++
 package/sdl2_ttf/sdl2_ttf.hash |  2 ++
 package/sdl2_ttf/sdl2_ttf.mk   | 20 ++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/sdl2_ttf/Config.in
 create mode 100644 package/sdl2_ttf/sdl2_ttf.hash
 create mode 100644 package/sdl2_ttf/sdl2_ttf.mk

diff --git a/package/Config.in b/package/Config.in
index b79c237..10617bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -265,6 +265,7 @@ comment "Graphic libraries"
 	source "package/sdl2/Config.in"
 	source "package/sdl2_gfx/Config.in"
 	source "package/sdl2_image/Config.in"
+	source "package/sdl2_ttf/Config.in"
 
 comment "Other GUIs"
 	source "package/qt/Config.in"
diff --git a/package/sdl2_ttf/Config.in b/package/sdl2_ttf/Config.in
new file mode 100644
index 0000000..cb77059
--- /dev/null
+++ b/package/sdl2_ttf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL2_TTF
+	bool "SDL2_TTF"
+	depends on BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_FREETYPE
+	help
+	  SDL2_ttf is a sample TrueType font library. It allows you to
+	  use TrueType fonts in your SDL2 applications.
+
+	  http://www.libsdl.org/projects/SDL_ttf/
diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
new file mode 100644
index 0000000..515189a
--- /dev/null
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276  SDL2_ttf-2.0.14.tar.gz
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
new file mode 100644
index 0000000..2428e9b
--- /dev/null
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# sdl2_ttf
+#
+################################################################################
+
+SDL2_TTF_VERSION = 2.0.14
+SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
+SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
+SDL2_TTF_LICENSE = zlib
+SDL2_TTF_LICENSE_FILES = COPYING
+
+SDL2_TTF_INSTALL_STAGING = YES
+SDL2_TTF_DEPENDENCIES = sdl2 freetype
+SDL2_TTF_CONF_OPTS = \
+	--without-x \
+	--with-freetype-prefix=$(STAGING_DIR)/usr \
+	--with-sdl2-prefix=$(STAGING_DIR)/usr
+
+$(eval $(autotools-package))
-- 
1.9.1
