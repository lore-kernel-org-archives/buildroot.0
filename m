From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Sun, 21 Mar 2021 07:25:00 +0000
Subject: [Buildroot] [PATCH 1/1] package/sdl_image: Update to 14 Mar 2021
 version
Message-ID: <20210321072501.1749891-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest officially released version of SDL_image is 1.2.12, released in 2012.
Since then, there have been many bugfixes, including security fixes.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/sdl_image/sdl_image.hash | 2 +-
 package/sdl_image/sdl_image.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/sdl_image/sdl_image.hash b/package/sdl_image/sdl_image.hash
index 90e3040a17..24911517d9 100644
--- a/package/sdl_image/sdl_image.hash
+++ b/package/sdl_image/sdl_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699  SDL_image-1.2.12.tar.gz
+sha256  abaf55f6c3bbd7c7271b523767f360317f1fbb2a79e74c38c0523a123970ac89  sdl_image-5d792dde2f.tar.gz
 sha256  653649692218d56e5807bdc5b72f51aa6067bc44d30b757e18c03b32bcaf98da  COPYING
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 9ff9206b74..053e9c6950 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -4,9 +4,12 @@
 #
 ################################################################################
 
-SDL_IMAGE_VERSION = 1.2.12
-SDL_IMAGE_SOURCE = SDL_image-$(SDL_IMAGE_VERSION).tar.gz
-SDL_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
+# The latest officially released version of SDL_image is 1.2.12, released in 2012.
+# Since then, there have been many bugfixes, including security fixes.
+#
+# This commit points to the SDL-1.2 branch from 14 Mar 2021.
+SDL_IMAGE_VERSION = 5d792dde2f
+SDL_IMAGE_SITE = $(call github,libsdl-org,SDL_image,$(SDL_IMAGE_VERSION))
 SDL_IMAGE_INSTALL_STAGING = YES
 SDL_IMAGE_LICENSE = Zlib
 SDL_IMAGE_LICENSE_FILES = COPYING
-- 
2.27.0
