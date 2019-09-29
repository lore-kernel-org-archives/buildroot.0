From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:12:29 +0200
Subject: [Buildroot] [git commit] package/glmark2: drm support needs udev
Message-ID: <20190929070848.C407E82879@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf66a67112cd706d2e71665e45e8f6453fd53963
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream commit
https://github.com/glmark2/glmark2/commit/a7ae55dae4971af97bb71d38419089018c3671de
added a dependency for udev when the drm flavor is used.

Fixes:
http://autobuild.buildroot.net/results/01b/01b7374a5b7e66f2c369c7f93dae68353a3ffe81/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glmark2/glmark2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index c2b9265edb..7774cd2ab5 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -23,11 +23,11 @@ GLMARK2_FLAVORS += x11-gl
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES)$(BR2_PACKAGE_HAS_UDEV),yyy)
 GLMARK2_FLAVORS += drm-glesv2
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL),yy)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_HAS_UDEV),yyy)
 GLMARK2_FLAVORS += drm-gl
 endif
 
