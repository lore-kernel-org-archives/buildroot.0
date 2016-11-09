From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:36:32 +0100
Subject: [Buildroot] [git commit branch/next] screen: enable support for 256
	colors
Message-ID: <20161109213652.76A8580401@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbfc24a3c04d9311d6f959dece7c42b059e256f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for 256 colors is enabled in xterm and ncurses, but it was
forgotten for screen.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
