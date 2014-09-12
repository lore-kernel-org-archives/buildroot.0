From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:20 +0200
Subject: [Buildroot] [git commit] sdl: remove dga support in no MMU
Message-ID: <20140913074255.B05C49D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efba6339b5211c1e2c1a3888509e6f020f385c76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DGA support use fork. This prevent executables to link with libSDL.so.

Fixes:
  http://sysmic.org/~jezz/results/5e50c243 (package sdl_mixer)
  http://sysmic.org/~jezz/results/734afef8 (package sdl_net)
  http://sysmic.org/~jezz/results/e2310eb9 (package sdl_image)
  http://sysmic.org/~jezz/results/e2cdcc9a (package sdl_sound)

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl/sdl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 8d0e5bd..77fbdd9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -53,6 +53,10 @@ else
 SDL_CONF_OPT += --enable-video-x11=no
 endif
 
+ifneq ($(BR2_USE_MMU),y)
+SDL_CONF_OPT += --enable-dga=no
+endif
+
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 SDL_DEPENDENCIES += tslib
 endif
