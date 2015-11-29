From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:26:39 +0100
Subject: [Buildroot] [git commit] package/glmark2: Wayland-gl support also
	needs egl
Message-ID: <20151129132644.895DC801A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f58cf6ddb25b347571ddb62c796a0545bbfc9805
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We were missing the egl dependency when enabling Wayland GL support:
https://github.com/glmark2/glmark2/blob/master/src/wscript_build#L28

Fixes
http://autobuild.buildroot.net/results/858/8587d0cea86efa4c6e98817cadc7cce0b1b36e3d/
http://autobuild.buildroot.net/results/1f6/1f6853d5f7a83be60ccdf4f071a1df1491cf8137/
http://autobuild.buildroot.net/results/a4d/a4d830291ee8550b3c544ade7169218d5edd4d52/
http://autobuild.buildroot.net/results/536/536a8dc62783633943770a278dc9f1c6c5c0807c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glmark2/glmark2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index a2e8852..bd5b51a 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -36,7 +36,7 @@ GLMARK2_DEPENDENCIES += wayland
 GLMARK2_FLAVORS += wayland-glesv2
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBGL),yy)
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL),yyy)
 GLMARK2_DEPENDENCIES += wayland
 GLMARK2_FLAVORS += wayland-gl
 endif
