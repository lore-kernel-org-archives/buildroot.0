From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun, 21 Mar 2021 07:36:04 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl_net: Update to 14 Feb 2021
 version
Message-ID: <20210321073604.1757349-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest officially released version of SDL_net is 1.2.8, released in 2012.
Since then, there have been several bugfixes.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/sdl_net/sdl_net.hash | 2 +-
 package/sdl_net/sdl_net.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/sdl_net/sdl_net.hash b/package/sdl_net/sdl_net.hash
index 4f2e1ae76a..f43e30e907 100644
--- a/package/sdl_net/sdl_net.hash
+++ b/package/sdl_net/sdl_net.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4  SDL_net-1.2.8.tar.gz
+sha256  7549dbc91813c37986300e7f34e63a068b42fd91abb41cabcaca63b4c7404ea5  SDL_net-620b0ba7dd.tar.gz
 sha256  e542f822a6cd82deccf82cf0f50192917b0158d725a6bc6348ab1ccdd890ecbe  COPYING
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index c7e409a183..e415384c24 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-SDL_NET_VERSION = 1.2.8
-SDL_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
+# The latest officially released version of SDL_image is 1.2.8, released in 2012.
+# Since then, there have been several bugfixes.
+#
+# This commit points to the SDL-1.2 branch from 18 Feb 2021.
+SDL_NET_VERSION = 620b0ba7dd
+SDL_NET_SITE = $(call github,libsdl-org,SDL_net,$(SDL_NET_VERSION))
 SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
 SDL_NET_LICENSE = Zlib
 SDL_NET_LICENSE_FILES = COPYING
-- 
2.27.0
