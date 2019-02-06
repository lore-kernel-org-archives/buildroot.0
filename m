From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:46 +0100
Subject: [Buildroot] [PATCH 04/16] package/sdl: remove qtopia video driver
 option
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qtopia option uses the obsolete qt4 package, which we are about to
remove, to remove the qtopia option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy      | 6 ++++++
 package/sdl/Config.in | 4 ----
 package/sdl/sdl.mk    | 5 -----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5a330cada9..0eb69361cc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_SDL_QTOPIA
+	bool "sdl qtopia video driver option removed"
+	select BR2_LEGACY
+	help
+	  The SDL QTopia video driver option was removed.
+
 config BR2_PACKAGE_PYTHON_PYQT
 	bool "python-pyqt package removed"
 	select BR2_LEGACY
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 65ac8a2469..9f1e34de5c 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -17,10 +17,6 @@ config BR2_PACKAGE_SDL_DIRECTFB
 	bool "SDL DirectFB video driver"
 	depends on BR2_PACKAGE_DIRECTFB
 
-config BR2_PACKAGE_SDL_QTOPIA
-	bool "SDL Qtopia video driver"
-	depends on BR2_PACKAGE_QT
-
 config BR2_PACKAGE_SDL_X11
 	bool "SDL X11 video driver"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 0a6a7de139..d8b3733e4a 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -37,12 +37,7 @@ else
 SDL_CONF_OPTS += --enable-video-directfb=no
 endif
 
-ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
-SDL_CONF_OPTS += --enable-video-qtopia=yes
-SDL_DEPENDENCIES += qt
-else
 SDL_CONF_OPTS += --enable-video-qtopia=no
-endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_CONF_OPTS += --enable-video-x11=yes
-- 
2.11.0
