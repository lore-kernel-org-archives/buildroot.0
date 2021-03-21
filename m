From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 10:39:26 +0100
Subject: [Buildroot] [git commit] package/sdl_ttf: switch to github,
 update version
Message-ID: <20210321091652.2D027885B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ea69180e2d93932643d524593806dc9b52e5995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SDL's canonical source is now on GitHub. The git commit that matches
the Hg commit we used so far is b13aa509166e, but we switch to the
HEAD of the SDL-1.2 branch, which just has two additional commits
touching the autotools files.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
[yann.morin.1998 at free.fr:
 - explain why we don;t use the exactly-maching commit
  - use full-length commit hash
  - drop the comment: it did not point to the commit we used
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl_ttf/sdl_ttf.hash |  2 +-
 package/sdl_ttf/sdl_ttf.mk   | 12 ++----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/sdl_ttf/sdl_ttf.hash b/package/sdl_ttf/sdl_ttf.hash
index 97416c18c6..7c5a532660 100644
--- a/package/sdl_ttf/sdl_ttf.hash
+++ b/package/sdl_ttf/sdl_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f7bf5f6a4a21542a6ce5440dc0d81f3a26d029ee689e1fade62925b1e6667bd9  de50cffd41e6.tar.gz
+sha256  c24e3b48f5ffa5afb3256d23700506fad72117ac2834147c2e46ee94c3cb12b5  sdl_ttf-70b2940cc75e92aab02a67d2f827caf2836a2c74.tar.gz
 sha256  b609721d3d4ac67facaf86f068c8b311b6c5f6cef89b6d84268aa38b7867ab7b  COPYING
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 9ac12ef5b7..254000443c 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -6,16 +6,8 @@
 
 # There is unlikely to be a new SDL_ttf release for the foreseeable future:
 # https://bugzilla.libsdl.org/show_bug.cgi?id=5344#c1
-#
-# The unreleased version from HEAD as of 2020-11-09 has several bugfixes
-# and DPI scaling support:
-# https://hg.libsdl.org/SDL_ttf/rev/7dbd7cd826d6
-#
-# DPI scaling is used for rendering on HiDPI displays and displays
-# with non-square pixels.
-SDL_TTF_VERSION = de50cffd41e6
-SDL_TTF_SOURCE = $(SDL_TTF_VERSION).tar.gz
-SDL_TTF_SITE = https://hg.libsdl.org/SDL_ttf/archive
+SDL_TTF_VERSION = 70b2940cc75e92aab02a67d2f827caf2836a2c74
+SDL_TTF_SITE = $(call github,libsdl-org,SDL_ttf,$(SDL_TTF_VERSION))
 SDL_TTF_LICENSE = Zlib
 SDL_TTF_LICENSE_FILES = COPYING
 
