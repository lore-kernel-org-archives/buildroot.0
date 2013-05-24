From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 May 2013 00:13:06 +0200
Subject: [Buildroot] [git commit] weston: Add make dependency on cairo
Message-ID: <20130524221502.C180D9A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f2578d7b733301cfdd79af08d6b89f112c5ae66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's already a config dependency, make sure we build it too.

Signed-off-by: Will Newton <will.newton@linaro.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/weston/weston.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 4e7cada..b6827db 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,8 @@ WESTON_SOURCE = weston-$(WAYLAND_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng jpeg mtdev udev
+WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng \
+	jpeg mtdev udev cairo
 WESTON_CONF_OPT = \
 	--disable-egl \
 	--disable-xwayland \
