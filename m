From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jan 2021 23:55:16 +0100
Subject: [Buildroot] [git commit] package/sdl_ttf: bump to de50cffd41e6
Message-ID: <20210102092300.24926841E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=731473d61b4a12e9ae35d2ccef0b5e78073ce306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is unlikely to be a new SDL_ttf release for the foreseeable future:
https://bugzilla.libsdl.org/show_bug.cgi?id=5344#c1

The unreleased version from HEAD as of 2020-11-09 has several bugfixes
and DPI scaling support:
https://hg.libsdl.org/SDL_ttf/rev/7dbd7cd826d6

DPI scaling is used for rendering on HiDPI displays and displays
with non-square pixels.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl_ttf/sdl_ttf.hash |  2 +-
 package/sdl_ttf/sdl_ttf.mk   | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/sdl_ttf/sdl_ttf.hash b/package/sdl_ttf/sdl_ttf.hash
index 86a15d6dd4..97416c18c6 100644
--- a/package/sdl_ttf/sdl_ttf.hash
+++ b/package/sdl_ttf/sdl_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  724cd895ecf4da319a3ef164892b72078bd92632a5d812111261cde248ebcdb7  SDL_ttf-2.0.11.tar.gz
+sha256  f7bf5f6a4a21542a6ce5440dc0d81f3a26d029ee689e1fade62925b1e6667bd9  de50cffd41e6.tar.gz
 sha256  b609721d3d4ac67facaf86f068c8b311b6c5f6cef89b6d84268aa38b7867ab7b  COPYING
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 1d94c6c5cf..9ac12ef5b7 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -4,9 +4,18 @@
 #
 ################################################################################
 
-SDL_TTF_VERSION = 2.0.11
-SDL_TTF_SOURCE = SDL_ttf-$(SDL_TTF_VERSION).tar.gz
-SDL_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
+# There is unlikely to be a new SDL_ttf release for the foreseeable future:
+# https://bugzilla.libsdl.org/show_bug.cgi?id=5344#c1
+#
+# The unreleased version from HEAD as of 2020-11-09 has several bugfixes
+# and DPI scaling support:
+# https://hg.libsdl.org/SDL_ttf/rev/7dbd7cd826d6
+#
+# DPI scaling is used for rendering on HiDPI displays and displays
+# with non-square pixels.
+SDL_TTF_VERSION = de50cffd41e6
+SDL_TTF_SOURCE = $(SDL_TTF_VERSION).tar.gz
+SDL_TTF_SITE = https://hg.libsdl.org/SDL_ttf/archive
 SDL_TTF_LICENSE = Zlib
 SDL_TTF_LICENSE_FILES = COPYING
 
