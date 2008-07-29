From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 29 Jul 2008 08:46:45 +0200
Subject: [Buildroot] [PATCH v2 2/5] SDL_net: add new package SDL_net
In-Reply-To: <1217314008-22850-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1217314008-22850-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1217314008-22850-2-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package SDL_net. SDL_net is a small, low-level,
cross-platform network library, that can be used with the Simple DirectMedia
Layer library (SDL).

http://www.libsdl.org/projects/SDL_net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/Config.in          |    1 +
 package/sdl_net/Config.in  |    8 ++++++++
 package/sdl_net/sdl_net.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 package/sdl_net/Config.in
 create mode 100644 package/sdl_net/sdl_net.mk

diff --git a/package/Config.in b/package/Config.in
index 2941033..e07d9e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -349,6 +349,7 @@ source "package/libungif/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"
+source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"
 
diff --git a/package/sdl_net/Config.in b/package/sdl_net/Config.in
new file mode 100644
index 0000000..2001d23
--- /dev/null
+++ b/package/sdl_net/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SDL_NET
+	bool "SDL_net"
+	depends on BR2_PACKAGE_SDL
+	help
+	  SDL_net is a small, low-level, cross-platform network library, that
+	  can be used with the Simple DirectMedia Layer library (SDL).
+
+	  http://www.libsdl.org/projects/SDL_net/
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
new file mode 100644
index 0000000..144d02d
--- /dev/null
+++ b/package/sdl_net/sdl_net.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# SDL_net: network addon for SDL
+#
+#############################################################
+SDL_NET_VERSION:=1.2.7
+SDL_NET_SITE:=http://www.libsdl.org/projects/SDL_net/release
+
+SDL_NET_CONF_OPT = --localstatedir=/var \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
+
+SDL_NET_INSTALL_STAGING = YES
+SDL_NET_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+
+SDL_NET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+SDL_NET_DEPENDENCIES = sdl
+
+$(eval $(call AUTOTARGETS,package,SDL_net))
-- 
1.5.4.3
