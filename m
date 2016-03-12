From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 23:55:28 +0100
Subject: [Buildroot] [git commit] screen: re-eneable parallel builds
Message-ID: <20160312225532.CBC5D817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8278a1f2779ebc109737a47056a016a25b58020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They don't seem to be causing any issues after many bumps and tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
