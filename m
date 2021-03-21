From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 10:40:09 +0100
Subject: [Buildroot] [git commit] package/sdl_net: update to latest git tree
Message-ID: <20210321091652.4DE507F88D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24416dc3132cdc61f8941bb53db94d59c95aa9be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest officially released version of SDL_net is 1.2.8, released
in 2012. Since then, there have been several bugfixes.

SDL's canonical source is now on GitHub. This commit points to the
SDL-1.2 branch from 15 Mar 2021.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
[yann.morin.1998 at free.fr: use full-length commit hash]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl_net/sdl_net.hash | 2 +-
 package/sdl_net/sdl_net.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/sdl_net/sdl_net.hash b/package/sdl_net/sdl_net.hash
index 4f2e1ae76a..e2b64336ee 100644
--- a/package/sdl_net/sdl_net.hash
+++ b/package/sdl_net/sdl_net.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4  SDL_net-1.2.8.tar.gz
+sha256  7549dbc91813c37986300e7f34e63a068b42fd91abb41cabcaca63b4c7404ea5  SDL_net-620b0ba7dd84a0fdbd4cc8ef1b2be1cc10f90ae3.tar.gz
 sha256  e542f822a6cd82deccf82cf0f50192917b0158d725a6bc6348ab1ccdd890ecbe  COPYING
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index c7e409a183..5f014af19d 100644
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
+SDL_NET_VERSION = 620b0ba7dd84a0fdbd4cc8ef1b2be1cc10f90ae3
+SDL_NET_SITE = $(call github,libsdl-org,SDL_net,$(SDL_NET_VERSION))
 SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
 SDL_NET_LICENSE = Zlib
 SDL_NET_LICENSE_FILES = COPYING
