From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 22 May 2017 15:13:06 +0200
Subject: [Buildroot] [PATCH 2/3] sdl2_net: new package
In-Reply-To: <20170522131307.27529-1-francois.perrad@gadz.org>
References: <20170522131307.27529-1-francois.perrad@gadz.org>
Message-ID: <20170522131307.27529-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/sdl2_net/Config.in     |  9 +++++++++
 package/sdl2_net/sdl2_net.hash |  2 ++
 package/sdl2_net/sdl2_net.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/sdl2_net/Config.in
 create mode 100644 package/sdl2_net/sdl2_net.hash
 create mode 100644 package/sdl2_net/sdl2_net.mk

diff --git a/package/Config.in b/package/Config.in
index 3eb05651c2..5fa21afc60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -282,6 +282,7 @@ comment "Graphic libraries"
 	source "package/sdl2_gfx/Config.in"
 	source "package/sdl2_image/Config.in"
 	source "package/sdl2_mixer/Config.in"
+	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
 
 comment "Other GUIs"
diff --git a/package/sdl2_net/Config.in b/package/sdl2_net/Config.in
new file mode 100644
index 0000000000..d5e749f5ac
--- /dev/null
+++ b/package/sdl2_net/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SDL2_NET
+	bool "sdl2_net"
+	depends on BR2_PACKAGE_SDL2
+	help
+	  This is a small sample cross-platform networking library,
+	  with a sample chat client and server application. The chat
+	  client uses the GUIlib GUI framework library.
+
+	  http://www.libsdl.org/projects/SDL_net/
diff --git a/package/sdl2_net/sdl2_net.hash b/package/sdl2_net/sdl2_net.hash
new file mode 100644
index 0000000000..c5f4433837
--- /dev/null
+++ b/package/sdl2_net/sdl2_net.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21  SDL2_net-2.0.1.tar.gz
diff --git a/package/sdl2_net/sdl2_net.mk b/package/sdl2_net/sdl2_net.mk
new file mode 100644
index 0000000000..2fa4a8c2e0
--- /dev/null
+++ b/package/sdl2_net/sdl2_net.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# sdl2_net
+#
+################################################################################
+
+SDL2_NET_VERSION = 2.0.1
+SDL2_NET_SOURCE = SDL2_net-$(SDL2_NET_VERSION).tar.gz
+SDL2_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
+SDL2_NET_LICENSE = Zlib
+SDL2_NET_LICENSE_FILES = COPYING.txt
+SDL2_NET_INSTALL_STAGING = YES
+SDL2_NET_DEPENDENCIES = sdl2
+
+$(eval $(autotools-package))
-- 
2.11.0
