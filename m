From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 15:07:26 -0300
Subject: [Buildroot] [PATCH] screen: re-eneable parallel builds
Message-ID: <1457719646-28009-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They don't seem to be causing any issues after many bumps and tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/screen/screen.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 45689d3..0316e3d 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -11,7 +11,6 @@ SCREEN_LICENSE_FILES = COPYING
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
 SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
-SCREEN_MAKE = $(MAKE1)
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 define SCREEN_INSTALL_SCREENRC
-- 
2.4.10
