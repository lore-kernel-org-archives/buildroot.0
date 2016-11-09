From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed,  9 Nov 2016 10:36:29 +0100
Subject: [Buildroot] [PATCH] screen: enable support for 256 colors
Message-ID: <20161109093629.5618-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for 256 colors is enabled in xterm and ncurses, but it was
forgotten for screen.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/screen/screen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 84c3d75..16a97cc 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -11,6 +11,7 @@ SCREEN_LICENSE_FILES = COPYING
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
 SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
+SCREEN_CONF_OPTS = --enable-colors256
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 define SCREEN_INSTALL_SCREENRC
-- 
2.9.3
